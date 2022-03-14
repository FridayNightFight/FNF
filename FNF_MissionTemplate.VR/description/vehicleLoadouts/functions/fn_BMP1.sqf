params ["_vehicle"];

if !([_vehicle] call fnf_vehicleLoadouts_fnc_shouldModify) exitWith {};

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsOriginal"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

//////////////////////////////////////////////////////////;

[_vehicle] call fnf_vehicleLoadouts_fnc_clearAll;

_vehicle addWeaponTurret["rhs_weap_smokegen",[-1]];
_vehicle addMagazineTurret["rhs_mag_smokegen", [-1], 999];

_vehicle addWeaponTurret["rhs_weap_pkt",[0]];
for "_i" from 1 to 4 do {
  _vehicle addMagazineTurret["rhs_mag_762x54mm_250", [0], 250];
};

//////////////////////////////////////////////////////////

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsModified"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

true
