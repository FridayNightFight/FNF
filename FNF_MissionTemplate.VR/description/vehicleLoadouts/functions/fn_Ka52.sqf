params ["_vehicle"];

if !([_vehicle] call fnf_vehicleLoadouts_fnc_shouldModify) exitWith {};

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsOriginal"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

//////////////////////////////////////////////////////////

[_vehicle] call fnf_vehicleLoadouts_fnc_clearAll;

_vehicle addWeaponTurret["rhs_weap_MASTERSAFE",[-1]];

_vehicle addWeaponTurret["rhs_weap_DIRCM_Vitebsk",[-1]];
for "_i" from 1 to 10 do {
  _vehicle addMagazineTurret["rhs_mag_DIRCM_Vitebsk", [-1], 120];
};

_vehicle setPylonLoadout [5, "rhs_UV26_CMFlare_Chaff_Magazine_x4", true, [-1]];
_vehicle setAmmoOnPylon [5, 64];

_vehicle addWeaponTurret["rhs_weap_MASTERSAFE_Holdster15",[0]];

_vehicle addWeaponTurret["rhs_weap_fcs_mi24",[0]];
_vehicle addMagazineTurret["rhs_LaserFCSMag", [0], 99];

_vehicle addWeaponTurret["LMG_Minigun",[0]];
_vehicle addMagazineTurret["2000Rnd_762x51_Belt_T_Green", [0], 1200];

//////////////////////////////////////////////////////////

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsModified"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

true
