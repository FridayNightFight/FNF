/*
* Author: IndigoFox
*
* Description:
* Assign NVGs and laser to primary weapon, or don't.
*
* Arguments:
* 0: The unit to modify <OBJECT>
* 1: Mission setting, whether NVGs should be given <NUMBER>
* 2: Classname of NVG to give <STRING>
*
* Return Value:
* true on success <BOOLEAN>
* nil if _unit is null or invalid data <NIL>
*
* Example:
* [player, fnf_addNVG, getText(CFGCOMMON >> "NVG")] call fnf_loadout_fnc_giveNVG
*
* Public: No
*/

// NVGs/laser accessory
params [
  ["_unit", objNull],
  ["_giveNVG", 0],
  ["_NVGType", "NVGoggles_OPFOR"]
];

if (isNull _unit) exitWith {nil};

switch (typeName fnf_addNVG) do {
  case "SCALAR": {
    if (fnf_addNVG == 1) then {
      _unit linkItem _NVGType;
      {_unit addPrimaryWeaponItem _x} forEach ["rhs_acc_perst1ik", "rhsusf_acc_anpeq15A"];
      diag_log text format["[FNF] (loadout) INFO: Gave NVGs ""%1""", _NVGType];
    };
  };
  case "ARRAY": {
    if (side (group _unit) in fnf_addNVG) then {
      _unit linkItem _NVGType;
      {_unit addPrimaryWeaponItem _x} forEach ["rhs_acc_perst1ik", "rhsusf_acc_anpeq15A"];
      diag_log text format["[FNF] (loadout) INFO: Gave NVGs ""%1""", _NVGType];
    };
  };
};
true
