/*
* Author: IndigoFox
*
* Description:
* Apply uniform and uniform accessories.
*
* Arguments:
* 0: The unit to modify <OBJECT>
* 1: Classname of uniform <STRING>
* 2: Classname of vest <STRING>
* 3: Classname of backpack <STRING>
* 4: Classname of headgear <STRING>
*
* Return Value:
* true on success <BOOLEAN>
* nil if _unit is null <NIL>
*
* Example:
* [_mags, phx_loadout_weapon] call phx_loadout_fnc_getWeaponMagazines;
*
* Public: Yes
*/

params [
  ["_unit", objNull],
  ["_uniform", ""],
  ["_vest", ""],
  ["_backpack", ""],
  ["_headgear", ""]
];

if (isNull _unit) exitWith {nil};

_unit forceAddUniform _uniform;
diag_log text format["[FNF] (loadout) INFO: Equipped uniform ""%1""", _uniform];
_unit addVest _vest;
diag_log text format["[FNF] (loadout) INFO: Equipped vest ""%1""", _vest];
_unit addBackpack _backpack;
diag_log text format["[FNF] (loadout) INFO: Equipped backpack ""%1""", _backpack];
_unit addHeadgear _headgear;
diag_log text format["[FNF] (loadout) INFO: Equipped headgear ""%1""", _headgear];
true
