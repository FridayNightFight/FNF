if (!isServer) exitWith {};

#include "..\..\mode_config\neutralSector.sqf"

["off"] call acex_fortify_fnc_handleChatCommand;


_validateSectors = ["fnf_sector1", "fnf_sector2", "fnf_sector3"] select [0, _numberOfSectors];
_validateSectors = _validateSectors apply {missionNamespace getVariable [_x, objNull]} select {!isNull _x};
if (count _validateSectors < _numberOfSectors) exitWith {
  "[FNF] (Gamemode) Failed to initialize NSector: Fewer sector modules present than number set in mode_config!" remoteExec ["systemChat", 0, true];
};

fnf_gamemode_sectors = _validateSectors;
_sideWon = sideEmpty;
fnf_neutralSector_pointAddTime = _pointAddTime;

switch (_numberOfSectors) do {
  case 1: {
    {
      private _module = missionNamespace getVariable [_x, objNull];
      if (!isNull _module) then {
        deleteVehicle _module;
      };
    } forEach ["fnf_sector2", "fnf_sector3"];
  };
  case 2: {
    {
      private _module = missionNamespace getVariable [_x, objNull];
      if (!isNull _module) then {
        deleteVehicle _module;
      };
    } forEach ["fnf_sector3"];
  };
  case 3: {};
};

fnf_briefingTable_highlightAreas = []; // contains places that should be highlighted with a sphere
private _objectives = [];
{
  _objectives pushBack [format["Sector %1", _forEachIndex + 1], getPos _x];
  fnf_briefingTable_highlightAreas pushBack [getPos _x, ((_x getVariable "objectArea")#0) max ((_x getVariable "objectArea")#1)];
} forEach fnf_gamemode_sectors;
[_objectives] call fnf_briefing_fnc_setupTables;
publicVariable "fnf_briefingTable_highlightAreas";

fnf_specObjectives = [];
publicVariable "fnf_specObjectives";


_win = {
  fnf_gameEnd = true;
  publicVariable "fnf_gameEnd";

  _sideWon = _this;

  [_sideWon, "has reached 100 points and won!"] spawn fnf_server_fnc_gameEnd;
};

waitUntil {
  sleep 1;
  ({_x getVariable ["owner", sideUnknown] != sideUnknown} count fnf_gamemode_sectors) > 0
};

["First sector captured<br/>Points will be begin to be awarded in 5 minutes"] remoteExec ["fnf_fnc_hintThenClear"];
uiSleep 300;

while {!fnf_gameEnd} do {
  {
    if !((_x getVariable "owner") == sideUnknown) then {
      [_x getVariable "owner", 1] call BIS_fnc_respawnTickets;
    };
  } forEach fnf_gamemode_sectors;

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
