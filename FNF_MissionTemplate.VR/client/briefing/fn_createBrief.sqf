ORBAT_Diary = player createDiarySubject ["ORBAT_Diary", "ORBAT", "\A3\ui_f\data\igui\cfg\simpleTasks\types\meet_ca.paa"];
PHX_Diary_Details = player createDiarySubject ["PHX_Diary_Details", "Mission Details", "\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa"];
PHX_Diary_Uniforms = player createDiarySubject ["PHX_Diary_Uniforms", "Uniforms", "\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa"];

//Admin end start trigger
if (serverCommandAvailable "#kick") then {
  PHX_Diary = player createDiarySubject ["PHX_Diary_Admin_Safestart", "Admin", "\A3\ui_f\data\igui\cfg\simpleTasks\types\defend_ca.paa"];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='f_var_mission_timer = -1; publicVariableServer ""f_var_mission_timer""; systemChat ""Ending Safe Start"";'>End Safe Start</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='
  if !(f_var_mission_timer <= 1) then {
    f_var_mission_timer = f_var_mission_timer - 1;
    publicVariableServer ""f_var_mission_timer"";
  };
  systemChat format [""New safe start time: %1 mins"", f_var_mission_timer];
  '>-1 Minute to Safe Start</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='f_var_mission_timer = f_var_mission_timer + 1; publicVariableServer ""f_var_mission_timer""; systemChat format [""New safe start time: %1 mins"", f_var_mission_timer];'>+1 Minute to Safe Start</execute>"]];

  [{!(missionNamespace getVariable ["phx_safetyEnabled",true])}, {player removeDiarySubject "PHX_Diary_Admin_Safestart"}] call CBA_fnc_waitUntilAndExecute;
};

//Populate uniform diary record with an image of the uniform for each present side
_createUniformRecord = {
  _gearStr = "phx_gearset_" + _this;
  _gearVar = missionNamespace getVariable [_gearStr,""];

  player createDiaryRecord ["PHX_Diary_Uniforms", [toUpper _this,
  format ["<img width='400' height='400' image='%1'/>", format ["\fnf_ww2\images\gear\%1.paa", _gearVar]]
  ]];
};

if (playableSlotsNumber independent > 0) then {
  "indfor" call _createUniformRecord;
};
if (playableSlotsNumber opfor > 0) then {
  "opfor" call _createUniformRecord;
};
if (playableSlotsNumber blufor > 0) then {
  "blufor" call _createUniformRecord;
};

//Populate mission details diary record
private _varStr = "";

if (phx_defendingSide != sideEmpty) then {
  _varStr = _varStr + "<br/>";
  _varStr = _varStr + format ["Defender fortify points: %1", phx_fortifyPoints];
};
_varStr = _varStr + "<br/>";
_varStr = _varStr + format ["Time limit: %1 minutes", phx_missionTimeLimit];
_varStr = _varStr + "<br/>";
_varStr = _varStr + format ["Maximum view distance: %1m", phx_maxViewDistance];

player createDiaryRecord ["PHX_Diary_Details",["Vars",_varStr]];
[{!isNil "phx_overTimeConStr"}, {
  player createDiaryRecord ["PHX_Diary_Details",["Overtime Condition",phx_overTimeConStr]];
}] call CBA_fnc_waitUntilAndExecute;

phx_briefCreated = true;
