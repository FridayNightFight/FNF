




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

if (count phx_briefingNotes > 0) then {
  _mmNotes pushBack "<font size='18' color='#e1701a' face='PuristaBold'>NOTES</font>";
  _mmNotes pushBack phx_briefingNotes;
  _mmNotes pushBack "<br/>";
};

if (count phx_briefingRules > 0) then {
  _mmNotes pushBack "<font size='18' color='#e1701a' face='PuristaBold'>MISSION RULES</font>";
  _mmNotes pushBack phx_briefingRules;
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
  if (_this isEqualTo "") exitWith {""};
  getText (configFile >> "cfgWeapons" >> _this >> "displayName");
};

fnc_getItemInfo = {
  private _thisCfg = _this call CBA_fnc_getItemConfig;
  private _dispName = [_thisCfg] call BIS_fnc_displayName;
  private _desc = getText(_thisCfg >> "descriptionShort");
  private _pic = (_thisCfg >> "picture") call BIS_fnc_getCfgData;
  [
    ["config",_thisCfg],
    ["displayName",_dispName],
    ["description",_desc],
    ["picture",_pic]
  ]
};

_fnc_parseMATForBriefing = {
  params ["_side", "_bravoOption", "_deltaOption"];
  private _out = [];
  private "_gearLoadout";
  switch (_side) do {
    case east: {_gearLoadout = phx_opforGear};
    case west: {_gearLoadout = phx_bluforGear};
    case independent: {_gearLoadout = phx_indforGear};
  };
  {
    _x params ["_setting", "_role"];
    "debug_console" callExtension str(_x);
    if (count _setting > 0) then {
      if (_setting # 0 isEqualTo "GEARDEFAULT") then {
        // "debug_console" callExtension str([_gearLoadout,_role,phx_bluAT_Bravo]);
        _data = (missionConfigFile >> "CfgLoadouts" >> "GEAR" >> _gearLoadout >> _role >> "defaultMAT") call BIS_fnc_getCfgDataArray;
        //  "debug_console" callExtension str(_data);
        _out pushBack (_data # 0);
      } else {
        _out pushBack (_setting # 0);
      };
    } else {
      _out pushBack "";
    };
  } forEach [
    [_bravoOption, "MAT1"],
    [_deltaOption, "MAT2"]
  ];

  _out
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
if (!isNil "phx_briefing_west_uniform" || !isNil "phx_briefing_west_headgear" || !isNil "phx_briefing_west_uniformMeta") then {
  _helmetImg = [];
  _vestImg = [];
  _uniformImg = [];
  {
    _helmetImg pushBack format["<img width='110' image='%1'/>", [_x call fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
  } forEach phx_briefing_west_headgear;
  {
    _vestImg pushBack format["<img width='110' image='%1'/>", [_x call fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
  } forEach phx_briefing_west_vest;
  {
    _uniformImg pushBack format["<img width='110' image='%1'/>", [_x call fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
  } forEach phx_briefing_west_uniform;

  private _meta = +phx_briefing_west_uniformMeta;

  // "debug_console" callExtension str(phx_briefing_west_vest call fnc_getItemInfo);

  player createDiaryRecord [
    "PHX_Diary_Details",
    [
      "BLUFOR Uniform",
      format ["<font size='24' shadow='1' color='#f6dcbf' face='PuristaBold'>%4</font><br/>
<font size='14'>%5</font><br/>
Author: %6<br/><br/>
%1<br/>
%2<br/>
%3
",
        _helmetImg joinString "",
        _vestImg joinString "",
        _uniformImg joinString "",
        _meta # 0,
        _meta # 1,
        _meta # 2
      ]
    ]
  ];

   // BLUFOR MAT
  ([west, phx_bluAT_Bravo, phx_bluAT_Delta] call _fnc_parseMATForBriefing) params ["_bravoClass", "_deltaClass"];
  private _bravoMeta = _bravoClass call fnc_getItemInfo;
  private _deltaMeta = _deltaClass call fnc_getItemInfo;

  _varStr = _varStr + format [
    "BLUFOR MAT 1: <font color='#4de4ff'>%1</font><br/><img width='120' image='%2'/><br/>%3",
    [_bravoMeta, "displayName"] call BIS_fnc_getFromPairs,
    [_bravoMeta, "picture"] call BIS_fnc_getFromPairs,
    [_bravoMeta, "description"] call BIS_fnc_getFromPairs
  ] + "<br/><br/>";
  _varStr = _varStr + format [
    "BLUFOR MAT 2: <font color='#4de4ff'>%1</font><br/><img width='120' image='%2'/><br/>%3",
    [_deltaMeta, "displayName"] call BIS_fnc_getFromPairs,
    [_deltaMeta, "picture"] call BIS_fnc_getFromPairs,
    [_deltaMeta, "description"] call BIS_fnc_getFromPairs
  ] + "<br/><br/>";
};

// show BLUFOR loadout
[{!isNil "phx_briefing_west_loadout"}, {
  player createDiaryRecord [
    "PHX_Diary_Details",
    [
      "BLUFOR Loadout",
      format [
        "<font size='24' shadow='1' color='#f6dcbf' face='PuristaBold'>%1</font><br/>%2",
        phx_briefing_west_loadout # 0 # 0,
        phx_briefing_west_loadout call phx_fnc_briefingParseLoadout
      ]
    ]
  ];
}] call CBA_fnc_waitUntilAndExecute;




//show opfor uniform and headgear if side is present
if (!isNil "phx_briefing_east_uniform" || !isNil "phx_briefing_east_headgear" || !isNil "phx_briefing_east_uniformMeta") then {
  _helmetImg = [];
  _vestImg = [];
  _uniformImg = [];
  {
    _helmetImg pushBack format["<img width='110' image='%1'/>", [_x call fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
  } forEach phx_briefing_east_headgear;
  {
    _vestImg pushBack format["<img width='110' image='%1'/>", [_x call fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
  } forEach phx_briefing_east_vest;
  {
    _uniformImg pushBack format["<img width='110' image='%1'/>", [_x call fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
  } forEach phx_briefing_east_uniform;

  private _meta = +phx_briefing_east_uniformMeta;

  // "debug_console" callExtension str(phx_briefing_east_vest call fnc_getItemInfo);

  player createDiaryRecord [
    "PHX_Diary_Details",
    [
      "OPFOR Uniform",
      format ["<font size='24' shadow='1' color='#f6dcbf' face='PuristaBold'>%4</font><br/>
<font size='14'>%5</font><br/>
Author: %6<br/><br/>
%1<br/>
%2<br/>
%3
",
        _helmetImg joinString "",
        _vestImg joinString "",
        _uniformImg joinString "",
        _meta # 0,
        _meta # 1,
        _meta # 2
      ]
    ]
  ];

   // OPFOR MAT
  ([east, phx_redAT_Bravo, phx_redAT_Delta] call _fnc_parseMATForBriefing) params ["_bravoClass", "_deltaClass"];
  private _bravoMeta = _bravoClass call fnc_getItemInfo;
  private _deltaMeta = _deltaClass call fnc_getItemInfo;

  _varStr = _varStr + format [
    "OPFOR MAT 1: <font color='#4de4ff'>%1</font><br/><img width='120' image='%2'/><br/>%3",
    [_bravoMeta, "displayName"] call BIS_fnc_getFromPairs,
    [_bravoMeta, "picture"] call BIS_fnc_getFromPairs,
    [_bravoMeta, "description"] call BIS_fnc_getFromPairs
  ] + "<br/><br/>";
  _varStr = _varStr + format [
    "OPFOR MAT 2: <font color='#4de4ff'>%1</font><br/><img width='120' image='%2'/><br/>%3",
    [_deltaMeta, "displayName"] call BIS_fnc_getFromPairs,
    [_deltaMeta, "picture"] call BIS_fnc_getFromPairs,
    [_deltaMeta, "description"] call BIS_fnc_getFromPairs
  ] + "<br/><br/>";
};

// show OPFOR loadout
[{!isNil "phx_briefing_east_loadout"}, {
  player createDiaryRecord [
    "PHX_Diary_Details",
    [
      "OPFOR Loadout",
      format [
        "<font size='24' shadow='1' color='#f6dcbf' face='PuristaBold'>%1</font><br/>%2",
        phx_briefing_east_loadout # 0 # 0,
        phx_briefing_east_loadout call phx_fnc_briefingParseLoadout
      ]
    ]
  ];
}] call CBA_fnc_waitUntilAndExecute;



//show indfor uniform and headgear if side is present
if (!isNil "phx_briefing_ind_uniform" || !isNil "phx_briefing_ind_headgear" || !isNil "phx_briefing_ind_uniformMeta") then {
  _helmetImg = [];
  _vestImg = [];
  _uniformImg = [];
  {
    _helmetImg pushBack format["<img width='110' image='%1'/>", [_x call fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
  } forEach phx_briefing_ind_headgear;
  {
    _vestImg pushBack format["<img width='110' image='%1'/>", [_x call fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
  } forEach phx_briefing_ind_vest;
  {
    _uniformImg pushBack format["<img width='110' image='%1'/>", [_x call fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
  } forEach phx_briefing_ind_uniform;

  private _meta = +phx_briefing_ind_uniformMeta;

  // "debug_console" callExtension str(phx_briefing_ind_vest call fnc_getItemInfo);

  player createDiaryRecord [
    "PHX_Diary_Details",
    [
      "INDFOR Uniform",
      format ["<font size='24' shadow='1' color='#f6dcbf' face='PuristaBold'>%4</font><br/>
<font size='14'>%5</font><br/>
Author: %6<br/><br/>
%1<br/>
%2<br/>
%3
",
        _helmetImg joinString "",
        _vestImg joinString "",
        _uniformImg joinString "",
        _meta # 0,
        _meta # 1,
        _meta # 2
      ]
    ]
  ];

   // INDFOR MAT
  ([independent, phx_grnAT_Bravo, phx_grnAT_Delta] call _fnc_parseMATForBriefing) params ["_bravoClass", "_deltaClass"];
  private _bravoMeta = _bravoClass call fnc_getItemInfo;
  private _deltaMeta = _deltaClass call fnc_getItemInfo;

  _varStr = _varStr + format [
    "INDFOR MAT 1: <font color='#4de4ff'>%1</font><br/><img width='120' image='%2'/><br/>%3",
    [_bravoMeta, "displayName"] call BIS_fnc_getFromPairs,
    [_bravoMeta, "picture"] call BIS_fnc_getFromPairs,
    [_bravoMeta, "description"] call BIS_fnc_getFromPairs
  ] + "<br/><br/>";
  _varStr = _varStr + format [
    "INDFOR MAT 2: <font color='#4de4ff'>%1</font><br/><img width='120' image='%2'/><br/>%3",
    [_deltaMeta, "displayName"] call BIS_fnc_getFromPairs,
    [_deltaMeta, "picture"] call BIS_fnc_getFromPairs,
    [_deltaMeta, "description"] call BIS_fnc_getFromPairs
  ] + "<br/><br/>";
};

// show INDFOR loadout
[{!isNil "phx_briefing_ind_loadout"}, {
  player createDiaryRecord [
    "PHX_Diary_Details",
    [
      "INDFOR Loadout",
      format [
        "<font size='24' shadow='1' color='#f6dcbf' face='PuristaBold'>%1</font><br/>%2",
        phx_briefing_ind_loadout # 0 # 0,
        phx_briefing_ind_loadout call phx_fnc_briefingParseLoadout
      ]
    ]
  ];
}] call CBA_fnc_waitUntilAndExecute;




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
  case 1: {_magOpticsStr = "Yes"};
  case 0: {_magOpticsStr = "No"};
};
_varStr = _varStr + format ["Magnified optics: %1", _magOpticsStr];
_varStr = _varStr + "<br/>";
private _addNVGStr = "";
switch (phx_addNVG) do {
  case 1: {_addNVGStr = "Yes"};
  case 0: {_addNVGStr = "No"};
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
    {
      _varStr = _varStr + format[
        "Objective %1:<br/><img image='%2' height=200/><br/>",
        _forEachIndex + 1,
        getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "EditorPreview")
      ];
    } forEach _objects;

    player createDiaryRecord [
      "PHX_Diary_Details",
      [
        "Game Mode: Destroy",
        (
          "Attack/Defend game mode with between 1 and 3 objectives, which can be any object in the game (default: an ammo cache)." +
          "<br/>" +
          "Attackers must destroy them by any means necessary and in any order, defenders must prevent them from doing so." +
          "<br/><br/><br/>" +
          "See the ""Mission Variables"" tab for this mission's configured game mode settings."
        )
      ]
    ];
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

    player createDiaryRecord [
      "PHX_Diary_Details",
      [
        "Game Mode: Uplink",
        (
          "Attackers need to hack 1 to 3 data terminals in any order to win." +
          "<br/>" +
          "Terminals can be hacked by interacting with them, after which there is a countdown of a X seconds (default: 90) before they explode." +
          "<br/>" +
          "Defenders are able to pause a hack by interacting with the terminals, but the countdown will not be reset." +
          "<br/><br/><br/>" +
          "See the ""Mission Variables"" tab for this mission's configured game mode settings."
        )
      ]
    ];
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

    player createDiaryRecord [
      "PHX_Diary_Details",
      [
        "Game Mode: Rush",
        (
          "Attackers need to hack 1 to 3 data terminals in sequential order to win." +
          "<br/>" +
          "Terminals can be hacked by interacting with them, after which there is a countdown of a X seconds (default: 90) before they explode." +
          "<br/>" +
          "Defenders are able to pause a hack by interacting with the terminals, but the countdown will not be reset." +
          "<br/><br/><br/>" +
          "See the ""Mission Variables"" tab for this mission's configured game mode settings."
        )
      ]
    ];
  };
  case "connection": {
    #include "..\..\mode_config\connection.sqf";
    _varStr = _varStr + format ["Terminal count: %1", _numberOfTerminals];
    _varStr = _varStr + "<br/>";

    _varStr = _varStr + format ["One point accrued per terminal every %1 seconds", _pointAddTime];
    _varStr = _varStr + "<br/>";

    player createDiaryRecord [
      "PHX_Diary_Details",
      [
        "Game Mode: Connection",
        (
          "Neutral game mode that has between 1 and 3 data terminal objectives, which must be hacked by interacting with them." +
          "<br/>" +
          "Once a side has hacked a terminal they will start to accrue a point every X seconds (default: 40) and the first team to 100 points wins." +
          "<br/><br/><br/>" +
          "See the ""Mission Variables"" tab for this mission's configured game mode settings."
        )
      ]
    ];
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

    player createDiaryRecord [
      "PHX_Diary_Details",
      [
        "Game Mode: Capture The Flag",
        (
          "Classic capture the flag mode. Attacking team needs to control the flag, bring it back to their capture zone and hold it there for X seconds (default: 600 = 10 min)." +
          "<br/>" +
          "The flag capture countdown will not start until the flag is removed from a vehicle or player's hands and placed in the capture zone." +
          "<br/>" +
          "The defending team will not know where the capture zone is until the attackers have the flag, at which point its location will be updated globally every X seconds (default: 15)." +
          "<br/>" +
          "Note that the flag carrier is only able to move at 65% normal speed." +
          "<br/><br/><br/>" +
          "See the ""Mission Variables"" tab for this mission's configured game mode settings."
        )
      ]
    ];
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

    player createDiaryRecord [
      "PHX_Diary_Details",
      [
        "Game Mode: A/D Sector",
        (
          "Attack/defend sector control mode. Attackers need to capture 1 to 3 sectors to win which are either set to sequential or non-sequential (default: non-sequential)." +
          "<br/>" +
          "A sector is captured if there is at least one dismounted attacker in the sector and no conscious defenders.  Upon capture, sectors disappear and cannot be re-captured by the defenders." +
          "<br/><br/><br/>" +
          "See the ""Mission Variables"" tab for this mission's configured game mode settings."
        )
      ]
    ];
  };
  case "neutralSector": {
    #include "..\..\mode_config\neutralSector.sqf";
    _varStr = _varStr + format ["Sector count: %1", _numberOfSectors];
    _varStr = _varStr + "<br/>";

    _varStr = _varStr + format ["One point accrued per sector every %1 seconds", _pointAddTime];
    _varStr = _varStr + "<br/>";

    player createDiaryRecord [
      "PHX_Diary_Details",
      [
        "Game Mode: Neutral Sector",
        (
          "Neutral game mode that has between 1 and 3 sectors. Sectors are captured when one team has the majority of conscious, dismounted players within it.<br/>1 point will be added to a team's total score for each sector they control, for every X seconds they control it. The defaults are:" +
          "<br/><br/>" +
          "1 sector: 12 seconds.<br/>2 sectors: 15.6 seconds.<br/>3 sectors: 19.2 seconds." +
          "<br/><br/>" +
          "The first team to 100 points wins." +
          "<br/><br/><br/>" +
          "See the ""Mission Variables"" tab for this mission's configured game mode settings."
        )
      ]
    ];
  };
  case "scavHunt": {
    #include "..\..\mode_config\scavHunt.sqf";
    _varStr = _varStr + format ["Objective count: %1", _numberOfObjectives];
    _varStr = _varStr + "<br/>";

    _varStr = _varStr + format ["Specialized transports per side: %1", _numberOfTransportsPerSide];
    _varStr = _varStr + "<br/>";

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


// player createDiarySubject ["Utilities", "Utilities"];
// player createDiaryRecord [
//   "Utilities",
//   [
//     "Screenshots/UI",
//     "<font face='PuristaMedium'><executeClose expression='showHUD [false,false,false,false,false,false,false,false,false,false,false]; diwako_dui_main_toggled_off=true; showChat false;'>Hide HUD</executeClose><br/><executeClose expression='showHUD [true,true,true,true,true,true,false,true,true,true,false]; diwako_dui_main_toggled_off=false; showChat true;'>Show HUD</executeClose></font>"
//   ]
// ];

//call phx_fnc_objectiveRecon;

phx_briefCreated = true; //let phx_fnc_briefInit know the briefing is created
