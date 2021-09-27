




// MM briefing notes
private _systemTimeFormat = ["%1-%2-%3 %4:%5:%6"];
_systemTimeFormat append (systemTimeUTC apply {if (_x < 10) then {"0" + str _x} else {str _x}});

_mmNotes = [];

if (count phx_briefingBackground > 0) then {
  _mmNotes pushBack "<font size='18' color='#e1701a' face='PuristaBold'>BACKGROUND</font>";
  _mmNotes pushBack phx_briefingBackground;
  _mmNotes pushBack "<br/>";
};

if (count phx_briefingWorldInfo > 0) then {
  _mmNotes pushBack "<font size='18' color='#e1701a' face='PuristaBold'>AREA OF OPERATIONS</font>";
  _mmNotes pushBack phx_briefingWorldInfo;
  _mmNotes pushBack "<br/>";
};

if (count phx_briefingWorldInfo > 0) then {
  _mmNotes pushBack "<font size='18' color='#e1701a' face='PuristaBold'>NOTES</font>";
  _mmNotes pushBack phx_briefingNotes;
  _mmNotes pushBack "<br/>";
};

player createDiaryRecord ["Diary",
  [
    getText(missionConfigFile >> "Author"),
    _mmNotes joinString "<br/>"
  ],
  taskNull,
  "NONE",
  false
];



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
_varStr = _varStr + "<br/>";
private _magOpticsStr = "";
switch (phx_magnifiedOptics) do {
  case true: {_magOpticsStr = "Yes"};
  case false: {_magOpticsStr = "No"};
};
_varStr = _varStr + format ["Magnified optics: %1", _magOpticsStr];
_varStr = _varStr + "<br/>";
private _addNVGStr = "";
switch (phx_addNVG) do {
  case true: {_addNVGStr = "Yes"};
  case false: {_addNVGStr = "No"};
};
_varStr = _varStr + format ["NVGs equipped: %1", _addNVGStr];
_varStr = _varStr + "<br/>";
_varStr = _varStr + "<br/>";


// game mode details
_varStr = _varStr + format ["<font size='16' color='#e1701a' face='PuristaBold'>%1</font>", toUpper phx_gameMode];
_varStr = _varStr + "<br/>";

switch (phx_gameMode) do {
  case "destroy": {
    #include "..\..\mode_config\destroy.sqf";
    _objArr = [_obj1,_obj2,_obj3];
    _objects = [_obj1 select 0, _obj2 select 0, _obj3 select 0] select {!isNull _x};
    _varStr = _varStr + format ["Destroy objectives: %1", count _objects];
    _varStr = _varStr + "<br/>";
  };
  case "uplink": {
    #include "..\..\mode_config\uplink.sqf";

    _varStr = _varStr + format ["Terminal count: %1", _numberOfTerminals];
    _varStr = _varStr + "<br/>";

    if (_terminalHackTime isEqualType []) then {
      _varStr = _varStr + "Hack time:";
      _varStr = _varStr + "<br/>";
      for "_i" from 0 to _numberOfTerminals do {
        _varStr = _varStr + format ["  Terminal %1: %2", _i + 1, _terminalHackTime # _i];
        _varStr = _varStr + "<br/>";
      };
    } else {
      _varStr = _varStr + format ["Hack time: %1", _terminalHackTime];
      _varStr = _varStr + "<br/>";
    };
  };
  case "rush": {
    #include "..\..\mode_config\rush.sqf";
    _varStr = _varStr + format ["Terminal count: %1", _numberOfTerminals];
    _varStr = _varStr + "<br/>";

    if (_terminalHackTime isEqualType []) then {
      _varStr = _varStr + "Hack time:";
      for "_i" from 0 to _numberOfTerminals do {
        _varStr = _varStr + format ["Terminal %1: %2", _i + 1, _terminalHackTime # _i];
        _varStr = _varStr + "<br/>";
      };
    } else {
      _varStr = _varStr + format ["Hack time: %1", _terminalHackTime];
      _varStr = _varStr + "<br/>";
    };
  };
  case "connection": {
    #include "..\..\mode_config\connection.sqf";
    _varStr = _varStr + format ["Terminal count: %1", _numberOfTerminals];
    _varStr = _varStr + "<br/>";

    _varStr = _varStr + format ["One point accrued per terminal every %1 seconds", _pointAddTime];
    _varStr = _varStr + "<br/>";
  };
  case "captureTheFlag": {
    #include "..\..\mode_config\ctf.sqf";

    private _capZoneShown = "";
    switch (_showCapZoneGlobal) do {
      case true: {_capZoneShown = "to all players at mission start"};
      case false: {_capZoneShown = "only to attackers until flag is touched"};
    };
    _varStr = _varStr + format ["Capture zone visible %1", _capZoneShown];
    _varStr = _varStr + "<br/>";

    _varStr = _varStr + format ["Flag marker updated every %1 seconds", _flagMarkUpdateTime];
    _varStr = _varStr + "<br/>";

    _varStr = _varStr + format ["Attackers must hold the flag in capture zone for %1 seconds to achieve victory", _flagCaptureTime];
    _varStr = _varStr + "<br/>";

  };
  case "adSector": {
    #include "..\..\mode_config\adSector.sqf";
    _varStr = _varStr + format ["Sector count: %1", _numberOfSectors];
    _varStr = _varStr + "<br/>";

    private _isSequential = "";
    switch (_inOrder) do {
      case true: {_isSequential = "Yes"};
      case false: {_isSequential = "No"};
    };
    _varStr = _varStr + format ["Sequential: %1", _isSequential];
    _varStr = _varStr + "<br/>";
  };
  case "neutralSector": {
    #include "..\..\mode_config\neutralSector.sqf";
    _varStr = _varStr + format ["Sector count: %1", _numberOfSectors];
    _varStr = _varStr + "<br/>";

    _varStr = _varStr + format ["One point accrued per sector every %1 seconds", _pointAddTime];
    _varStr = _varStr + "<br/>";
  };
  case "scavHunt": {
    #include "..\..\mode_config\scavHunt.sqf";
    _varStr = _varStr + format ["Objective count: %1", _numberOfObjectives];
    _varStr = _varStr + "<br/>";

    _varStr = _varStr + format ["Specialized transports per side: %1", _numberOfTransportsPerSide];
    _varStr = _varStr + "<br/>";
  };
};

player createDiaryRecord ["PHX_Diary_Details",["Mission Variables",_varStr]];
[{!isNil "phx_overTimeConStr"}, {
  player createDiaryRecord ["PHX_Diary_Details",["Overtime Condition",phx_overTimeConStr]];
}] call CBA_fnc_waitUntilAndExecute;


if (phx_gameMode isEqualTo "scavHunt") then {
  player createDiaryRecord [
    "PHX_Diary_Details",
    [
      "Game Mode: ScavHunt",
      (
        "This is a neutral objective mode where each team has to capture as many of the objective items as possible before the other teams.<br/><br/>To capture an item, it must be loaded into one of the specifically-purposed transport vehicles using ACE interaction, then driven back to the side's capture zone and unloaded. An item will count towards the team's score and it will no longer be interactable with. STEALING ANOTHER SIDE'S CAPTURED ITEMS IS NO LONGER POSSIBLE. At mission time end (40 minutes duration), the side with the most items in their zone will win. If a side captures more than 50% of the objectives on the field, they will instantly win." +
        "<br/><br/>" +
        "  - Capture zones are only visible to their owning side, until any side scores or 15 minutes after safe start ends." +
        "<br/>" +
        "  - Objectives will be marked on the map at fixed intervals, with the first starting right after safe start. Unmarked objectives are still capturable, if you can find them." +
        "<br/>" +
        "  - By the final 15 minutes of the round, all uncaptured objectives will have been marked on the map." +
        "<br/>" +
        "  - All objective items and their transport vehicles are invincible, though crew/passengers may still be killed by penetration or collision damage." +
        "<br/>" +
        "  - Items must be UNLOADED to count toward a team's score. Loading them again while in capture zone will REMOVE it from that team's score." +
        "<br/>" +
        "  - It will take approximately 33 seconds to complete a load or unload of an item. During this time, the player cannot move." +
        "<br/>" +
        "  - If you can't ACE interact with an objective item, try moving the transport closer." +
        "<br/>" +
        "  - A map marker for each objective item will update its location every 3 seconds." +
        "<br/>" +
        "  - A transport vehicle can only carry one item at a time." +
        "<br/>" +
        "  - A player may NOT crew another side's transport vehicle. Attempts will result in (safe) ejection from the vehicle." +
        "<br/><br/><br/>" +
        "OVERTIME CONDITION:" +
        "<br/><br/>" +
        "At the end of mission time, if two or more teams have an equal number of items captured, overtime will begin." +
        "<br/>" +
        "Overtime will continue until a leading side captures an additional item."
      )
    ]
  ];
};


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
