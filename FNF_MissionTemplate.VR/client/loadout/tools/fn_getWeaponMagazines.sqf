/*
* Author: IndigoFox
*
* Description:
* Read supplied magazines and identify which are compatible with the supplied weapon.
*
* Arguments:
* 0: The magazine classnames to check in format "className:count" <ARRAY> of <STRING>
* 1: The classname of the weapon to check against <STRING>
* 2: Whether or not to check allMuzzles (i.e. underbarrel grenade launchers) (default: true) <BOOLEAN>
*
* Return Value:
* Array of magazines:count format compatible with the weapon <ARRAY> of <STRING>
*
* Example:
* [_mags, fnf_loadout_weapon] call fnf_loadout_fnc_getWeaponMagazines;
*
* Public: No
*/

params ["_toSearch", "_weapon", ["_allMuzzles", true]];
private _out = [];
{
  if ((_x splitString ':' select 0) in ([_weapon, _allMuzzles] call CBA_fnc_compatibleMagazines)) then {
    _out pushBack _x;
  };
} forEach _toSearch;
_out
