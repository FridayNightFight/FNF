/*
* Author: IndigoFox
*
* Description:
* Get config value of whether a side key should be given, and give it.
*
* Arguments:
* 0: The unit to modify <OBJECT>
* 1: Config value number <NUMBER>
*
* Return Value:
* true on success <BOOLEAN>
* nil if _unit is null or invalid data <NIL>
*
* Example:
* [player, _cfgGiveSideKey] call phx_loadout_fnc_giveSideKey
*
* Public: No
*/

// ACE Side key
params [
  ["_unit", objNull],
  ["_cfgGiveSideKey", 0]
];

if (isNull _unit) exitWith {nil};

if (_cfgGiveSideKey == 1) then {
  switch (side (group _unit)) do {
    case west: {
        _unit addItem "ACE_key_west";
    };
    case east: {
        _unit addItem "ACE_key_east";
    };
    case independent: {
        _unit addItem "ACE_key_indp";
    };
  };
};
if (_cfgGiveSideKey == 2) then {
  _unit addItem "ACE_key_master";
};
true
