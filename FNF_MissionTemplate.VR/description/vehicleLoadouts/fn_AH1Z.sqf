params ["_vehicle"];

if !(_vehicle getVariable ["fnf_vehicleLoadouts_useDefault", true]) exitWith {false};

[_vehicle] call fnf_vehicleLoadouts_fnc_clearAll;

_vehicle addWeaponTurret["rhs_weap_MASTERSAFE",[-1]];

_vehicle setPylonLoadout [7, "rhsusf_ANALE39_CMFlare_Chaff_Magazine_x4", true, [-1]];
_vehicle setAmmoOnPylon [7, 60];

_vehicle addWeaponTurret["rhs_weap_MASTERSAFE",[0]];
_vehicle addWeaponTurret["rhs_weap_fcs_ah64",[0]];
_vehicle addMagazineTurret["rhs_LaserFCSMag", [0]];
_vehicle addWeaponTurret["RHS_weap_m134_pylon",[0]];
_vehicle addMagazineTurret["rhs_mag_m134_pylon_3000", [0]];
_vehicle addWeaponTurret["rhs_weap_laserDesignator_AI",[0]];
_vehicle addMagazineTurret["rhs_LaserMag_ai", [0]];

true
