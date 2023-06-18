params ["_vehicle"];

if !([_vehicle] call fnf_vehicleLoadouts_fnc_shouldModify) exitWith {};

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsOriginal"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

//////////////////////////////////////////////////////////

[_vehicle] call fnf_vehicleLoadouts_fnc_clearAll;

_vehicle addWeaponTurret["SmokeLauncher",[-1]];
_vehicle addMagazineTurret["SmokeLauncherMag_boat", [-1]];

_vehicle addWeaponTurret["LMG_Minigun",[0]];
for "_i" from 1 to 2 do {
  _vehicle addMagazineTurret["2000Rnd_762x51_Belt_T_Yellow", [0]];
};

_vehicle addWeaponTurret["LMG_Minigun",[1]];
for "_i" from 1 to 2 do {
  _vehicle addMagazineTurret["2000Rnd_762x51_Belt_T_Yellow", [1]];
};
//////////////////////////////////////////////////////////

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsModified"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

true
