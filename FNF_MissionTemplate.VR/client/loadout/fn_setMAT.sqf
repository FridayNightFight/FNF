/*Sets the MAT weapon and ammo class*/

params ["_LOADOUTROLE"];
#define PLAYERLOADOUTVAR _LOADOUTROLE
#define LOADOUTROLE(_str) (PLAYERLOADOUTVAR isEqualTo _str)
#define CFGUNIFORM missionConfigFile >> "CfgLoadouts" >> "UNIFORMS" >> mySideUniformSelection >> PLAYERLOADOUTVAR
#define CFGGEAR missionConfigFile >> "CfgLoadouts" >> "GEAR" >> mySideGearSelection >> PLAYERLOADOUTVAR
#define CFGCOMMON missionConfigFile >> "CfgLoadouts" >> "common"
#define CFGOPTICS missionConfigFile >> "CfgLoadouts" >> "optics"

fnc_notify_noDefaultConfigured = {
  [{time > 2}, {["<t align='center'>Error:<br/>GEARDEFAULT selected as MAT,<br/>but no default MAT is configured for this gearset</t>", "error", 20] call phx_ui_fnc_notify}] call CBA_fnc_waitUntilAndExecute;
};
fnc_notify_invalidConfigSetting = {
  [{time > 2}, {["<t align='center'>Error:<br/>The mission configuration for<br/>your slot's MAT setting is invalid.</t>", "error", 20] call phx_ui_fnc_notify}] call CBA_fnc_waitUntilAndExecute;
};


private ["_at","_configVarValue","_configVarName","_cfgDefaultMAT"];
_cfgDefaultMAT = (CFGGEAR >> "defaultMAT") call BIS_fnc_getCfgDataArray;

switch (playerSide) do {
  case east: {_configVarName = "phx_redAT_"};
  case west: {_configVarName = "phx_bluAT_"};
  case independent: {_configVarName = "phx_grnAT_"};
};


switch (true) do {
  case (["Bravo", roleDescription player] call BIS_fnc_inString): {
    _configVarName = _configVarName + "Bravo";
  };
  case (["Delta", roleDescription player] call BIS_fnc_inString): {
    _configVarName = _configVarName + "Delta";
  };
  default {
    _configVarName = _configVarName + "Bravo";
  };
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

phx_loadout_mediumantitank_weapon = _at # 0;
if (count _at > 1) then {phx_loadout_mediumantitank_mag = _at # 1};
if (count _at > 2) then {phx_loadout_mediumantitank_optic = _at # 2};
if (count _at > 3) then {
  switch (_at # 3) do {
    case "RELOAD": {phx_loadout_mediumantitank_isReloadable = true};
    case "DISPOSABLE": {phx_loadout_mediumantitank_isReloadable = false};
  };
};
