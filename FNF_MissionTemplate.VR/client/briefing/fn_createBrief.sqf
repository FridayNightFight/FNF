/*
* Author: IndigoFox, Martin
*
* Description:
* Primary entry point for players to generate briefing notes. Creates diary subjects and fills w/ appropriate records.
*
* Arguments:
* /NONE/
*
* Return Value:
* true on success <BOOLEAN>
*
* Example:
* call fnf_briefing_fnc_createBrief;
*
* Public: No
*/


ORBAT_Diary = player createDiarySubject ["ORBAT_Diary", "ORBAT", "\A3\ui_f\data\igui\cfg\simpleTasks\types\meet_ca.paa"];

// colors: https://imgur.com/a/AfimbU2
#define COLOR1 "#944509"
#define COLOR2 "#FF8E38"
#define COLOR3 "#E0701B"
#define COLOR4 "#008394"
#define COLOR5 "#1BCAE0"


// remove existing addon entries
[{player diarySubjectExists "Radio"}, {player removeDiarySubject "Radio"}] call cba_fnc_waitUntilAndExecute;
[{player diarySubjectExists "cba_help_docs"}, {player removeDiarySubject "cba_help_docs"}] call cba_fnc_waitUntilAndExecute;

_getName = {
  if (_this isEqualTo "") exitWith {""};
  getText (configFile >> "cfgWeapons" >> _this >> "displayName");
};


//Admin end start trigger
// if (serverCommandAvailable "#kick") then {
if (getPlayerUID player in (missionNamespace getVariable ["fnf_staffInfo",[]]) || serverCommandAvailable "#kick") then {
  fnf_Diary = player createDiarySubject ["fnf_Diary_Admin_Safestart", "Admin", "\A3\ui_f\data\igui\cfg\simpleTasks\types\defend_ca.paa"];

  //display template version
  player createDiaryRecord ["fnf_Diary_Admin_Safestart", ["Admin",format ["Template Version: %1", fnf_templateVersion]]];
  //end safety
  player createDiaryRecord ["fnf_Diary_Admin_Safestart", ["Admin","<execute expression='call fnf_admin_fnc_safetyEndExpression'>End Safe Start</execute>"]];

  //-1 minute to safety
  player createDiaryRecord ["fnf_Diary_Admin_Safestart", ["Admin","<execute expression='
    [""FNF_Safety_Reduce1Minute""] call CBA_fnc_serverEvent;
  '>-1 Minute to Safe Start</execute>"]];

  //+1 minute to safety
  player createDiaryRecord ["fnf_Diary_Admin_Safestart", ["Admin","<execute expression='
    [""FNF_Safety_Add1Minute""] call CBA_fnc_serverEvent;
  '>+1 Minute to Safe Start</execute>"]];

  //remove admin diary subject once safety ends
  [{!(missionNamespace getVariable ["fnf_safetyEnabled",true])}, {player removeDiarySubject "fnf_Diary_Admin_Safestart"}] call CBA_fnc_waitUntilAndExecute;

};


// fnf_Diary_Details = player createDiarySubject ["fnf_Diary_Details", "Mission Details", "\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa"];


private _MATDataString = "";
_varStr = "";
_varStrStruct = [];

//show blufor uniform and headgear if side is present
if (!isNil "fnf_briefing_west_uniform" || !isNil "fnf_briefing_west_headgear" || !isNil "fnf_briefing_west_uniformMeta" && !isNil "fnf_briefing_west_loadout") then {

  _MATDataString = _MATDataString + ([west, fnf_bluAT_Bravo, fnf_bluAT_Delta] call fnf_briefing_fnc_parseMAT) + "---------------------------------------------<br/>";

  // show BLUFOR loadout
  fnf_briefing_loadoutBLU = {
    _helmetImg = [];
    _vestImg = [];
    _uniformImg = [];
    {
      _helmetImg pushBack format["<img width='110' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_west_headgear;
    {
      _vestImg pushBack format["<img width='110' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_west_vest;
    {
      _uniformImg pushBack format["<img width='110' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_west_uniform;

    private _meta = +fnf_briefing_west_uniformMeta;

    player createDiaryRecord [
      "Diary",
      [
        "BLUFOR CSW Settings",
        [west] call fnf_briefing_fnc_parseCSW
      ]
    ];

    player createDiaryRecord [
      "Diary",
      [
        "BLUFOR Loadout",
        format [
          "<font size='18' shadow='1' color='" + COLOR2 + "' face='PuristaBold'>%1</font><br/>%2",
          fnf_briefing_west_loadout # 0 # 0,
          [fnf_briefing_west_loadout] call fnf_briefing_fnc_parseLoadout
        ]
      ]
    ];
      player createDiaryRecord [
      "Diary",
      [
        "BLUFOR Uniform",
        format ["<font size='18' shadow='1' color='" + COLOR2 + "' face='PuristaBold'>%4</font><br/>
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
  };
};



//show opfor uniform and headgear if side is present
if (!isNil "fnf_briefing_east_uniform" || !isNil "fnf_briefing_east_headgear" || !isNil "fnf_briefing_east_uniformMeta" && !isNil "fnf_briefing_east_loadout") then {

  _MATDataString = _MATDataString + ([east, fnf_redAT_Bravo, fnf_redAT_Delta] call fnf_briefing_fnc_parseMAT) + "---------------------------------------------<br/>";

  // show OPFOR loadout
  fnf_briefing_loadoutOPF = {
    _helmetImg = [];
    _vestImg = [];
    _uniformImg = [];
    {
      _helmetImg pushBack format["<img width='110' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_east_headgear;
    {
      _vestImg pushBack format["<img width='110' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_east_vest;
    {
      _uniformImg pushBack format["<img width='110' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_east_uniform;

    private _meta = +fnf_briefing_east_uniformMeta;

    player createDiaryRecord [
      "Diary",
      [
        "OPFOR CSW Settings",
        [east] call fnf_briefing_fnc_parseCSW
      ]
    ];

    player createDiaryRecord [
      "Diary",
      [
        "OPFOR Loadout",
        format [
          "<font size='18' shadow='1' color='" + COLOR2 + "' face='PuristaBold'>%1</font><br/>%2",
          fnf_briefing_east_loadout # 0 # 0,
          [fnf_briefing_east_loadout] call fnf_briefing_fnc_parseLoadout
        ]
      ]
    ];
    player createDiaryRecord [
      "Diary",
      [
        "OPFOR Uniform",
        format ["<font size='18' shadow='1' color='" + COLOR2 + "' face='PuristaBold'>%4</font><br/>
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
  };
};



//show indfor uniform and headgear if side is present
if (!isNil "fnf_briefing_ind_uniform" || !isNil "fnf_briefing_ind_headgear" || !isNil "fnf_briefing_ind_uniformMeta" && !isNil "fnf_briefing_ind_loadout") then {

  _MATDataString = _MATDataString + ([independent, fnf_grnAT_Bravo, fnf_grnAT_Delta] call fnf_briefing_fnc_parseMAT) + "---------------------------------------------<br/>";

  // show INDFOR loadout
  fnf_briefing_loadoutIND = {
    _helmetImg = [];
    _vestImg = [];
    _uniformImg = [];
    {
      _helmetImg pushBack format["<img width='110' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_ind_headgear;
    {
      _vestImg pushBack format["<img width='110' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_ind_vest;
    {
      _uniformImg pushBack format["<img width='110' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_ind_uniform;

    private _meta = +fnf_briefing_ind_uniformMeta;

    player createDiaryRecord [
      "Diary",
      [
        "INDFOR CSW Settings",
        [independent] call fnf_briefing_fnc_parseCSW
      ]
    ];

    player createDiaryRecord [
      "Diary",
      [
        "INDFOR Loadout",
        format [
          "<font size='18' shadow='1' color='" + COLOR2 + "' face='PuristaBold'>%1</font><br/>%2",
          fnf_briefing_ind_loadout # 0 # 0,
          [fnf_briefing_ind_loadout] call fnf_briefing_fnc_parseLoadout
        ]
      ]
    ];
    player createDiaryRecord [
      "Diary",
      [
        "INDFOR Uniform",
        format ["<font size='18' shadow='1' color='" + COLOR2 + "' face='PuristaBold'>%4</font><br/>
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
  };
};






//list some pertinent variables
// _varStr = _varStr + format ["<font ><font size='16' color='" + COLOR3 + "' face='PuristaBold'>%1</font><br/>%2", briefingName, [missionConfigFile] call BIS_fnc_overviewAuthor];
// _varStr = _varStr + "<br/>";
// _varStr = _varStr + "<br/>";

_varStr = _varStr + format ["Safe start time: %1 minutes", fnf_safeStartTime];
_varStr = _varStr + "<br/>";
_varStr = _varStr + format ["Time limit: %1 minutes", fnf_missionTimeLimit];
_varStr = _varStr + "<br/>";
_varStr = _varStr + "<br/>";

_varStr = _varStr + format ["Maximum view distance: %1m", fnf_maxViewDistance];
_varStr = _varStr + "<br/>";

private _magOpticsStr = "";
switch (fnf_magnifiedOptics) do {
  case 1: {_magOpticsStr = "Yes"};
  case 0: {_magOpticsStr = "No"};
};
_varStr = _varStr + format ["Magnified optics: %1", _magOpticsStr];
_varStr = _varStr + "<br/>";

if (fnf_defendingSide != sideEmpty) then {
  _varStr = _varStr + format ["Defender fortify points: %1", fnf_fortifyPoints];
  _varStr = _varStr + "<br/>";
};

private _addNVGStr = "";
switch (fnf_addNVG) do {
  case 1: {_addNVGStr = "Yes"};
  case 0: {_addNVGStr = "No"};
};
_varStr = _varStr + format ["NVGs equipped: %1", _addNVGStr];
_varStr = _varStr + "<br/>";
_varStr = _varStr + "<br/>";

fnf_briefing_MMNotes = {
  // MM briefing notes
  private _systemTimeFormat = ["%1-%2-%3 %4:%5:%6"];
  _systemTimeFormat append (systemTimeUTC apply {if (_x < 10) then {"0" + str _x} else {str _x}});

  _mmNotes = [format["<font size='16' color='" + COLOR3 + "' face='PuristaBold'>%1</font><br/>%2", briefingName, [missionConfigFile] call BIS_fnc_overviewAuthor]];
  _mmNotes pushBack "<br/>";
  _mmNotes pushBack "<br/>";

  (date call BIS_fnc_sunriseSunsetTime) params ["_sunriseTime", "_sunsetTime"];
  _mmNotes pushBack format ["Temperature ASL: %1 C", 0 call ace_weather_fnc_calculateTemperatureAtHeight];
  _mmNotes pushBack "<br/>";
  _mmNotes pushBack format ["Wind: %1 at %2", windDir, windStr];
  _mmNotes pushBack "<br/>";
  _mmNotes pushBack format ["Sunrise: %1 | Sunset: %2", [_sunriseTime, "HH:MM"] call BIS_fnc_timeToString, [_sunsetTime, "HH:MM"] call BIS_fnc_timeToString];
  _mmNotes pushBack "<br/>";
  _mmNotes pushBack format ["Moon Fullness: %1%2", ceil(moonPhase date* 100), "%"];
  _mmNotes pushBack "<br/>";
  _mmNotes pushBack "<br/>";

  if (count fnf_briefingBackground > 0) then {
    _mmNotes pushBack "<font size='18' color='" + COLOR3 + "' face='PuristaBold'>BACKGROUND</font>";
    _mmNotes pushBack "<br/>";
    _mmNotes pushBack (fnf_briefingBackground call CBA_fnc_sanitizeHTML);
    _mmNotes pushBack "<br/>";
  };

  if (count fnf_briefingWorldInfo > 0) then {
    _mmNotes pushBack "<font size='18' color='" + COLOR3 + "' face='PuristaBold'>AREA OF OPERATIONS</font>";
    _mmNotes pushBack "<br/>";
    _mmNotes pushBack (fnf_briefingWorldInfo call CBA_fnc_sanitizeHTML);
    _mmNotes pushBack "<br/>";
  };

  if (count fnf_briefingNotes > 0) then {
    _mmNotes pushBack "<font size='18' color='" + COLOR3 + "' face='PuristaBold'>NOTES</font>";
    _mmNotes pushBack "<br/>";
    _mmNotes pushBack (fnf_briefingNotes call CBA_fnc_sanitizeHTML);
    _mmNotes pushBack "<br/>";
  };

  if (count fnf_briefingRules > 0) then {
    _mmNotes pushBack "<font size='18' color='" + COLOR3 + "' face='PuristaBold'>MISSION RULES</font>";
    _mmNotes pushBack "<br/>";
    _mmNotes pushBack fnf_briefingRules;
    _mmNotes pushBack "<br/>";
    _mmNotes pushBack "<br/>";
    _mmNotes pushBack "<br/>";
  };

  // game mode details
  _mmNotes pushBack format ["<font size='16' color='" + COLOR3 + "' face='PuristaBold'>GAMEMODE: %1</font>", toUpper fnf_gameMode];
  _mmNotes pushBack "<br/>";
  _mmNotes pushBack "<br/>";

  if (!isNil "fnf_overTimeConStr") then {
    _mmNotes pushBack "OVERTIME CONDITIONS:<br/>" + fnf_overTimeConStr;
    _mmNotes pushBack "<br/>";
    _mmNotes pushBack "<br/>";
  } else {
    _mmNotes pushBack "<br/>";
    _mmNotes pushBack "<br/>";
  };

  switch (fnf_gameMode) do {
    case "destroy": {
      #include "..\..\mode_config\destroy.sqf";
      _objArr = [_obj1,_obj2,_obj3];
      _objects = [_obj1 select 0, _obj2 select 0, _obj3 select 0] select {!isNull _x};
      _mmNotes pushBack format ["Destroy objectives: %1", count _objects];
      _mmNotes pushBack "<br/>";
      {
        _mmNotes pushBack format[
          "Objective %1:<br/><img image='%2' height=200/><br/>",
          _forEachIndex + 1,
          getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "EditorPreview")
        ];
      } forEach _objects;
    };
    case "uplink": {
      #include "..\..\mode_config\uplink.sqf";

      _mmNotes pushBack format ["Terminal count: %1", _numberOfTerminals];
      _mmNotes pushBack "<br/>";

      if (_terminalHackTime isEqualType []) then {
        _mmNotes pushBack "Hack time:";
        _mmNotes pushBack "<br/>";
        for "_i" from 0 to _numberOfTerminals do {
          _mmNotes pushBack format ["  Terminal %1: %2", _i + 1, _terminalHackTime # _i];
          _mmNotes pushBack "<br/>";
        };
      } else {
        _mmNotes pushBack format ["Hack time: %1", _terminalHackTime];
        _mmNotes pushBack "<br/>";
      };
    };
    case "rush": {
      #include "..\..\mode_config\rush.sqf";
      _mmNotes pushBack format ["Terminal count: %1", _numberOfTerminals];
      _mmNotes pushBack "<br/>";

      if (_terminalHackTime isEqualType []) then {
        _mmNotes pushBack "Hack time:";
        for "_i" from 0 to _numberOfTerminals do {
          _mmNotes pushBack format ["Terminal %1: %2", _i + 1, _terminalHackTime # _i];
          _mmNotes pushBack "<br/>";
        };
      } else {
        _mmNotes pushBack format ["Hack time: %1", _terminalHackTime];
        _mmNotes pushBack "<br/>";
      };
    };
    case "connection": {
      #include "..\..\mode_config\connection.sqf";
      _mmNotes pushBack format ["Terminal count: %1", _numberOfTerminals];
      _mmNotes pushBack "<br/>";

      _mmNotes pushBack format ["One point accrued per terminal every %1 seconds", _pointAddTime];
      _mmNotes pushBack "<br/>";
    };
    case "captureTheFlag": {
      #include "..\..\mode_config\ctf.sqf";

      private _capZoneShown = "";
      switch (_showCapZoneGlobal) do {
        case true: {_capZoneShown = "to all players at mission start"};
        case false: {_capZoneShown = "only to attackers until flag is touched"};
      };
      _mmNotes pushBack format ["Capture zone visible %1", _capZoneShown];
      _mmNotes pushBack "<br/>";

      _mmNotes pushBack format ["Flag marker updated every %1 seconds", _flagMarkUpdateTime];
      _mmNotes pushBack "<br/>";

      _mmNotes pushBack format ["Attackers must hold the flag in capture zone for %1 seconds to achieve victory", _flagCaptureTime];
      _mmNotes pushBack "<br/>";
    };
    case "adSector": {
      #include "..\..\mode_config\adSector.sqf";

      private _isSequential = "";
      switch (_inOrder) do {
        case true: {_isSequential = "Yes"};
        case false: {_isSequential = "No"};
      };
      _mmNotes pushBack format ["Sector count: %1", _numberOfSectors];
      _mmNotes pushBack "<br/>";
      _mmNotes pushBack format ["Sequential: %1", _isSequential];
      _mmNotes pushBack "<br/>";
    };
    case "neutralSector": {
      #include "..\..\mode_config\neutralSector.sqf";
      _mmNotes pushBack format ["Sector count: %1", _numberOfSectors];
      _mmNotes pushBack "<br/>";

      _mmNotes pushBack format ["One point accrued per sector every %1 seconds", _pointAddTime];
      _mmNotes pushBack "<br/>";
    };
    case "scavHunt": {
      #include "..\..\mode_config\scavHunt.sqf";
      _mmNotes pushBack format ["Objective count: %1", _numberOfObjectives];
      _mmNotes pushBack "<br/>";

      _mmNotes pushBack format ["Specialized transports per side: %1", _numberOfTransportsPerSide];
      _mmNotes pushBack "<br/>";
    };
    case "assassin": {
      ["REFRESH_BRIEF_GAMEMODE", {
        #include "..\..\mode_config\assassin.sqf";

        private _mmNotes = [];
        private _mmNotesStructGamemode = [];

        _mmNotes pushBack format ["<font size='16' color='" + COLOR3 + "' face='PuristaBold'>GAMEMODE: %1</font>", toUpper fnf_gameMode];
        _mmNotes pushBack "<br/>";
        _mmNotes pushBack "<br/>";

        if (!isNil "fnf_overTimeConStr") then {
          _mmNotes pushBack "OVERTIME CONDITIONS:<br/>" + fnf_overTimeConStr;
          _mmNotes pushBack "<br/>";
          _mmNotes pushBack "<br/>";
        } else {
          _mmNotes pushBack "<br/>";
          _mmNotes pushBack "<br/>";
        };

        _mmNotes pushBack format ["HVT Count: %1<br/>", count _targets];
        _mmNotes pushBack format ["%1 needs to kill %2 of them to win.<br/>", fnf_attackingSide call BIS_fnc_sideName, _requiredKills];
        _mmNotes pushBack "<br/><br/>";
        _mmNotes pushBack "Jammers are in place to secure 1 or more specifically marked areas in which the HVTs can safely hide. If an HVT moves outside of any protected zone, their position will be revealed on the enemy's map until they return to safety. HVT locations will ALWAYS be revealed to their allies to aid them in tactical defense.";
        _mmNotes pushBack "<br/><br/>";

        _mmNotes pushBack format ["<font color='%1' size='16'>HVTs</font><br/>", COLOR3];

        {
          (_x # 0) params ["_targetHeader"];
          (_x # 1) params ["_role", "_name", "_obj"];
          if (!isNil "_obj") then {
            _mmNotes pushBack format ["<font color='%1'>  %2:</font> %3 (%4, played by %5)<br/>", COLOR3, _targetHeader, _name, _role, name _obj];
          } else {
            _mmNotes pushBack format ["<font color='%1'>  %2:</font> %3 (%4, played by [NOT FILLED])</font><br/>", COLOR3, _targetHeader, _name, _role, name _obj];
          };
        } forEach fnf_assassinationTargets;

        player setDiaryRecordText [["Diary", fnf_diary_gamemode], [
          format["Gamemode - %1", toUpper fnf_gameMode],
          _mmNotes joinString ""
          ]
        ];
      }] call CBA_fnc_addEventHandler;

      fnf_diary_gamemode = player createDiaryRecord ["Diary",
        [
          // getText(missionConfigFile >> "Author"),
          "Gamemode",
          ""
        ]
      ];

      ["REFRESH_BRIEF_GAMEMODE"] call CBA_fnc_localEvent;
    };
  };

  fnf_diary_briefing = player createDiaryRecord ["Diary",
    [
      // getText(missionConfigFile >> "Author"),
      "Briefing",
      _mmNotes joinString ""
    ]
  ];

};



if (fnf_gameMode == "sustainedAssault") then {
  fnf_Diary_GameMechanics = player createDiarySubject ["fnf_Diary_GameMechanics", "Game Mechanics"];
  {
    player createDiaryRecord [
      "fnf_Diary_GameMechanics",
      [
        _x # 0,
        _x # 1
      ]
    ];
  } forEach fnf_ui_gameMechanicsDiary;
};


call fnf_briefing_fnc_news;


fnf_Diary_UpdateInfo = player createDiarySubject ["fnf_Diary_UpdateInfo", "Framework Info", "\A3\ui_f\data\igui\cfg\simpleTasks\types\box_ca.paa"];
player createDiaryRecord [
  "fnf_Diary_UpdateInfo",
  [
    "Changelog",
    format [
      "<font size='18' shadow='1' color='" + COLOR2 + "'>Changelog</font><br/>Template Version: %1<br/><br/>%2<br/><br/><font size='18' shadow='1' color='" + COLOR2 + "'>Credits</font><br/>%3",
      fnf_templateVersion,
      fnf_ui_changelogText,
      fnf_ui_frameworkCreditsText
    ]
  ]
];

fnf_Diary_Credits = player createDiarySubject ["fnf_Diary_Credits", "Credits"];
player createDiaryRecord [
  "fnf_Diary_Credits",
  [
    "Credits",
    [fnf_ui_structTextRef, "Credits"] call BIS_fnc_getFromPairs
  ]
];


if (!isNil "fnf_briefing_loadoutIND") then {
  call fnf_briefing_loadoutIND;
};
if (!isNil "fnf_briefing_loadoutOPF") then {
  call fnf_briefing_loadoutOPF;
};
if (!isNil "fnf_briefing_loadoutBLU") then {
  call fnf_briefing_loadoutBLU;
};

MAT_Diary = player createDiaryRecord ["Diary",["MAT Selection",_MATDataString]];

player setDiarySubjectPicture ["Diary", "\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa"];

[{
  getClientStateNumber >= 8 &&
  !isNil "fnf_templateGroupsList" &&
  !isNil "fnf_playerBaseChannel" &&
  !isNil "fnf_briefing_startingRadios" &&
  missionNamespace getVariable ["fnf_groupIDset", false]
}, {
  params ["_varStr"];
  call fnf_briefing_startingRadios;
  [false] call fnf_briefing_fnc_parseGear;
  player createDiaryRecord ["Diary",["Mission Variables",_varStr]];
  call fnf_briefing_MMNotes;
  call fnf_briefing_fnc_createOrbat;
  if (getPlayerUID player in (missionNamespace getVariable ["fnf_staffInfo",[]])) then {
    call fnf_briefing_fnc_adminDiary;
  };
  [{
    [] spawn fnf_briefing_fnc_createOrbat;
    if (getClientStateNumber >= 10) then {[_handle] call CBA_fnc_removePerFrameHandler};
  }, 7] call CBA_fnc_addPerFrameHandler;

  if (fnf_gameMode == "sustainedAssault") then {
    [{count (allDiarySubjects player select {(_x # 0) == "BIS_fnc_moduleMPTypeSectorControl" && (_x # 5) == true}) > 0}, {
      [] spawn {
        private _briefingEntry = (allDiarySubjects player) select {_x # 0 == "Diary"};
        private _briefingEntryCount = _briefingEntry # 0 # 3;
        player selectDiarySubject format["Diary:Record%1", _briefingEntryCount - 1];
        uiSleep 0.2;
        player removeDiarySubject "BIS_fnc_moduleMPTypeSectorControl";
      };
    }] call CBA_fnc_waitUntilAndExecute;
  } else {
    private _briefingEntry = (allDiarySubjects player) select {_x # 0 == "Diary"};
    private _briefingEntryCount = _briefingEntry # 0 # 3;
    player selectDiarySubject format["Diary:Record%1", _briefingEntryCount - 1];
  };
},[_varStr]] call CBA_fnc_waitUntilAndExecute;


// player createDiarySubject ["Utilities", "Utilities"];
// player createDiaryRecord [
//   "Utilities",
//   [
//     "Screenshots/UI",
//     "<font face='PuristaMedium'><executeClose expression='showHUD [false,false,false,false,false,false,false,false,false,false,false]; diwako_dui_main_toggled_off=true; showChat false;'>Hide HUD</executeClose><br/><executeClose expression='showHUD [true,true,true,true,true,true,false,true,true,true,false]; diwako_dui_main_toggled_off=false; showChat true;'>Show HUD</executeClose></font>"
//   ]
// ];

//call fnf_briefing_fnc_objectiveRecon;

fnf_briefCreated = true; //let fnf_briefing_fnc_init know the briefing is created
true
