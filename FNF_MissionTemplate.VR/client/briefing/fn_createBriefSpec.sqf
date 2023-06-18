/*
* Author: IndigoFox
*
* Description:
* Primary entry point for players and spectators to fill a reference array of pairs with structured text items compatible in UI applications.
*
* Arguments:
* /NONE/
*
* Return Value:
* true on success <BOOLEAN>
*
* Example:
* call fnf_briefing_fnc_createBriefSpec
*
* Public: No
*/


// colors: https://imgur.com/a/AfimbU2
#define COLOR1 "#944509"
#define COLOR2 "#FF8E38"
#define COLOR3 "#E0701B"
#define COLOR4 "#008394"
#define COLOR5 "#1BCAE0"

_getName = {
  if (_this isEqualTo "") exitWith {""};
  getText (configFile >> "cfgWeapons" >> _this >> "displayName");
};

fnf_briefing_fnc_getItemInfo = {
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

fnf_briefing_fnc_parseMAT = {
  params ["_side", "_bravoOption", ["_structText", false]];

  private "_gearLoadout";
  switch (_side) do {
    case east: {_gearLoadout = fnf_opforGear};
    case west: {_gearLoadout = fnf_bluforGear};
    case independent: {_gearLoadout = fnf_indforGear};
  };

  private _textOut = [];
  {
    _x params ["_setting", "_role"];

    private "_MATData";

    if (count _setting > 0) then {
      if (_setting # 0 isEqualTo "GEARDEFAULT") then {
        _MATData = (missionConfigFile >> "CfgFNFLoadouts" >> "GEAR" >> _gearLoadout >> _role >> "defaultMAT") call BIS_fnc_getCfgDataArray select 0;
      } else {
        _MATData = _setting;
      };
    } else {
      _textOut pushBack "";
    };

    _MATData params ["_launcher", "_ammo", "_optics", "_type"];
    private _launcherInfo = _launcher call fnf_briefing_fnc_getItemInfo;

    if (!_structText) then {
      _textOut pushBack format [
        "%1 %2: <font color='" + COLOR3 + "'>%3</font><br/><img width='120' image='%4'/><br/>%5<br/>%6",
        _side call BIS_fnc_sideName,
        _role,
        [_launcherInfo, "displayName"] call BIS_fnc_getFromPairs,
        [_launcherInfo, "picture"] call BIS_fnc_getFromPairs,
        (if (_type == "RELOAD") then {format["%1 (per person)", [_ammo, true] call fnf_briefing_fnc_notesItems]} else {""}),
        [_launcherInfo, "description"] call BIS_fnc_getFromPairs
      ] + "<br/><br/>";
    } else {
      _textOut pushBack format [
        "%1 %2: <t color='" + COLOR3 + "'>%3</t><br/><img size='4' image='%4'/><br/>%5<br/>",
        _side call BIS_fnc_sideName,
        _role,
        [_launcherInfo, "displayName"] call BIS_fnc_getFromPairs,
        [_launcherInfo, "picture"] call BIS_fnc_getFromPairs,
        (if (_type == "RELOAD") then {format["%1 (per person)", [_ammo, true, true] call fnf_briefing_fnc_notesItems]} else {""}),
        [_launcherInfo, "description"] call BIS_fnc_getFromPairs
      ];
    };

  } forEach [
    [_bravoOption, "MAT1"]
  ];

  _textOut joinString "<br/>"
};


fnf_briefing_fnc_parseCSW = {
  params ["_side", ["_structText", false]];

  private _sideStr = str(_side);
  private _squads = ["Alpha", "Bravo", "Charlie", "Delta"];
  private _textOut = [];
  {
    private _setting = _x;
    if (_x isEqualTo 0 || typeName _x != "ARRAY") then {
      if (!_structText) then {
        _textOut pushBack format["<font size='16' color='" + COLOR5 + "'>%1</font><br/>    Crewmen", _squads select _forEachIndex];
      } else {
        _textOut pushBack format["<t size='1.4' color='" + COLOR5 + "'>%1</t><br/>    Crewmen", _squads select _forEachIndex];
      };
    } else {
      if (count _setting > 0) then {
        private _cswPrimaryInfo = (_setting # 0) call fnf_briefing_fnc_getItemInfo;

        private _mags = [];
        {
          if (!_structText) then {
            _mags pushBack ([_x, true] call fnf_briefing_fnc_notesItems);
          } else {
            _mags pushBack ([_x, true, true] call fnf_briefing_fnc_notesItems);
          };
        } forEach (_setting select {typeName _x == "ARRAY"});

        private _cswSecondaryName = "Ammo only";
        if (_setting # 1 != "") then {
          private _temp = (_setting # 1) call fnf_briefing_fnc_getItemInfo;
          _cswSecondaryName = [_temp, "displayName"] call BIS_fnc_getFromPairs;
        };

        if (!_structText) then {
          _textOut pushBack format [
            "<font size='16' color='" + COLOR5 + "'>%2</font><br/>    <font color='" + COLOR3 + "'>%3</font><br/>    <img width='120' image='%4'/><br/>    + %5<br/>    + %6",
            _side call BIS_fnc_sideName,
            _squads select _forEachIndex,
            [_cswPrimaryInfo, "displayName"] call BIS_fnc_getFromPairs,
            [_cswPrimaryInfo, "picture"] call BIS_fnc_getFromPairs,
            _cswSecondaryName,
            _mags joinString " "
          ];
        } else {
          _textOut pushBack format [
            "<t size='1.4' color='" + COLOR5 + "'>%2</t><br/>    <t color='" + COLOR3 + "'>%3</t><br/>    <img size='3' image='%4'/><br/>    + %5<br/>    + %6",
            _side call BIS_fnc_sideName,
            _squads select _forEachIndex,
            [_cswPrimaryInfo, "displayName"] call BIS_fnc_getFromPairs,
            [_cswPrimaryInfo, "picture"] call BIS_fnc_getFromPairs,
            _cswSecondaryName,
            _mags joinString " "
          ];
        };
      };
    };
  } forEach [
    missionNamespace getVariable [format["fnf_%1AlphaAuxRole",_sideStr], 0],
    missionNamespace getVariable [format["fnf_%1BravoAuxRole",_sideStr], 0],
    missionNamespace getVariable [format["fnf_%1CharlieAuxRole",_sideStr], 0],
    missionNamespace getVariable [format["fnf_%1DeltaAuxRole",_sideStr], 0]
  ];

  _textOut pushBack "<br/>";
  _textOut joinString "<br/>"
};


//show blufor uniform and headgear if side is present
if (!isNil "fnf_briefing_west_uniform" || !isNil "fnf_briefing_west_headgear" || !isNil "fnf_briefing_west_uniformMeta" && !isNil "fnf_briefing_west_loadout") then {

  private _uiMAT = [fnf_ui_structTextRef, "MAT Settings", ""] call BIS_fnc_getFromPairs;
  _uiMAT = _uiMAT + ([west, fnf_bluAT, true]  call fnf_briefing_fnc_parseMAT);
  fnf_ui_structTextRef = [fnf_ui_structTextRef, "MAT Settings", _uiMAT] call BIS_fnc_setToPairs;

  // show BLUFOR loadout
  fnf_briefing_loadoutBLU = {
    private _meta = +fnf_briefing_west_uniformMeta;

    _helmetImg = [];
    _vestImg = [];
    _uniformImg = [];
    {
      _helmetImg pushBack format["<img size='6' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_west_headgear;
    {
      _vestImg pushBack format["<img size='6' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_west_vest;
    {
      _uniformImg pushBack format["<img size='6' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_west_uniform;

    [
      fnf_ui_structTextRef,
      "BLUFOR",
      format ["GEAR:<br/>  %1<br/>UNIFORM:<br/>  %2",
        missionNamespace getVariable [format["fnf_%1Gear","blufor"], "N/A"],
        missionNamespace getVariable [format["fnf_%1Uniform","blufor"], "N/A"]
      ]
    ] call BIS_fnc_setToPairs;

    [
      fnf_ui_structTextRef,
      "BLUFOR Loadout",
      format [
        "<t size='1.2' shadow='1' color='" + COLOR2 + "' face='PuristaBold'>%1</t><br/>%2",
        fnf_briefing_west_loadout # 0 # 0,
        [fnf_briefing_west_loadout, true] call fnf_briefing_fnc_parseLoadout
      ]
    ] call BIS_fnc_setToPairs;


    private _uniformImages = [west, true] call fnf_briefing_fnc_getUniformPics;
    if (typeName _uniformImages == "STRING") then {
      [
        fnf_ui_structTextRef,
        "BLUFOR Uniform",
        format ["<t size='1.2' shadow='1' color='" + COLOR2 + "' face='PuristaBold'>%1</t><br/>
<t size='1.1'>%2</t><br/>
Author: %3<br/><br/>
%4
",
          _meta # 0,
          _meta # 1,
          _meta # 2,
          _uniformImages
        ]
      ] call BIS_fnc_setToPairs;
    } else {
      [
        fnf_ui_structTextRef,
        "BLUFOR Uniform",
        format ["<t size='1.2' shadow='1' color='" + COLOR2 + "' face='PuristaBold'>%4</t><br/>
<t size='1.1'>%5</t><br/>
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
      ] call BIS_fnc_setToPairs;
    };

    [
      fnf_ui_structTextRef,
      "BLUFOR CSW",
      [west, true] call fnf_briefing_fnc_parseCSW
    ] call BIS_fnc_setToPairs;
  };
};



//show opfor uniform and headgear if side is present
if (!isNil "fnf_briefing_east_uniform" || !isNil "fnf_briefing_east_headgear" || !isNil "fnf_briefing_east_uniformMeta" && !isNil "fnf_briefing_east_loadout") then {

  private _uiMAT = [fnf_ui_structTextRef, "MAT Settings", ""] call BIS_fnc_getFromPairs;
  _uiMAT = _uiMAT + ([east, fnf_redAT, true] call fnf_briefing_fnc_parseMAT);
  fnf_ui_structTextRef = [fnf_ui_structTextRef, "MAT Settings", _uiMAT] call BIS_fnc_setToPairs;

  // show OPFOR loadout
  fnf_briefing_loadoutOPF = {
    private _meta = +fnf_briefing_east_uniformMeta;

    _helmetImg = [];
    _vestImg = [];
    _uniformImg = [];
    {
      _helmetImg pushBack format["<img size='6' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_east_headgear;
    {
      _vestImg pushBack format["<img size='6' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_east_vest;
    {
      _uniformImg pushBack format["<img size='6' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_east_uniform;

    [
      fnf_ui_structTextRef,
      "OPFOR",
      format ["GEAR:<br/>  %1<br/>UNIFORM:<br/>  %2",
        missionNamespace getVariable [format["fnf_%1Gear","OPFOR"], "N/A"],
        missionNamespace getVariable [format["fnf_%1Uniform","OPFOR"], "N/A"]
      ]
    ] call BIS_fnc_setToPairs;

    [
      fnf_ui_structTextRef,
      "OPFOR Loadout",
      format [
        "<t size='1.2' shadow='1' color='" + COLOR2 + "' face='PuristaBold'>%1</t><br/>%2",
        fnf_briefing_east_loadout # 0 # 0,
        [fnf_briefing_east_loadout, true] call fnf_briefing_fnc_parseLoadout
      ]
    ] call BIS_fnc_setToPairs;


    private _uniformImages = [east, true] call fnf_briefing_fnc_getUniformPics;
    if (typeName _uniformImages == "STRING") then {
      [
        fnf_ui_structTextRef,
        "OPFOR Uniform",
        format ["<t size='1.2' shadow='1' color='" + COLOR2 + "' face='PuristaBold'>%1</t><br/>
<t size='1.1'>%2</t><br/>
Author: %3<br/><br/>
%4
",
          _meta # 0,
          _meta # 1,
          _meta # 2,
          _uniformImages
        ]
      ] call BIS_fnc_setToPairs;
    } else {
      [
        fnf_ui_structTextRef,
        "OPFOR Uniform",
        format ["<t size='1.2' shadow='1' color='" + COLOR2 + "' face='PuristaBold'>%4</t><br/>
  <t size='1.1'>%5</t><br/>
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
      ] call BIS_fnc_setToPairs;
    };

    [
      fnf_ui_structTextRef,
      "OPFOR CSW",
      [east, true] call fnf_briefing_fnc_parseCSW
    ] call BIS_fnc_setToPairs;
  };
};



//show indfor uniform and headgear if side is present
if (!isNil "fnf_briefing_ind_uniform" || !isNil "fnf_briefing_ind_headgear" || !isNil "fnf_briefing_ind_uniformMeta" && !isNil "fnf_briefing_ind_loadout") then {

  private _uiMAT = [fnf_ui_structTextRef, "MAT Settings", ""] call BIS_fnc_getFromPairs;
  _uiMAT = _uiMAT + ([independent, fnf_grnAT, true] call fnf_briefing_fnc_parseMAT);
  fnf_ui_structTextRef = [fnf_ui_structTextRef, "MAT Settings", _uiMAT] call BIS_fnc_setToPairs;

  // show INDFOR loadout
  fnf_briefing_loadoutIND = {
    private _meta = +fnf_briefing_ind_uniformMeta;

    _helmetImg = [];
    _vestImg = [];
    _uniformImg = [];
    {
      _helmetImg pushBack format["<img size='6' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_ind_headgear;
    {
      _vestImg pushBack format["<img size='6' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_ind_vest;
    {
      _uniformImg pushBack format["<img size='6' image='%1'/>", [_x call fnf_briefing_fnc_getItemInfo, "picture"] call BIS_fnc_getFromPairs];
    } forEach fnf_briefing_ind_uniform;

    [
      fnf_ui_structTextRef,
      "INDFOR",
      format ["GEAR:<br/>  %1<br/>UNIFORM:<br/>  %2",
        missionNamespace getVariable [format["fnf_%1Gear","indfor"], "N/A"],
        missionNamespace getVariable [format["fnf_%1Uniform","indfor"], "N/A"]
      ]
    ] call BIS_fnc_setToPairs;
    [
      fnf_ui_structTextRef,
      "INDFOR Loadout",
      format [
        "<t size='1.2' shadow='1' color='" + COLOR2 + "' face='PuristaBold'>%1</t><br/>%2",
        fnf_briefing_ind_loadout # 0 # 0,
        [fnf_briefing_ind_loadout, true] call fnf_briefing_fnc_parseLoadout
      ]
    ] call BIS_fnc_setToPairs;


    private _uniformImages = [independent, true] call fnf_briefing_fnc_getUniformPics;
    if (typeName _uniformImages == "STRING") then {
      [
        fnf_ui_structTextRef,
        "INDFOR Uniform",
        format ["<t size='1.2' shadow='1' color='" + COLOR2 + "' face='PuristaBold'>%1</t><br/>
<t size='1.1'>%2</t><br/>
Author: %3<br/><br/>
%4
",
          _meta # 0,
          _meta # 1,
          _meta # 2,
          _uniformImages
        ]
      ] call BIS_fnc_setToPairs;
    } else {
      [
        fnf_ui_structTextRef,
        "INDFOR Uniform",
        format ["<t size='1.2' shadow='1' color='" + COLOR2 + "' face='PuristaBold'>%4</t><br/>
  <t size='1.1'>%5</t><br/>
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
      ] call BIS_fnc_setToPairs;
    };

    [
      fnf_ui_structTextRef,
      "INDFOR CSW",
      [independent, true] call fnf_briefing_fnc_parseCSW
    ] call BIS_fnc_setToPairs;
  };
};


private _varStrStruct = [];

_varStrStruct pushBack format[
  "<t size='1.2' color='" + COLOR3 + "' face='PuristaBold'>%1</t>",
  "Mission Variables"
];

_varStrStruct pushBack format ["Safe start time: %1 minutes", fnf_safeStartTime];
_varStrStruct pushBack format ["Time limit: %1 minutes", fnf_missionTimeLimit];
_varStrStruct pushBack "<br/>";

_varStrStruct pushBack format ["Maximum view distance: %1m", fnf_maxViewDistance];

private _magOpticsStr = "";
switch (fnf_magnifiedOptics) do {
  case 1: {_magOpticsStr = "Yes"};
  case 0: {_magOpticsStr = "No"};
};

_varStrStruct pushBack format ["Magnified optics: %1", _magOpticsStr];

if (fnf_defendingSide != sideEmpty) then {
  _varStrStruct pushBack format ["Defender fortify points: %1", fnf_fortifyPoints];
};

private _addNVGStr = "";
switch (fnf_addNVG) do {
  case 1: {_addNVGStr = "Yes"};
  case 0: {_addNVGStr = "No"};
};
_varStrStruct pushBack format ["NVGs equipped: %1", _addNVGStr];

[fnf_ui_structTextRef, "Mission Variables", _varStrStruct joinString "<br/>"] call BIS_fnc_setToPairs;



fnf_briefing_MMNotes = {
  // MM briefing notes
  private _systemTimeFormat = ["%1-%2-%3 %4:%5:%6"];
  _systemTimeFormat append (systemTimeUTC apply {if (_x < 10) then {"0" + str _x} else {str _x}});

  _mmNotesStructBrief = [];
  _mmNotesStructBrief pushBack format[
    "<t size='1.2' color='" + COLOR3 + "' face='PuristaBold'>%1</t><br/>%2",
    briefingName,
    [missionConfigFile] call BIS_fnc_overviewAuthor
  ];
  _mmNotesStructBrief pushBack "<br/>";
  _mmNotesStructBrief pushBack "<br/>";

  (date call BIS_fnc_sunriseSunsetTime) params ["_sunriseTime", "_sunsetTime"];
  _mmNotesStructBrief pushBack format ["Temperature ASL: %1 C", 0 call ace_weather_fnc_calculateTemperatureAtHeight];
  _mmNotesStructBrief pushBack "<br/>";
  _mmNotesStructBrief pushBack format ["Wind: %1 at %2", windDir, windStr];
  _mmNotesStructBrief pushBack "<br/>";
  _mmNotesStructBrief pushBack format ["Sunrise: %1 | Sunset: %2", [_sunriseTime, "HH:MM"] call BIS_fnc_timeToString, [_sunsetTime, "HH:MM"] call BIS_fnc_timeToString];
  _mmNotesStructBrief pushBack "<br/>";
  _mmNotesStructBrief pushBack format ["Moon Fullness: %1%2", ceil(moonPhase date* 100), "%"];
  _mmNotesStructBrief pushBack "<br/>";
  _mmNotesStructBrief pushBack "<br/>";

  if (count fnf_briefingBackground > 0) then {
    _mmNotesStructBrief pushBack "<t size='1.2' color='" + COLOR3 + "' face='PuristaBold'>BACKGROUND</t>";
    _mmNotesStructBrief pushBack "<br/>";
    _mmNotesStructBrief pushBack (fnf_briefingBackground call CBA_fnc_sanitizeHTML);
    _mmNotesStructBrief pushBack "<br/>";
  };

  if (count fnf_briefingWorldInfo > 0) then {
    _mmNotesStructBrief pushBack "<t size='1.2' color='" + COLOR3 + "' face='PuristaBold'>AREA OF OPERATIONS</t>";
    _mmNotesStructBrief pushBack "<br/>";
    _mmNotesStructBrief pushBack (fnf_briefingWorldInfo call CBA_fnc_sanitizeHTML);
    _mmNotesStructBrief pushBack "<br/>";
  };

  if (count fnf_briefingNotes > 0) then {
    _mmNotesStructBrief pushBack "<t size='1.2' color='" + COLOR3 + "' face='PuristaBold'>NOTES</t>";
    _mmNotesStructBrief pushBack "<br/>";
    _mmNotesStructBrief pushBack (fnf_briefingNotes call CBA_fnc_sanitizeHTML);
    _mmNotesStructBrief pushBack "<br/>";
  };

  if (count fnf_briefingRules > 0) then {
    _mmNotesStructBrief pushBack "<t size='1.2' color='" + COLOR3 + "' face='PuristaBold'>MISSION RULES</t>";
    _mmNotesStructBrief pushBack "<br/>";
    _mmNotesStructBrief pushBack (fnf_briefingRules call CBA_fnc_sanitizeHTML);
    _mmNotesStructBrief pushBack "<br/>";
  };

  // game mode details
  _mmNotesStructGamemode = [];
  _mmNotesStructGamemode pushBack format ["<t size='1.2' color='" + COLOR3 + "' face='PuristaBold'>GAMEMODE: %1</t>", toUpper fnf_gameMode];
  _mmNotesStructGamemode pushBack "<br/>";
  _mmNotesStructGamemode pushBack "<br/>";

  if (!isNil "fnf_overTimeConStr") then {
    _mmNotesStructGamemode pushBack "OVERTIME CONDITIONS:<br/>" + fnf_overTimeConStr;
    _mmNotesStructGamemode pushBack "<br/>";
    _mmNotesStructGamemode pushBack "<br/>";
  } else {
    _mmNotesStructGamemode pushBack "<br/>";
    _mmNotesStructGamemode pushBack "<br/>";
  };

  switch (fnf_gameMode) do {
    case "destroy": {
      #include "..\..\mode_config\destroy.sqf";
      _objArr = [_obj1,_obj2,_obj3];
      _objects = [_obj1 select 0, _obj2 select 0, _obj3 select 0] select {!isNull _x};

      _mmNotesStructGamemode pushBack format ["Destroy objectives: %1", count _objects];
      _mmNotesStructGamemode pushBack "<br/>";
      {
        _mmNotesStructGamemode pushBack format[
          "Objective %1:<br/><img image='%2' size='6'/><br/>",
          _forEachIndex + 1,
          getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "EditorPreview")
        ];
      } forEach _objects;
    };
    case "uplink": {
      #include "..\..\mode_config\uplink.sqf";

      _mmNotesStructGamemode pushBack format ["Terminal count: %1", _numberOfTerminals];
      _mmNotesStructGamemode pushBack "<br/>";

      if (_terminalHackTime isEqualType []) then {
        _mmNotesStructGamemode pushBack "Hack time:";
        _mmNotesStructGamemode pushBack "<br/>";
        for "_i" from 0 to _numberOfTerminals do {
          _mmNotesStructGamemode pushBack format ["  Terminal %1: %2", _i + 1, _terminalHackTime # _i];
          _mmNotesStructGamemode pushBack "<br/>";
        };
      } else {
        _mmNotesStructGamemode pushBack format ["Hack time: %1", _terminalHackTime];
        _mmNotesStructGamemode pushBack "<br/>";
      };
    };
    case "rush": {
      #include "..\..\mode_config\rush.sqf";

      _mmNotesStructGamemode pushBack format ["Terminal count: %1", _numberOfTerminals];
      _mmNotesStructGamemode pushBack "<br/>";

      if (_terminalHackTime isEqualType []) then {
        _mmNotesStructGamemode pushBack "Hack time:";
        for "_i" from 0 to _numberOfTerminals do {
          _mmNotesStructGamemode pushBack format ["Terminal %1: %2", _i + 1, _terminalHackTime # _i];
          _mmNotesStructGamemode pushBack "<br/>";
        };
      } else {
        _mmNotesStructGamemode pushBack format ["Hack time: %1", _terminalHackTime];
        _mmNotesStructGamemode pushBack "<br/>";
      };
    };
    case "connection": {
      #include "..\..\mode_config\connection.sqf";

      _mmNotesStructGamemode pushBack format ["Terminal count: %1", _numberOfTerminals];
      _mmNotesStructGamemode pushBack "<br/>";

      _mmNotesStructGamemode pushBack format ["One point accrued per terminal every %1 seconds", _pointAddTime];
      _mmNotesStructGamemode pushBack "<br/>";
    };
    case "captureTheFlag": {
      #include "..\..\mode_config\ctf.sqf";

      private _capZoneShown = "";
      switch (_showCapZoneGlobal) do {
        case true: {_capZoneShown = "to all players at mission start"};
        case false: {_capZoneShown = "only to attackers until flag is touched"};
      };

      _mmNotesStructGamemode pushBack format ["Capture zone visible %1", _capZoneShown];
      _mmNotesStructGamemode pushBack "<br/>";

      _mmNotesStructGamemode pushBack format ["Flag marker updated every %1 seconds", _flagMarkUpdateTime];
      _mmNotesStructGamemode pushBack "<br/>";

      _mmNotesStructGamemode pushBack format ["Attackers must hold the flag in capture zone for %1 seconds to achieve victory", _flagCaptureTime];
      _mmNotesStructGamemode pushBack "<br/>";

    };
    case "adSector": {
      #include "..\..\mode_config\adSector.sqf";

      private _isSequential = "";
      switch (_inOrder) do {
        case true: {_isSequential = "Yes"};
        case false: {_isSequential = "No"};
      };

      _mmNotesStructGamemode pushBack format ["Sector count: %1", _numberOfSectors];
      _mmNotesStructGamemode pushBack "<br/>";
      _mmNotesStructGamemode pushBack format ["Sequential: %1", _isSequential];
      _mmNotesStructGamemode pushBack "<br/>";
    };
    case "neutralSector": {
      #include "..\..\mode_config\neutralSector.sqf";

      _mmNotesStructGamemode pushBack format ["Sector count: %1", _numberOfSectors];
      _mmNotesStructGamemode pushBack "<br/>";

      _mmNotesStructGamemode pushBack format ["One point accrued per sector every %1 seconds", _pointAddTime];
      _mmNotesStructGamemode pushBack "<br/>";
    };
    case "scavHunt": {
      #include "..\..\mode_config\scavHunt.sqf";

      _mmNotesStructGamemode pushBack format ["Objective count: %1", _numberOfObjectives];
      _mmNotesStructGamemode pushBack "<br/>";

      _mmNotesStructGamemode pushBack format ["Specialized transports per side: %1", _numberOfTransportsPerSide];
      _mmNotesStructGamemode pushBack "<br/>";
    };
    case "assassin": {
      ["REFRESH_BRIEF_GAMEMODE", {
        #include "..\..\mode_config\assassin.sqf";

        private _mmNotesStructGamemode = [];

        _mmNotesStructGamemode pushBack format ["<t size='1.2' color='" + COLOR3 + "' font='PuristaBold'>GAMEMODE: %1</t>", toUpper fnf_gameMode];
        _mmNotesStructGamemode pushBack "<br/>";
        _mmNotesStructGamemode pushBack "<br/>";

        if (!isNil "fnf_overTimeConStr") then {
          _mmNotesStructGamemode pushBack "OVERTIME CONDITIONS:<br/>" + fnf_overTimeConStr;
          _mmNotesStructGamemode pushBack "<br/>";
          _mmNotesStructGamemode pushBack "<br/>";
        } else {
          _mmNotesStructGamemode pushBack "<br/>";
          _mmNotesStructGamemode pushBack "<br/>";
        };

        _mmNotesStructGamemode pushBack format ["HVT Count: %1<br/>", count _targets];
        _mmNotesStructGamemode pushBack format ["%1 needs to kill %2 of them to win.<br/>", fnf_attackingSide call BIS_fnc_sideName, _requiredKills];
        _mmNotesStructGamemode pushBack "<br/><br/>";
        _mmNotesStructGamemode pushBack "Jammers are in place to secure 1 or more specifically marked areas in which the HVTs can safely hide. If an HVT moves outside of any protected zone, their position will be revealed on the enemy's map until they return to safety. HVT locations will ALWAYS be revealed to their allies to aid them in tactical defense.";
        _mmNotesStructGamemode pushBack "<br/><br/>";

        _mmNotesStructGamemode pushBack format ["<t color='%1' size='1.2'>HVTs</t><br/>", COLOR3];
        {
          (_x # 0) params ["_targetHeader"];
          (_x # 1) params ["_role", "_name", "_obj"];
          if (isNil "_obj") then {continue};
          if (!isNull _obj) then {
            _mmNotesStructGamemode pushBack format ["<font color='%1'>  %2:</font> %3 (%4, played by %5)<br/>", COLOR3, _targetHeader, _name, _role, name _obj];
          } else {
            _mmNotesStructGamemode pushBack format ["<font color='%1'>  %2:</font> %3 (%4, [slot isn't filled])</font><br/>", COLOR3, _targetHeader, _name, _role, name _obj];
          };
        } forEach fnf_assassin_targets;

        [fnf_ui_structTextRef, "Gamemode", _mmNotesStructGamemode joinString ""] call BIS_fnc_setToPairs;
      }] call CBA_fnc_addEventHandler;

      ["REFRESH_BRIEF_GAMEMODE"] call CBA_fnc_localEvent;
    };
  };

  [fnf_ui_structTextRef, "Briefing", _mmNotesStructBrief joinString ""] call BIS_fnc_setToPairs;
  [fnf_ui_structTextRef, "Gamemode", _mmNotesStructGamemode joinString ""] call BIS_fnc_setToPairs;

};


if (!isNil "fnf_briefing_loadoutIND") then {
  call fnf_briefing_loadoutIND;
};
if (!isNil "fnf_briefing_loadoutOPF") then {
  call fnf_briefing_loadoutOPF;
};
if (!isNil "fnf_briefing_loadoutBLU") then {
  call fnf_briefing_loadoutBLU;
};

// [false] call fnf_briefing_fnc_parseGear;
call fnf_briefing_MMNotes;
call fnf_briefing_fnc_createOrbat;
true
