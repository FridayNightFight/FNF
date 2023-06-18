/*
* Author: IndigoFox
*
* Description:
* Auto-load weapons.
*
* Arguments:
* 0: The unit to modify <OBJECT>
* 1: The role to evaluate (default: "BASE") <STRING>
*
* Return Value:
* true on success <BOOLEAN>
* nil if _unit is null or invalid data <NIL>
*
* Example:
* [player, PLAYERLOADOUTVAR] call fnf_loadout_fnc_loadWeapons
*
* Public: No
*/

// load weapons
params [
  ["_unit", objNull],
  ["_role", "BASE"]
];

if (isNull _unit) exitWith {nil};

{
  _x params ["_weaponClass", "_mags"];
  private _cfgWeapon = _weaponClass call CBA_fnc_getItemConfig;

  // check for multiple muzzles (eg: GL)
  private _muzzles = getArray (configFile >> "cfgWeapons" >> _weaponClass >> "muzzles") select {!(["SAFE", _x] call BIS_fnc_inString) && !(["melee", _x] call BIS_fnc_inString)};
  // "debug_console" callExtension str([_weaponClass, _muzzles]);

  {
    private _thisMuzzle = _x;
    private "_compatMag";
    // "debug_console" callExtension str([_weaponClass, _mags, configName(_cfgWeapon >> _thisMuzzle), [_mags, _cfgWeapon >> _thisMuzzle, false] call fnf_loadout_fnc_getWeaponMagazines]);

    if (_thisMuzzle == "this") then {
      _compatMag = ([_mags, _cfgWeapon, false] call fnf_loadout_fnc_getWeaponMagazines) select 0;
    } else {
      _compatMag = ([_mags, _cfgWeapon >> _thisMuzzle, false] call fnf_loadout_fnc_getWeaponMagazines) select 0;
    };
    _compatMag = _compatMag splitString ':' select 0;
    // "debug_console" callExtension str([_weaponClass, _thisMuzzle, _compatMag]);

    _unit removeMagazine _compatMag;
    switch (_weaponClass) do {
      case (primaryWeapon _unit): {
        _unit addPrimaryWeaponItem _compatMag;
      };
      case (handgunWeapon player): {
        _unit addHandgunItem _compatMag;
      };
    };
  } forEach _muzzles;
} forEach [
  [primaryWeapon _unit, fnf_loadout_weaponMagazines],
  [handgunWeapon _unit, fnf_loadout_sidearmMagazines]
];
true
