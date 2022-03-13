params ["_vehicle"];

if !([_vehicle] call fnf_vehicleLoadouts_fnc_shouldModify) exitWith {};

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsOriginal"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

//////////////////////////////////////////////////////////

[_vehicle] call fnf_vehicleLoadouts_fnc_clearAll;

_vehicle addWeaponTurret ["rhs_weap_2b14", [0]];

for "_i" from 1 to 2 do {
  _vehicle addMagazineTurret ["rhs_mag_3vo18_10", [0], 10];
};
_vehicle addMagazineTurret ["rhs_mag_3vo18_10", [0], 4];

for "_i" from 1 to 2 do {
  _vehicle addMagazineTurret ["rhs_mag_d832du_10", [0], 8];
};
for "_i" from 1 to 2 do {
  _vehicle addMagazineTurret ["rhs_mag_3vs25m_10", [0], 8];
};

//////////////////////////////////////////////////////////

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsModified"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

true
