params ["_vehicle"];

if !([_vehicle] call fnf_vehicleLoadouts_fnc_shouldModify) exitWith {};

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsOriginal"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

//////////////////////////////////////////////////////////;

[_vehicle] call fnf_vehicleLoadouts_fnc_clearAll;

_vehicle addWeaponTurret["TruckHorn",[-1]];
_vehicle addMagazineTurret["rhs_proxy_pkm_18_mag", [-1], 18];

_vehicle addWeaponTurret["rhs_weap_pkm_tigr",[0]];
for "_i" from 1 to 18 do {
  _vehicle addMagazineTurret["rhs_mag_762x54mm_100", [0], 100];
};

//////////////////////////////////////////////////////////

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsModified"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

true
