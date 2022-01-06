/*
* Author: IndigoFox
*
* Description:
* Set up the array variable used by the ACE self-interact optics picker.
*
* Arguments:
* 0: The unit to modify <OBJECT>
* 1: The role to eval for it (default: "BASE") <STRING>
* 2: The class containing subclasses of optic choices <ARRAY>
*
* Return Value:
* true on success <BOOLEAN>
* nil if _unit is null or invalid data <NIL>
*
* Example:
* [player, PLAYERLOADOUTVAR, CFGOPTICS] call phx_loadout_fnc_prepOpticsSelector
*
* Public: No
*/

params [
  ["_unit", objNull],
  ["_role", "BASE"],
  ["_cfgOptics", (missionConfigFile >> "CfgLoadouts" >> "optics")]
];

if (isNull _unit) exitWith {nil};

// Optic selections based on phx_magnifiedOptics setting
private "_cfgOpticChoices";
switch (phx_magnifiedOptics) do {
  // Nobody should have optics
  case -1: {_cfgOpticChoices = []};
  // All should have magnified
  case 1: {
    _cfgOpticChoices = (_cfgOptics >> "standard") call BIS_fnc_getCfgDataArray;
    if !(_role in ["MG"]) then { // ensures MMGs never get magnified optics
      _cfgOpticChoices = (_cfgOptics >> "magnified") call BIS_fnc_getCfgDataArray;
    };
    if (_role in ["SNP"]) then {
      _cfgOpticChoices = (_cfgOptics >> "sniper") call BIS_fnc_getCfgDataArray;
    };
  };
    // 0 OR default: DM magnified, sniper special
  default {
    _cfgOpticChoices = (_cfgOptics >> "standard") call BIS_fnc_getCfgDataArray;
    if (_role in ["DM"]) then {
      _cfgOpticChoices = (_cfgOptics >> "magnified") call BIS_fnc_getCfgDataArray;
    };
    if (_role in ["SNP"]) then {
      _cfgOpticChoices = (_cfgOptics >> "sniper") call BIS_fnc_getCfgDataArray;
    };
  };
};
// "debug_console" callExtension ("Optics choices: " + str(_cfgOpticChoices));
if (count _cfgOpticChoices > 0 && !isNil "phx_loadout_weapon") then {
  private _optic = selectRandom(_cfgOpticChoices select {_x in ([phx_loadout_weapon, "optic"] call CBA_fnc_compatibleItems)});
  if (!isNil "_optic") then {
    // _unit addPrimaryWeaponItem _optic;
    // player setVariable ["phx_ChosenOptic", _optic];
    player setVariable ["phx_ChosenOptic", ""];
    // diag_log text format["[FNF] (loadout) INFO: Equipped optic ""%1""", _optic];
    missionNamespace setVariable ["phx_selector_optics", _cfgOpticChoices];
  };
};
true
