params ["_vehicle"];

if !([_vehicle] call fnf_vehicleLoadouts_fnc_shouldModify) exitWith {};

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsOriginal"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

//////////////////////////////////////////////////////////;

[_vehicle] call fnf_vehicleLoadouts_fnc_clearAll;

_vehicle addWeaponTurret ["rhs_mortar_81mm", [0]];

for "_i" from 1 to 2 do {
  _vehicle addMagazineTurret ["rhs_12Rnd_m821_HE", [0], 12];
};
for "_i" from 1 to 2 do {
  _vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white", [0], 8];
};
for "_i" from 1 to 2 do {
  _vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white", [0], 8];
};

//////////////////////////////////////////////////////////

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsModified"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

true
