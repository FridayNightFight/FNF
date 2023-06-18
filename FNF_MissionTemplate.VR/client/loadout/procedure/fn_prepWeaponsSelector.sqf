/*
* Author: IndigoFox
*
* Description:
* Set up the array variable used by the ACE self-interact weapons picker.
*
* Arguments:
* 0: The unit to modify <OBJECT>
* 1: The array of weapon choices for current role <ARRAY>
*
* Return Value:
* true on success <BOOLEAN>
* nil if _unit is null or invalid data <NIL>
*
* Example:
* [player, _cfgWeaponChoices] call fnf_loadout_fnc_prepWeaponsSelector
*
* Public: No
*/

// iterate through _cfgWeaponChoices and add each weapon and appropriate mags to fnf_selector_weapons so they can be chosen from
params [
  ["_unit", objNull],
  ["_cfgChoices", []],
  ["_toSet", 0, [0]]
];

if (isNull _unit) exitWith {nil};

private _selectorVar = ["fnf_selector_weapons", "fnf_selector_sidearm"] select _toSet;

private _weaponChoices = [];
{
  _x params ["_weapons", "_mags"];
  {
    private _weapon = _x;
    private _compatMags = [_mags, _weapon] call fnf_loadout_fnc_getWeaponMagazines;
    _weaponChoices pushBack [_weapon, _compatMags];
  } forEach _weapons;
} forEach _cfgChoices;

// "debug_console" callExtension str(_weaponChoices);

// add flare launcher choices for sidearm if nighttime
if (_toSet isEqualTo 1 && !(missionNamespace getVariable ["fnf_environment_isDaytime", true])) then {
  {
    _weaponChoices pushBack _x;
  } forEach [
    ["rhs_weap_rsp30_white", []],
    ["rhs_weap_rsp30_green", []],
    ["rhs_weap_rsp30_red", []]
  ];
};
missionNamespace setVariable [_selectorVar, _weaponChoices];
true
