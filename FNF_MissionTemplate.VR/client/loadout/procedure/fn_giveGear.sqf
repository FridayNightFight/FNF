/*
* Author: IndigoFox
*
* Description:
* Adds mags and items from config. Items can be string classnames OR in "className:count" format.
*
* Arguments:
* 0: The unit to modify <OBJECT>
* 1: Array of magazine classnames to add <ARRAY>
* 2: Array of item classnames to add <ARRAY>
* 3: Array of backpack item classnames to add <ARRAY>
* 4: Array of linked item classnames to add <ARRAY>
*
* Return Value:
* true on success <BOOLEAN>
* nil on fail <NIL>
*
* Example:
* [player, _cfgMagazines, _cfgItems, _cfgBackpackItems, _cfgLinkedItems] call phx_loadout_fnc_giveGear
*
* Public: Yes
*/

// Items, grenades
params [
  ["_unit", objNull],
  ["_mags", []],
  ["_items", []],
  ["_backpackItems", []],
  ["_linkedItems", []]
];

if (isNull _unit) exitWith {nil};

{[_x, "vest", _unit] call phx_loadout_fnc_addGear} forEach _mags;
diag_log text format["[FNF] (loadout) INFO: Equipped gear (magazines)."];
diag_log text format["[FNF] (loadout) DEBUG: %1", _mags];
{[_x, "uniform", _unit] call phx_loadout_fnc_addGear} forEach _items;
diag_log text format["[FNF] (loadout) INFO: Equipped gear (items)."];
diag_log text format["[FNF] (loadout) DEBUG: %1", _items];
{[_x, "backpack", _unit] call phx_loadout_fnc_addGear} forEach _backpackItems;
diag_log text format["[FNF] (loadout) INFO: Equipped gear (backpackitems)."];
diag_log text format["[FNF] (loadout) DEBUG: %1", _backpackItems];
{_unit linkItem _x} forEach _linkedItems;
true
