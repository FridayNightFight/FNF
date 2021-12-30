// game mode details
if (isDedicated) exitWith {};

// colors: https://imgur.com/a/AfimbU2
#define COLOR1 "#944509"
#define COLOR2 "#FF8E38"
#define COLOR3 "#E0701B"
#define COLOR4 "#008394"
#define COLOR5 "#1BCAE0"

private _gamemodeNotes = [];

_gamemodeNotes pushBack format ["<font size='16' color='" + COLOR3 + "' face='PuristaBold'>GAMEMODE: %1</font>", toUpper phx_gameMode];
_gamemodeNotes pushBack "<br/>";
_gamemodeNotes pushBack "<br/>";
if (!isNil "phx_overTimeConStr") then {
  _gamemodeNotes pushBack "OVERTIME CONDITIONS:<br/>" + phx_overTimeConStr;
  _gamemodeNotes pushBack "<br/>";
  _gamemodeNotes pushBack "<br/>";
} else {
  _gamemodeNotes pushBack "<br/>";
  _gamemodeNotes pushBack "<br/>";
};



switch (phx_gameMode) do {
  case "destroy": {
    #include "..\..\mode_config\destroy.sqf";
    _objArr = [_obj1,_obj2,_obj3];
    _objects = [_obj1 select 0, _obj2 select 0, _obj3 select 0] select {!isNull _x};
    _gamemodeNotes pushBack format ["Destroy objectives: %1", count _objects];
    _gamemodeNotes pushBack "<br/>";
    {
      _gamemodeNotes pushBack format[
        "Objective %1:<br/><img image='%2' height=200/><br/>",
        _forEachIndex + 1,
        getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "EditorPreview")
      ];
    } forEach _objects;
  };
  case "uplink": {
    #include "..\..\mode_config\uplink.sqf";

    _gamemodeNotes pushBack format ["Terminal count: %1", _numberOfTerminals];
    _gamemodeNotes pushBack "<br/>";

    if (_terminalHackTime isEqualType []) then {
      _gamemodeNotes pushBack "Hack time:";
      _gamemodeNotes pushBack "<br/>";
      for "_i" from 0 to _numberOfTerminals do {
        _gamemodeNotes pushBack format ["  Terminal %1: %2", _i + 1, _terminalHackTime # _i];
        _gamemodeNotes pushBack "<br/>";
      };
    } else {
      _gamemodeNotes pushBack format ["Hack time: %1", _terminalHackTime];
      _gamemodeNotes pushBack "<br/>";
    };
  };
  case "rush": {
    #include "..\..\mode_config\rush.sqf";
    _gamemodeNotes pushBack format ["Terminal count: %1", _numberOfTerminals];
    _gamemodeNotes pushBack "<br/>";

    if (_terminalHackTime isEqualType []) then {
      _gamemodeNotes pushBack "Hack time:";
      for "_i" from 0 to _numberOfTerminals do {
        _gamemodeNotes pushBack format ["Terminal %1: %2", _i + 1, _terminalHackTime # _i];
        _gamemodeNotes pushBack "<br/>";
      };
    } else {
      _gamemodeNotes pushBack format ["Hack time: %1", _terminalHackTime];
      _gamemodeNotes pushBack "<br/>";
    };

    [_gamemodeNotes] call _fnc_postGameModeDiary;
  };
  case "connection": {
    #include "..\..\mode_config\connection.sqf";
    _gamemodeNotes pushBack format ["Terminal count: %1", _numberOfTerminals];
    _gamemodeNotes pushBack "<br/>";

    _gamemodeNotes pushBack format ["One point accrued per terminal every %1 seconds", _pointAddTime];
    _gamemodeNotes pushBack "<br/>";
  };
  case "captureTheFlag": {
    #include "..\..\mode_config\ctf.sqf";

    private _capZoneShown = "";
    switch (_showCapZoneGlobal) do {
      case true: {_capZoneShown = "to all players at mission start"};
      case false: {_capZoneShown = "only to attackers until flag is touched"};
    };
    _gamemodeNotes pushBack format ["Capture zone visible %1", _capZoneShown];
    _gamemodeNotes pushBack "<br/>";

    _gamemodeNotes pushBack format ["Flag marker updated every %1 seconds", _flagMarkUpdateTime];
    _gamemodeNotes pushBack "<br/>";

    _gamemodeNotes pushBack format ["Attackers must hold the flag in capture zone for %1 seconds to achieve victory", _flagCaptureTime];
    _gamemodeNotes pushBack "<br/>";

  };
  case "adSector": {
    #include "..\..\mode_config\adSector.sqf";
    _gamemodeNotes pushBack format ["Sector count: %1", _numberOfSectors];
    _gamemodeNotes pushBack "<br/>";

    private _isSequential = "";
    switch (_inOrder) do {
      case true: {_isSequential = "Yes"};
      case false: {_isSequential = "No"};
    };
    _gamemodeNotes pushBack format ["Sequential: %1", _isSequential];
    _gamemodeNotes pushBack "<br/>";
  };
  case "neutralSector": {
    #include "..\..\mode_config\neutralSector.sqf";
    _gamemodeNotes pushBack format ["Sector count: %1", _numberOfSectors];
    _gamemodeNotes pushBack "<br/>";

    _gamemodeNotes pushBack format ["One point accrued per sector every %1 seconds", _pointAddTime];
    _gamemodeNotes pushBack "<br/>";
  };
  case "scavHunt": {
    #include "..\..\mode_config\scavHunt.sqf";
    _gamemodeNotes pushBack format ["Objective count: %1", _numberOfObjectives];
    _gamemodeNotes pushBack "<br/>";

    _gamemodeNotes pushBack format ["Specialized transports per side: %1", _numberOfTransportsPerSide];
    _gamemodeNotes pushBack "<br/>";
  };
  case "assassin": {
    ["REFRESH_BRIEF_GAMEMODE", {
      #include "..\..\mode_config\assassin.sqf";

      private _gamemodeNotes = [];

      _gamemodeNotes pushBack format ["<font size='16' color='" + COLOR3 + "' face='PuristaBold'>GAMEMODE: %1</font>", toUpper phx_gameMode];
      _gamemodeNotes pushBack "<br/>";
      _gamemodeNotes pushBack "<br/>";
      if (!isNil "phx_overTimeConStr") then {
        _gamemodeNotes pushBack "OVERTIME CONDITIONS:<br/>" + phx_overTimeConStr;
        _gamemodeNotes pushBack "<br/>";
        _gamemodeNotes pushBack "<br/>";
      } else {
        _gamemodeNotes pushBack "<br/>";
        _gamemodeNotes pushBack "<br/>";
      };

      _gamemodeNotes pushBack format ["HVT Count: %1<br/>", count _targets];
      _gamemodeNotes pushBack format ["%1 needs to kill %2 of them to win.<br/>", phx_attackingSide call BIS_fnc_sideName, _requiredKills];
      _gamemodeNotes pushBack "<br/><br/>";
      _gamemodeNotes pushBack "Jammers are in place to secure 1 or more specifically marked areas in which the HVTs can safely hide. If an HVT moves outside of any protected zone, their position will be revealed on the enemy's map until they return to safety. HVT locations will ALWAYS be revealed to their allies to aid them in tactical defense.";
      _gamemodeNotes pushBack "<br/><br/>";

      _gamemodeNotes pushBack format ["<font color='%1' size='16'>HVTs</font><br/>", COLOR3];
      {
        (_x # 0) params ["_targetHeader"];
        (_x # 1) params ["_role", "_name", "_obj"];
        if (!isNil "_obj") then {
          _gamemodeNotes pushBack format ["<font color='%1'>  %2:</font> %3 (%4, played by %5)</font><br/>", COLOR3, _targetHeader, _name, _role, name _obj];
        } else {
          _gamemodeNotes pushBack format ["<font color='%1'>  %2:</font> %3 (%4, played by [NOT FILLED])</font><br/>", COLOR3, _targetHeader, _name, _role, name _obj];
        };
      } forEach phx_assassinationTargets;
      player setDiaryRecordText [["Diary", phx_gameModeDiary], [
        format["Gamemode - %1", toUpper phx_gameMode],
        _gamemodeNotes joinString ""
        ]
      ];
    }] call CBA_fnc_addEventHandler;
  };
};


player setDiaryRecordText [["Diary", phx_gameModeDiary], [
  format["Gamemode - %1", toUpper phx_gameMode],
  _gamemodeNotes joinString ""
  ]
];
