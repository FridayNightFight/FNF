params ["_vehicle"];
// "debug_console" callExtension "attempt 3265";
// "debug_console" callExtension format["_this = %1", _this];

// don't run if using FNF default loadout
waitUntil {!isNull _vehicle};
if !([_vehicle] call fnf_vehicleLoadouts_fnc_shouldModify) exitWith {};

private _pylonInfo = _vehicle getVariable ["fnf_pylonLoadout", []];
if (count _pylonInfo == 0) exitWith {};

{
  _x params ["_pylonIndex", "_pylonName", "_turretPath", "_magazine", "_magAmmo"];

  // if no mag, make sure it's empty
  if (_magazine == "") then {
    _vehicle setPylonLoadout [_pylonName, ""];
    continue;
  };

  _vehicle setPylonLoadout [_pylonName, _magazine, true, _turretPath];
  _vehicle setAmmoOnPylon [_pylonName, _magAmmo];

} forEach (_pylonInfo);

// example with empty pylons
/*
  [
    [1, "pylon1", [-1], "", -1, ""],
    [2, "pylon2", [-1], "", -1, ""],
    [3, "pylon3", [-1], "", -1, ""],
    [4, "pylon4", [-1], "rhsusf_mag_gau19_melb_right", 1300, "2:10001567"]
  ]
*/
