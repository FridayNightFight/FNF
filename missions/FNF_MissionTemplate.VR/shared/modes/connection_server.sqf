#include "..\..\mode_config\connection.sqf"

phx_term1HackingSide = sideUnknown;
phx_term2HackingSide = sideUnknown;
phx_term3HackingSide = sideUnknown;
phx_term1Animate = false;
phx_term2Animate = false;
phx_term3Animate = false;

_markerSetup = {
  _term = _this;

  _mark = createMarker [format ["%1Mark",_term],getPos _term];
  _mark setMarkerType "mil_dot";
  _mark setMarkerText format ["Terminal %1", [str _term, 4, 4] call BIS_fnc_trimString];

  [_term] call phx_fnc_objBuildingDamage;
};

switch (_numberOfTerminals) do {
  case 2: {deleteVehicle term3; {_x call _markerSetup;} forEach [term1,term2];};
  case 3: {{_x call _markerSetup;} forEach [term1,term2,term3];};
  default {hint "Terminal number not set correctly";};
};

phx_serverTerminalAction = {
  _term = _this select 0;
  _side = _this select 1;
  _animate = false;

  switch (_term) do {
    case term1: {
      missionNamespace setVariable ["phx_term1HackingSide",_side,true];
      if (!phx_term1Animate) then {
        _animate = true;
        phx_term1Animate = true;
      };
    };
    case term2: {
      missionNamespace setVariable ["phx_term2HackingSide",_side,true];
      if (!phx_term2Animate) then {
        _animate = true;
        phx_term2Animate = true;
      };
    };
    case term3: {
      missionNamespace setVariable ["phx_term3HackingSide",_side,true];
      if (!phx_term3Animate) then {
        _animate = true;
        phx_term3Animate = true;
      };
    };
  };

  _mark = str _term + "Mark";

  switch (_side) do {
    case east: {
      _mark setMarkerText format ["Terminal %1 - OPFOR", [str _term, 4, 4] call BIS_fnc_trimString];
      _mark setMarkerType "Faction_OPFOR_EP1";
    };
    case west: {
      _mark setMarkerText format ["Terminal %1 - BLUFOR", [str _term, 4, 4] call BIS_fnc_trimString];
      _mark setMarkerType "Faction_BLUFOR_EP1";
    };
    case independent: {
      _mark setMarkerText format ["Terminal %1 - INDFOR", [str _term, 4, 4] call BIS_fnc_trimString];
      _mark setMarkerType "Faction_INDFOR_EP1";
    };
  };


  if (_animate) then {
    [_term,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
  };

 format ["Terminal %1 connected for %2", [str _term, 4, 4] call BIS_fnc_trimString, switch (_side) do {case east: {"OPFOR"}; case west: {"BLUFOR"}; case independent: {"INDFOR"};}] remoteExec ["phx_fnc_hintThenClear", 0, false];
};

[_pointAddTime] spawn {
  params ["_pointAddTime"];
  _sideWon = sideUnknown;
  waitUntil {phx_term1HackingSide != sideUnknown || phx_term2HackingSide != sideUnknown || phx_term3HackingSide != sideUnknown};

  while {!(missionNamespace getVariable ["phx_gameEnd",false])} do {
    sleep _pointAddTime;

    [phx_term1HackingSide, 1] call BIS_fnc_respawnTickets;
    [phx_term2HackingSide, 1] call BIS_fnc_respawnTickets;
    [phx_term3HackingSide, 1] call BIS_fnc_respawnTickets;

    _sideWon = [[west,[west] call BIS_fnc_respawnTickets], [east,[east] call BIS_fnc_respawnTickets], [independent,[independent] call BIS_fnc_respawnTickets]] select {(_x select 1) >= 100};
    if (count _sideWon == 1) then {
      _sideWon = (_sideWon select 0) select 0;
      missionNamespace setVariable ["phx_gameEnd", true, true];

      [format ["%1 has reached 100 points.\n%1 wins!",
      switch (_sideWon) do {
        case east: {"OPFOR"};
        case west: {"BLUFOR"};
        case independent: {"INDFOR"};
      }]] remoteExec ["hint"];

      {
        if (!isNull _x) then {
          _x remoteExec ["removeAllActions"];
        };
      } forEach [term1,term2,term3];

      sleep 15;

      "end1" call BIS_fnc_endMissionServer;
    } else {
      if (count _sideWon > 1) then {
        _points = 0;
        _largeSide = sideUnknown;
        {
          if (_x select 1 > _points) then {
            _points = _x select 1;
            _largeSide = _x select 0
          };
        } forEach _sideWon;
        _sideWon = _largeSide;
        missionNamespace setVariable ["phx_gameEnd", true, true];

        [format ["%1 has reached 100 points.\n%1 wins!",
        switch (_sideWon) do {
          case east: {"OPFOR"};
          case west: {"BLUFOR"};
          case independent: {"INDFOR"};
        }]] remoteExec ["hint"];

        {
          if (!isNull _x) then {
            _x remoteExec ["removeAllActions"];
          };
        } forEach [term1,term2,term3];

        sleep 15;

        "end1" call BIS_fnc_endMissionServer;
      };
    };
  };
};
