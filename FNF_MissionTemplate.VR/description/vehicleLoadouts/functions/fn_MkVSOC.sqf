params ["_vehicle"];

if !([_vehicle] call fnf_vehicleLoadouts_fnc_shouldModify) exitWith {};

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsOriginal"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

//////////////////////////////////////////////////////////

[_vehicle] call fnf_vehicleLoadouts_fnc_clearAll;

_vehicle addWeaponTurret["RHS_MKV_M2_p",[0]];
for "_i" from 1 to 6 do {
  _vehicle addMagazineTurret["rhs_mag_100rnd_127x99_mag_Tracer_Red", [0]];
};

_vehicle addWeaponTurret["RHS_MKV_M2_s",[1]];
for "_i" from 1 to 6 do {
  _vehicle addMagazineTurret["rhs_mag_100rnd_127x99_mag_Tracer_Red", [1]];
};

_vehicle addWeaponTurret["LMG_Minigun",[2]];
for "_i" from 1 to 2 do {
  _vehicle addMagazineTurret["2000Rnd_762x51_Belt_T_Red", [2]];
};

_vehicle addWeaponTurret["LMG_Minigun",[3]];
for "_i" from 1 to 2 do {
  _vehicle addMagazineTurret["2000Rnd_762x51_Belt_T_Red", [3]];
};

_vehicle addWeaponTurret["Laserdesignator_mounted",[4]];
_vehicle addMagazineTurret["Laserbatteries", [4]];

//////////////////////////////////////////////////////////

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsModified"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

true
