ORBAT_Diary = player createDiarySubject ["ORBAT_Diary", "ORBAT", "\A3\ui_f\data\igui\cfg\simpleTasks\types\meet_ca.paa"];

_getName = {
  getText (configFile >> "cfgWeapons" >> _this >> "displayName");
};

phx_safetyEndExpression = {
  [] spawn {
    private _result = true;

    if (!isServer) then {
      _result = ["Are you sure you want to end safestart?", "Confirm", true, true] call BIS_fnc_guiMessage;
    };

    if (_result) then {
      f_var_mission_timer = -1;
      publicVariableServer "f_var_mission_timer";
      systemChat "Ending Safe Start";
    };
  };
};

//Admin end start trigger
if (serverCommandAvailable "#kick") then {
  PHX_Diary = player createDiarySubject ["PHX_Diary_Admin_Safestart", "Admin", "\A3\ui_f\data\igui\cfg\simpleTasks\types\defend_ca.paa"];

  //display template version
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin",format ["Template Version: %1", phx_templateVersion]]];
  //end safety
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='call phx_safetyEndExpression'>End Safe Start</execute>"]];

  //-1 minute to safety
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='
    if !(f_var_mission_timer <= 1) then {
      f_var_mission_timer = f_var_mission_timer - 1;
      publicVariableServer ""f_var_mission_timer"";
    };
    systemChat format [""New safe start time: %1 mins"", f_var_mission_timer];
  '>-1 Minute to Safe Start</execute>"]];

  //+1 minute to safety
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='
    f_var_mission_timer = f_var_mission_timer + 1;
    publicVariableServer ""f_var_mission_timer"";
    systemChat format [""New safe start time: %1 mins"", f_var_mission_timer];
  '>+1 Minute to Safe Start</execute>"]];

  //remove admin diary subject once safety ends
  [{!(missionNamespace getVariable ["phx_safetyEnabled",true])}, {player removeDiarySubject "PHX_Diary_Admin_Safestart"}] call CBA_fnc_waitUntilAndExecute;
};

PHX_Diary_Details = player createDiarySubject ["PHX_Diary_Details", "Mission Details", "\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa"];

_varStr = "";

//show blufor uniform and headgear if side is present
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

  _varStr = _varStr + format ["BLUFOR MAT: %1", phx_bluAT call _getName] + "<br/>";
};

//show opfor uniform and headgear if side is present
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

  _varStr = _varStr + format ["OPFOR MAT: %1", phx_redAT call _getName] + "<br/>";
};

//show indfor uniform and headgear if side is present
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

  _varStr = _varStr + format ["INDFOR MAT: %1", phx_grnAT call _getName] + "<br/>";
};

//list some pertinent variables
if (phx_defendingSide != sideEmpty) then {
  _varStr = _varStr + "<br/>";
  _varStr = _varStr + format ["Defender fortify points: %1", phx_fortifyPoints];
};
_varStr = _varStr + "<br/>";
_varStr = _varStr + format ["Time limit: %1 minutes", phx_missionTimeLimit];
_varStr = _varStr + "<br/>";
_varStr = _varStr + format ["Safe start time: %1 minutes", phx_safeStartTime];
_varStr = _varStr + "<br/>";
_varStr = _varStr + "<br/>";
_varStr = _varStr + format ["Maximum view distance: %1m", phx_maxViewDistance];

player createDiaryRecord ["PHX_Diary_Details",["Vars",_varStr]];
[{!isNil "phx_overTimeConStr"}, {
  player createDiaryRecord ["PHX_Diary_Details",["Overtime Condition",phx_overTimeConStr]];
}] call CBA_fnc_waitUntilAndExecute;


player createDiaryRecord [
  "PHX_Diary_Details",
  [
    "Mode: ScavHunt",
    (
      "This is a neutral objective mode where each time has to capture and hold as many of the items present as possible. To capture an item, it must be loaded into one of the specifically-purposed transport vehicles using ACE interaction, then driven back to the side's capture zone and unloaded. At mission time end (40 minutes duration), the side with the most items in their zone will win." +
      "<br/><br/>" +
      "  - All objective items and their transport vehicles are invincible, though crew/passengers may still be killed by penetration or collision damage." +
      "<br/>" +
      "  - Items must be UNLOADED to count toward a team's score. Loading them again while in capture zone will REMOVE it from that team's score." +
      "<br/>" +
      "  - It will take approximately 33 seconds to complete a load or unload of an item. During this time, the player cannot move." +
      "<br/>" +
      "  - A map marker for each objective item will update its location every 3 seconds." +
      "<br/>" +
      "  - A transport vehicle can only carry one item at a time." +
      "<br/>" +
      "  - A player may NOT crew another side's transport vehicle. Attempts will result in (safe) ejection from the vehicle."
      "<br/><br/><br/>" +
      "OVERTIME CONDITION:" +
      "<br/><br/>" +
      "At the end of mission time, if two or more teams have an equal number of items captured, overtime will begin." +
      "<br/>" +
      "Overtime will continue until a leading side captures or loses an item."
    )
  ]
];


player createDiarySubject ["Utilities", "Utilities"];
player createDiaryRecord [
  "Utilities",
  [
    "Screenshots/UI",
    "<font face='PuristaMedium'><executeClose expression='showHUD [false,false,false,false,false,false,false,false,false,false,false]; diwako_dui_main_toggled_off=true; showChat false;'>Hide HUD</executeClose><br/><executeClose expression='showHUD [true,true,true,true,true,true,false,true,true,true,false]; diwako_dui_main_toggled_off=false; showChat true;'>Show HUD</executeClose></font>"
  ]
];

//call phx_fnc_objectiveRecon;

phx_briefCreated = true; //let phx_fnc_briefInit know the briefing is created
