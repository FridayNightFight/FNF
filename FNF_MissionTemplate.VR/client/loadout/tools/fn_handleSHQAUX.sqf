/*
* Author: IndigoFox
*
* Description:
* Handle the two members attached to squad HQs. Reads config.sqf settings and either converts the unit
* to a crewman, or sets BASE loadout and applies ACE self-actions to grab the appropriate items. Overrides standard
* processing in applyLoadout.
*
* Arguments:
* 0: The unit to act on <OBJECT>
* 1: The desired role of the unit (usually SHQAUX)
*
* Return Value:
* true on success <BOOLEAN>
*
* Example:
* [player, PLAYERLOADOUTVAR] call phx_loadout_fnc_getWeaponMagazines
*
* Public: No
*/

params [
  ["_unit", objNull],
  ["_role", "BASE"]
];

private _settingStr = format[
  "phx_%1%2AuxRole",
  str(side (group _unit)),
  (
    ["Alpha","Bravo","Charlie","Delta"] select {
      [_x, roleDescription _unit] call BIS_fnc_inString
    }
  ) select 0
];
private _setting = missionNamespace getVariable _settingStr;

if (isNil "_setting") exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to load AuxRole setting. Please notify the Missions team.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to load AuxRole setting. Please notify the Missions team."];
  }] call CBA_fnc_waitUntilAndExecute;
  true
};

if (_setting isEqualTo 0) exitWith {
  player setVariable ["phxLoadout", "CR"];
  ["CR"] call phx_loadout_fnc_applyLoadout;
  diag_log text format["[FNF] (loadout) INFO: SHQAux setting is ""0"". Loading default crewman kit."];
  true
};

if (isNil "phx_cswItems") then {
  _setting params ["_weapon","_tripod","_mags"];
  missionNamespace setVariable ["phx_cswItems", [_weapon,_tripod]];
  missionNamespace setVariable ["phx_cswMags", _mags];

  {
    private _action = [
      "CSW_Selector",
      (if (_x isEqualTo "") then {"Ammo only"} else {getText (configFile >> "cfgWeapons" >> _x >> "displayName")}),
      "",
      { // statement (pass arg)
        (_this select 2) call phx_selector_fnc_csw;
      },
      { // condition
        phx_safetyEnabled &&
        (player getVariable "phxLoadout") isEqualTo "SHQAUX"
      },
      {},
      _x // arg to be used in param, arg is array
    ] call ace_interact_menu_fnc_createAction;
    [
      player,
      1,
      ["ACE_SelfActions","CSW_Selector"],
      _action
    ] call ace_interact_menu_fnc_addActionToObject;
  } forEach phx_cswItems;

  // KIT APPLIES HERE
  ["BASE"] call phx_loadout_fnc_applyLoadout;

  private _mortarGear = (missionConfigFile >> "CfgLoadouts" >> "common" >> "mortarGear") call BIS_fnc_getCfgDataArray;

  // add hint to remind players to take their CSW gear
  [{time > 10}, {
    ["<t align='center'>Make sure you use ACE Self-interact to get your crew-served weapons gear!</t>", "info", 10] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) DEBUG: Player notified about using ACE Self-interact to retrieve CSW gear."];
  }] call CBA_fnc_waitUntilAndExecute;
};

true
