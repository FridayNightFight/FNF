if (!isServer) exitWith {};

#include "..\..\mode_config\neutralSector.sqf"

_sectors = [phx_sector1];
_sideWon = sideEmpty;
phx_neutralSector_pointAddTime = _pointAddTime;

switch (_numberOfSectors) do {
  case 1: {
    deleteVehicle phx_sector2;
    deleteVehicle phx_sector3;
  };
  case 2: {
    deleteVehicle phx_sector3;
    _sectors pushBack phx_sector2;
  };
  case 3: {
    _sectors pushBack phx_sector2;
    _sectors pushBack phx_sector3;
  };
};

_win = {
  missionNamespace setVariable ["phx_gameEnd", true, true];

  _side = _this;

  [format ["%1 has reached 100 points.\n%1 wins!",
  switch (_sideWon) do {
    case east: {"OPFOR"};
    case west: {"BLUFOR"};
    case independent: {"INDFOR"};
  }]] remoteExec ["hint"];

  sleep 20;

  "end1" call BIS_fnc_endMissionServer;
};

waitUntil {
  {
    !((_x getVariable "owner") isEqualTo "UNKNOWN")
  } forEach _sectors;
};

while {!phx_gameEnd} do {
  {
    if !((_x getVariable "owner") isEqualTo "UNKNOWN") then {
      [_x getVariable "owner", 1] call BIS_fnc_respawnTickets;
    };
  } forEach _sectors;

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
    _sideWon call _win;
  };

  sleep phx_neutralSector_pointAddTime;
};
