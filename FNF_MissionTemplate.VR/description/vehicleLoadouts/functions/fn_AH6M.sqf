params ["_vehicle"];

if !([_vehicle] call fnf_vehicleLoadouts_fnc_shouldModify) exitWith {};

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsOriginal"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

//////////////////////////////////////////////////////////

[_vehicle] call fnf_vehicleLoadouts_fnc_clearAll;

_vehicle addWeaponTurret["rhs_weap_MASTERSAFE",[-1]];

_vehicle addWeaponTurret["rhsusf_weap_LWIRCM",[-1]];
for "_i" from 1 to 10 do {
  _vehicle addMagazineTurret["rhsusf_mag_LWIRCM", [-1], 120];
};

_vehicle setPylonLoadout [2, "rhs_mag_m134_pylon_3000", true, [-1]];
_vehicle setAmmoOnPylon [2, 2000];

// _vehicle setPylonLoadout [3, "rhsusf_mag_gau19_melb_right", true, [-1]];
// _vehicle setAmmoOnPylon [3, 700];

_vehicle addWeaponTurret["rhs_weap_laserDesignator_AI",[0]];
_vehicle addMagazineTurret["rhs_LaserMag_ai", [0], 1];
_vehicle addWeaponTurret["rhs_weap_fcs_ah64",[0]];
_vehicle addMagazineTurret["rhs_LaserFCSMag", [0], 99];

//////////////////////////////////////////////////////////

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsModified"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

true
