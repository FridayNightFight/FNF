/*
* Author: Martin, IndigoFox
*
* Description:
* Parses configs to determine relevant MAT settings based on someone's role and squad.
* Sets missionNamespace variables w/ relevant data, no meaningful return.
*
* Arguments:
* 0: Loadout role to evaluate for (default: "BASE") <STRING>
*
* Return Value:
* true on success <BOOLEAN>
* nil on failure with warning <NIL>
*
* Example:
* "FirstAidKit" call fnf_loadout_fnc_addGear;
* "FirstAidKit:5" call fnf_loadout_fnc_addGear;
* ["FirstAidKit:3","ItemMap","ItemCompass"] call fnf_loadout_fnc_addGear;
*
* Public: Yes
*/

/*Sets the MAT weapon and ammo class*/

params [["_LOADOUTROLE", "BASE"]];
#define PLAYERLOADOUTVAR _LOADOUTROLE
#define LOADOUTROLE(_str) (PLAYERLOADOUTVAR isEqualTo _str)
#define CFGUNIFORM missionConfigFile >> "CfgFNFLoadouts" >> "UNIFORMS" >> mySideUniformSelection >> PLAYERLOADOUTVAR
#define CFGGEAR missionConfigFile >> "CfgFNFLoadouts" >> "GEAR" >> mySideGearSelection >> PLAYERLOADOUTVAR
#define CFGCOMMON missionConfigFile >> "CfgFNFLoadouts" >> "common"
#define CFGOPTICS missionConfigFile >> "CfgFNFLoadouts" >> "optics"

fnc_notify_noDefaultConfigured = {
  [{time > 2}, {["<t align='center'>Error:<br/>GEARDEFAULT selected as MAT,<br/>but no default MAT is configured for this gearset</t>", "error", 20] call fnf_ui_fnc_notify}] call CBA_fnc_waitUntilAndExecute;
};
fnc_notify_invalidConfigSetting = {
  [{time > 2}, {["<t align='center'>Error:<br/>The mission configuration for<br/>your slot's MAT setting is invalid.</t>", "error", 20] call fnf_ui_fnc_notify}] call CBA_fnc_waitUntilAndExecute;
};


private ["_at","_configVarValue","_configVarName","_cfgDefaultMAT"];
_cfgDefaultMAT = (CFGGEAR >> "defaultMAT") call BIS_fnc_getCfgDataArray;

switch (playerSide) do {
  case east: {_configVarName = "fnf_redAT"};
  case west: {_configVarName = "fnf_bluAT"};
  case independent: {_configVarName = "fnf_grnAT"};
};

_configVarValue = missionNamespace getVariable [_configVarName, []];
if (
  !(typeName _configVarValue == "ARRAY") ||
  _configVarValue isEqualTo []
) exitWith {
  // if value from config.sqf isn't valid, notify the player and cease further processing
  call fnc_notify_invalidConfigSetting;
};

// "debug_console" callExtension ("PREPRE: " + str(_cfgDefaultMAT));
// if it is valid, move on
if ((_configVarValue # 0) isEqualTo "GEARDEFAULT") then {
  // We're using the gear set -- validate it
  if (_cfgDefaultMAT isEqualTo []) exitWith {
    call fnc_notify_noDefaultConfigured;
  };
  // Save valid info
  _at = selectRandom(_cfgDefaultMAT);
} else {
  // We're using the config.sqf setting
  _at = _configVarValue;
};

// "debug_console" callExtension ("PRE: " + str(_at));
// If _at is somehow still null, exit
if (isNil "_at") exitWith {};

fnf_loadout_mediumantitank_weapon = _at # 0;
if (count _at > 1) then {fnf_loadout_mediumantitank_mag = _at # 1};
if (count _at > 2) then {fnf_loadout_mediumantitank_optic = _at # 2};
if (count _at > 3) then {
  switch (_at # 3) do {
    case "RELOAD": {fnf_loadout_mediumantitank_isReloadable = true};
    case "DISPOSABLE": {fnf_loadout_mediumantitank_isReloadable = false};
  };
};

true
