/*
* Author: IndigoFox
*
* Description:
* Reads radio settings from loadout config and removes existing or replaces with placeholder.
* Uses radios defined as side defaults by TFAR.
*
* Arguments:
* 0: The unit to modify <OBJECT>
* 1: If unit should receive a SW radio (default TRUE) <BOOLEAN>
* 2: If unit should receive a LR radio (default FALSE) <BOOLEAN>
*
* Return Value:
* true on success <BOOLEAN>
* nil on fail <NIL>
*
* Example:
* [player, _cfgGiveSRRadio, _cfgGiveLRRadio] call phx_loadout_fnc_giveRadios
*
* Public: Yes
*/

// Radios
params [["_unit", objNull], ["_srRadio", true], ["_lrRadio", false]];

if (isNull _unit) exitWith {nil};

if (_srRadio) then {
  if (!(call TFAR_fnc_haveSWRadio)) then {
    _unit linkItem ([side (group _unit), 1] call TFAR_fnc_getSideRadio);
    diag_log text format["[FNF] (loadout) INFO: Equipped SW radio ""%1""", [side (group _unit), 1] call TFAR_fnc_getSideRadio];
  };
  missionNamespace setVariable ["phx_hasSW", true];
} else {
  if (call TFAR_fnc_haveSWRadio) then {
    player unlinkItem (call TFAR_fnc_activeSwRadio);
  };
  missionNamespace setVariable ["phx_hasSW", false];
};


if (_lrRadio) then {
  // Compensation: if a role is configured in Gear Set to have a LR radio but their backpack config isn't classified as one to TFAR, it will replace their backpack with a default stand-in. Similarly, if they have a radio-enabled backpack but shouldn't, it's replaced with a general tactical backpack.
  if (!(call TFAR_fnc_haveLRRadio)) then {
    private _items = backpackItems _unit;
    removeBackpack _unit;
    _unit addBackpack ([side (group _unit), 0] call TFAR_fnc_getSideRadio);
    {
      _unit addItemToBackpack _x;
    } forEach _items;
    diag_log text format["[FNF] (loadout) INFO: Equipped LR radio ""%1""", [side (group _unit), 0] call TFAR_fnc_getSideRadio];
  };
  missionNamespace setVariable ["phx_hasLR", true];
} else {
  if (call TFAR_fnc_haveLRRadio) then {
    private _items = backpackItems _unit;
    removeBackpack _unit;
    _unit addBackpack "B_TacticalPack_blk";
    {
      _unit addItemToBackpack _x;
    } forEach _items;
  };
  missionNamespace setVariable ["phx_hasLR", false];
};
true
