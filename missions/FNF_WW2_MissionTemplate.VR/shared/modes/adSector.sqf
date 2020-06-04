if (!isServer) exitWith {};

#include "..\..\mode_config\adSector.sqf"

phx_capNum = 0;

if (_numberOfSectors == 1) then {
  deleteVehicle phx_sector2;
  deleteVehicle phx_sector3;
};

if (_numberOfSectors == 2) then {
  deleteVehicle phx_sector3;
};

{
  if (!isNull _x) then {
    _x setVariable ["owner", phx_defendingSide];
  };
} forEach [phx_sector1, phx_sector2, phx_sector3];

_phx_server_sectorWin = {
  [format ["%1 has captured all sectors.\n%1 wins!",
  switch (phx_attackingSide) do {
    case east: {"OPFOR"};
    case west: {"BLUFOR"};
    case independent: {"INDFOR"};
  }]] remoteExec ["hint"];

  sleep 20;

  "end1" call bis_fnc_endmissionserver;
};

[phx_defendingSide, ["dtask1"], ["Defend sector Alpha", "Defend Alpha", ""], phx_sector1, "AUTOASSIGNED"] call BIS_fnc_taskCreate;
[phx_attackingSide, ["atask1"], ["Capture sector Alpha", "Capture Alpha", ""], phx_sector1, "AUTOASSIGNED"] call BIS_fnc_taskCreate;

[phx_defendingSide, ["dtask2"], ["Defend sector Bravo", "Defend Bravo", ""], phx_sector2, "AUTOASSIGNED"] call BIS_fnc_taskCreate;
[phx_attackingSide, ["atask2"], ["Capture sector Bravo", "Capture Bravo", ""], phx_sector2, "AUTOASSIGNED"] call BIS_fnc_taskCreate;

[phx_defendingSide, ["dtask3"], ["Defend sector Charlie", "Defend Charlie", ""], phx_sector3, "AUTOASSIGNED"] call BIS_fnc_taskCreate;
[phx_attackingSide, ["atask3"], ["Capture sector Charlie", "Capture Charlie", ""], phx_sector3, "AUTOASSIGNED"] call BIS_fnc_taskCreate;

[] spawn {
  waitUntil {(phx_sector1 getVariable "owner") == phx_attackingSide};

  ["dtask1", "FAILED", true] call BIS_fnc_taskSetState;
  ["atask1", "SUCCEEDED", true] call BIS_fnc_taskSetState;
  deleteVehicle phx_sector1;

  phx_capNum = phx_capNum + 1;
};

[] spawn {
  waitUntil {(phx_sector2 getVariable "owner") == phx_attackingSide};

  ["dtask2", "FAILED", true] call BIS_fnc_taskSetState;
  ["atask2", "SUCCEEDED", true] call BIS_fnc_taskSetState;

  deleteVehicle phx_sector2;

  phx_capNum = phx_capNum + 1;
};


[] spawn {
  waitUntil {(phx_sector3 getVariable "owner") == phx_attackingSide};

  ["dtask3", "FAILED", true] call BIS_fnc_taskSetState;
  ["atask3", "SUCCEEDED", true] call BIS_fnc_taskSetState;

  deleteVehicle phx_sector3;

  phx_capNum = phx_capNum + 1;
};

waitUntil {phx_capNum >= _numberOfSectors};

call _phx_server_sectorWin;
