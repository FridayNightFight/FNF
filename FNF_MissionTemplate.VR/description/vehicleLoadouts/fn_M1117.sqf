params ["_vehicle"];

if !(_vehicle getVariable ["fnf_vehicleLoadouts_useDefault", true]) exitWith {false};

[_vehicle] call fnf_vehicleLoadouts_fnc_clearAll;

_vehicle addWeaponTurret["TruckHorn",[-1]];

_vehicle addWeaponTurret["rhsusf_weap_duke",[0,0]];
_vehicle addMagazineTurret["rhsusf_mag_duke",[0,0]];

_vehicle addWeaponTurret["rhsusf_weap_M257_8",[0]];
_vehicle addMagazineTurret["rhsusf_mag_L8A3_8",[0]];
_vehicle addWeaponTurret["RHS_M2_M1117",[0]];
for "_i" from 1 to 8 do {
  _vehicle addMagazineTurret["rhs_mag_100rnd_127x99_mag_Tracer_Red", [0]];
};
_vehicle addWeaponTurret["rhs_weap_m240_m113", [0]];
for "_i" from 1 to 7 do {
  _vehicle addMagazineTurret["rhs_mag_762x51_M240_200", [0]];
};

true
