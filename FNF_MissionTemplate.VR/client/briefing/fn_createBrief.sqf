ORBAT_Diary = player createDiarySubject ["ORBAT_Diary", "ORBAT"];

//Admin end start trigger
if (serverCommandAvailable "#kick") then {
  PHX_Diary = player createDiarySubject ["PHX_Diary_Admin_Safestart", "Admin"];
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

PHX_Diary_Details = player createDiarySubject ["PHX_Diary_Details", "Mission Details"];

_varStr = "";

if (!isNil "phx_briefing_west_uniform" || !isNil "phx_briefing_west_headgear") then {
  _uniformImg = getText (configFile >> "cfgWeapons" >> phx_briefing_west_uniform >> "picture");
  _helmetImg = getText (configFile >> "cfgWeapons" >> phx_briefing_west_headgear >> "picture");

  player createDiaryRecord ["PHX_Diary_Details",["BLUFOR Uniform",
  format ["BLUFOR Helmet:<br/><br/>
  <img width='178' height='178' image='%2'/>
  <br/><br/>
  BLUFOR Uniform:<br/><br/>
  <img width='356' height='356' image='%1'/>
  ", _uniformImg, _helmetImg]
  ]];

  _varStr = _varStr + format ["BLUFOR Weapons: %1", phx_bluforWeapons select [8, count phx_bluforWeapons]] + "<br/>";
  _varStr = _varStr + format ["BLUFOR MAT: %1", phx_bluAT] + "<br/>";
};

if (!isNil "phx_briefing_east_uniform" || !isNil "phx_briefing_east_headgear") then {
  _uniformImg = getText (configFile >> "cfgWeapons" >> phx_briefing_east_uniform >> "picture");
  _helmetImg = getText (configFile >> "cfgWeapons" >> phx_briefing_east_headgear >> "picture");

  player createDiaryRecord ["PHX_Diary_Details",["OPFOR Uniform",
  format ["OPFOR Helmet:<br/><br/>
  <img width='178' height='178' image='%2'/>
  <br/><br/>
  OPFOR Uniform:<br/><br/>
  <img width='356' height='356' image='%1'/>
  ", _uniformImg, _helmetImg]
  ]];

  _varStr = _varStr + format ["OPFOR Weapons: %1", phx_opforWeapons select [8, count phx_opforWeapons]] + "<br/>";
  _varStr = _varStr + format ["OPFOR MAT: %1", phx_redAT] + "<br/>";
};

if (!isNil "phx_briefing_ind_uniform" || !isNil "phx_briefing_ind_headgear") then {
  _uniformImg = getText (configFile >> "cfgWeapons" >> phx_briefing_ind_uniform >> "picture");
  _helmetImg = getText (configFile >> "cfgWeapons" >> phx_briefing_ind_headgear >> "picture");

  player createDiaryRecord ["PHX_Diary_Details",["INDFOR Uniform",
  format ["INDFOR Helmet:<br/><br/>
  <img width='178' height='178' image='%2'/>
  <br/><br/>
  INDFOR Uniform:<br/><br/>
  <img width='356' height='356' image='%1'/>
  ", _uniformImg, _helmetImg]
  ]];

  _varStr = _varStr + format ["INDFOR Weapons: %1", phx_indforWeapons select [8, count phx_indforWeapons]] + "<br/>";
  _varStr = _varStr + format ["INDFOR MAT: %1", phx_grnAT] + "<br/>";
};

_varStr = _varStr + "<br/>";
_varStr = _varStr + format ["Time limit: %1 minutes", phx_missionTimeLimit];
_varStr = _varStr + "<br/>";
_varStr = _varStr + format ["Safe start time: %1 minutes", phx_safeStartTime];
_varStr = _varStr + "<br/>";
_varStr = _varStr + format ["Defenders fortify allowed: %1", phx_allowFortify];

player createDiaryRecord ["PHX_Diary_Details",["Vars",_varStr]];
[{!isNil "phx_overTimeConStr"}, {
  player createDiaryRecord ["PHX_Diary_Details",["Overtime Condition",phx_overTimeConStr]];
}] call CBA_fnc_waitUntilAndExecute;

phx_briefCreated = true;
