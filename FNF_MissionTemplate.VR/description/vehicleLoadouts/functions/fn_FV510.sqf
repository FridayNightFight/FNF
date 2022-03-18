params ["_vehicle"];

if !([_vehicle] call fnf_vehicleLoadouts_fnc_shouldModify) exitWith {};

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsOriginal"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

//////////////////////////////////////////////////////////;

[_vehicle] call fnf_vehicleLoadouts_fnc_clearAll;

_vehicle addWeaponTurret["UK3CB_Factions_M2_AAV",[0]];
for "_i" from 1 to 2 do {
  _vehicle addMagazineTurret["uk3cb_mag_100rnd_127x99_red", [0], 100];
};

_vehicle addWeaponTurret["UK3CB_L94A1_veh", [0]];
for "_i" from 1 to 2 do {
  _vehicle addMagazineTurret["uk3cb_m240_800Rnd_762x51_red", [0], 800];
};

_vehicle addWeaponTurret["SmokeLauncher",[0,0]];
for "_i" from 1 to 2 do {
  _vehicle addMagazineTurret["SmokeLauncherMag", [0,0], 2];
};

//////////////////////////////////////////////////////////

if (missionNamespace getVariable ["fnf_debug", false]) then {
  [_vehicle, "turretsModified"] call fnf_vehicleLoadouts_fnc_getTurretWeps;
};

true
