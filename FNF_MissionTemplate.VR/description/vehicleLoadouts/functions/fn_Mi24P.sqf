params ["_vehicle"];

if !([_vehicle] call fnf_vehicleLoadouts_fnc_shouldModify) exitWith {};

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsOriginal"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

//////////////////////////////////////////////////////////

[_vehicle] call fnf_vehicleLoadouts_fnc_clearAll;

_vehicle addWeaponTurret["rhs_weap_MASTERSAFE",[-1]];

_vehicle addWeaponTurret["rhs_weap_DIRCM_Lipa",[-1]];
for "_i" from 1 to 10 do {
  _vehicle addMagazineTurret["rhs_mag_DIRCM_Lipa", [-1], 80];
};

_vehicle addWeaponTurret["rhs_weap_yakB",[-1]];
_vehicle addMagazineTurret["rhs_mag_127x108mm_1slt_1470", [-1], 1470];

_vehicle setPylonLoadout [7, "rhs_ASO2_CMFlare_Chaff_Magazine_x4", true, [-1]];
_vehicle setAmmoOnPylon [7, 64];

_vehicle addWeaponTurret["rhs_weap_MASTERSAFE",[0]];

_vehicle addWeaponTurret["rhs_weap_fcs_mi24",[0]];
_vehicle addMagazineTurret["rhs_LaserFCSMag", [0], 99];

//////////////////////////////////////////////////////////

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsModified"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

true
