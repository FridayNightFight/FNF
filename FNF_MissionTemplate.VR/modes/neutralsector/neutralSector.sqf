if (!isServer) exitWith {};

#include "..\..\mode_config\neutralSector.sqf"

["off"] call acex_fortify_fnc_handleChatCommand;

_sectors = [fnf_sector1];
_sideWon = sideEmpty;
fnf_neutralSector_pointAddTime = _pointAddTime;

switch (_numberOfSectors) do {
  case 1: {
    deleteVehicle fnf_sector2;
    deleteVehicle fnf_sector3;
  };
  case 2: {
    deleteVehicle fnf_sector3;
    _sectors pushBack fnf_sector2;
  };
  case 3: {
    _sectors pushBack fnf_sector2;
    _sectors pushBack fnf_sector3;
  };
};

_win = {
  fnf_gameEnd = true;
  publicVariable "fnf_gameEnd";

  _side = _this;

  [_sideWon, "has reached 100 points and won!"] spawn fnf_server_fnc_gameEnd;
};

waitUntil {
  sleep 1;
  fnf_sector1 getVariable ["owner", sideUnknown] != sideUnknown ||
  fnf_sector2 getVariable ["owner", sideUnknown] != sideUnknown ||
  fnf_sector3 getVariable ["owner", sideUnknown] != sideUnknown
};

["First sector captured<br/>Points will be begin to be awarded in 5 minutes"] remoteExec ["fnf_fnc_hintThenClear"];
uiSleep 300;

while {!fnf_gameEnd} do {
  {
    if !((_x getVariable "owner") == sideUnknown) then {
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

  sleep fnf_neutralSector_pointAddTime;
};
