#include "..\..\mode_config\connection.sqf"

["off"] call acex_fortify_fnc_handleChatCommand;

fnf_term1HackingSide = sideEmpty;
fnf_term2HackingSide = sideEmpty;
fnf_term3HackingSide = sideEmpty;
fnf_term1Animate = false;
fnf_term2Animate = false;
fnf_term3Animate = false;

//Show ticket counter
[] remoteExec ["BIS_fnc_showMissionStatus",0,true];

_markerSetup = {
  _term = _this;

  _mark = createMarker [format ["%1Mark",_term],getPos _term];
  _mark setMarkerType "mil_dot";
  _mark setMarkerColor "ColorCIV";
  _mark setMarkerText format ["Terminal %1", [str _term, 4, 4] call BIS_fnc_trimString];
};

private _terminals = [];

switch (_numberOfTerminals) do {
  case 2: {
    deleteVehicle term3;
    {
      _terminals pushback _x;
      _x call _markerSetup;
    } forEach [term1,term2];
  };
  case 3: {
    {
      _terminals pushback _x;
      _x call _markerSetup;
    } forEach [term1,term2,term3];
  };
  default {hint "Terminal number not set correctly";};
};

fnf_briefingTable_highlightAreas = []; // contains places that should be highlighted with a sphere
private _objectives = [];
{
  _objectives pushBack [format["Terminal %1", _forEachIndex + 1], getPos _x];
  fnf_briefingTable_highlightAreas pushBack [getPos _x, 25];
} forEach _terminals;
[_objectives] call fnf_briefing_fnc_setupTables;
publicVariable "fnf_briefingTable_highlightAreas";

fnf_specObjectives = _terminals;
publicVariable "fnf_specObjectives";

[] remoteExec ["BIS_fnc_showMissionStatus",0,true];

fnf_serverTerminalAction = {
  _term = _this select 0;
  _side = _this select 1;
  _animate = false;

  switch (_term) do {
    case term1: {
      missionNamespace setVariable ["fnf_term1HackingSide",_side,true];
      if (!fnf_term1Animate) then {
        _animate = true;
        fnf_term1Animate = true;
      };
    };
    case term2: {
      missionNamespace setVariable ["fnf_term2HackingSide",_side,true];
      if (!fnf_term2Animate) then {
        _animate = true;
        fnf_term2Animate = true;
      };
    };
    case term3: {
      missionNamespace setVariable ["fnf_term3HackingSide",_side,true];
      if (!fnf_term3Animate) then {
        _animate = true;
        fnf_term3Animate = true;
      };
    };
  };

  _mark = str _term + "Mark";
  _termNum = [str _term, 4, 4] call BIS_fnc_trimString;

  _markColor = switch (_side) do {
    case east: {"ColorEAST"};
    case west: {"ColorWEST"};
    case independent: {"ColorGUER"};
    default {"ColorCIV"};
  };

  switch (_side) do {
    case east: {
      _mark setMarkerText format ["Terminal %1 - OPFOR", _termNum];
      _mark setMarkerType "Faction_OPFOR_EP1";
      _mark setMarkerColor _markColor;
    };
    case west: {
      _mark setMarkerText format ["Terminal %1 - BLUFOR", _termNum];
      _mark setMarkerType "Faction_BLUFOR_EP1";
      _mark setMarkerColor _markColor;
    };
    case independent: {
      _mark setMarkerText format ["Terminal %1 - INDFOR", _termNum];
      _mark setMarkerType "Faction_INDFOR_EP1";
      _mark setMarkerColor _markColor;
    };
  };


  if (_animate) then {
    if ((typeOf _term) isEqualTo "Land_DataTerminal_01_F") then {
      [_term,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    };
  };

//  format ["Terminal %1 connected for %2", _termNum, switch (_side) do {case east: {"OPFOR"}; case west: {"BLUFOR"}; case independent: {"INDFOR"};}] remoteExec ["fnf_fnc_hintThenClear", 0, false];
  private _str = format ["Terminal %1 connected for %2", _termNum, switch (_side) do {case east: {"OPFOR"}; case west: {"BLUFOR"}; case independent: {"INDFOR"};}];
  [_str, "warning", 7] remoteExec ["fnf_ui_fnc_notify",0,false];
};

fnf_connectionWin = {
  fnf_gameEnd = true;
  publicVariable "fnf_gameEnd";

  _side = _this;

  [_sideWon, "has reached 100 points and won!"] spawn fnf_server_fnc_gameEnd;

  {
    if (!isNull _x) then {
      _x remoteExec ["removeAllActions"];
    };
  } forEach [term1,term2,term3];

};

_sideWon = sideEmpty;
waitUntil {fnf_term1HackingSide != sideEmpty || fnf_term2HackingSide != sideEmpty || fnf_term3HackingSide != sideEmpty};

while {!(missionNamespace getVariable ["fnf_gameEnd",false])} do {
  [fnf_term1HackingSide, 1] call BIS_fnc_respawnTickets;
  [fnf_term2HackingSide, 1] call BIS_fnc_respawnTickets;
  [fnf_term3HackingSide, 1] call BIS_fnc_respawnTickets;

  _sideWon = [[west,[west] call BIS_fnc_respawnTickets], [east,[east] call BIS_fnc_respawnTickets], [independent,[independent] call BIS_fnc_respawnTickets]] select {(_x select 1) >= 100};
  _sideWonCount = count _sideWon;
  _winCall = (_sideWonCount >= 1);
  switch (true) do {
    case (_sideWonCount == 1): {_sideWon = (_sideWon select 0) select 0};
    case (_sideWonCount > 1): {
      _points = 0;
      _largeSide = sideEmpty;
      {
        _sidePoints = _x select 1;
        if (_sidePoints > _points) then {
          _points = _sidePoints;
          _largeSide = _x select 0;
        };
      } forEach _sideWon;
      _sideWon = _largeSide;
    };
  };
  if (_winCall) then {
    _sideWon call fnf_connectionWin;
  };
  sleep _pointAddTime;
};
