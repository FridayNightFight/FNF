/*
* Author: IndigoFox
*
* Description:
* Set up the array variable used by the ACE self-interact grenades picker.
*
* Arguments:
* 0: The unit to modify <OBJECT>
* 1: The role to apply attributes based on <STRING>
*
* Return Value:
* true on success <BOOLEAN>
* nil if _unit is null or invalid data <NIL>
*
* Example:
* [player, PLAYERLOADOUTVAR] call phx_loadout_fnc_setAttributes
*
* Public: No
*/

// Attributes
params [
  ["_unit", objNull],
  ["_role", "BASE"]
];

if (isNull _unit) exitWith {nil};

if (_role == "MED") then {
  _unit setVariable ["ace_medical_medicClass", 1, true];
  _unit setUnitTrait ["medic", true, true];
};
if (_role in ["CE","CR"]) then {
  _unit setVariable ["ace_isEngineer", 1, true];
  _unit setUnitTrait ["engineer", true, true];
};
if (_role in ["CRL","PI"]) then {
  _unit setVariable ["ace_isEngineer", 2, true];
  _unit setUnitTrait ["engineer", true, true];
};
if (_role == "SGT" && side (group _unit) isEqualTo phx_vnArtillerySide) then {
  _unit setUnitTrait ["vn_artillery", true, true];
};
true
