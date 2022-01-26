/*
* Author: IndigoFox
*
* Description:
* Primary loadout script. Pulls values from uniform and gear set config files.
* If SHQAUX (Squad HQ auxialiary), exit to handleSHQAUX. Otherwise, apply each component of the loadout.
* Exit and warn on error.
*
* Arguments:
* 0: The desired role of the unit (default (player getVariable "phxLoadout")) <STRING>
*
* Return Value:
* true on success <BOOLEAN>
*
* Example:
* [player getVariable "phxLoadout"] call phx_loadout_fnc_applyLoadout;
*
* Public: Yes
*/

if (!hasInterface || isDedicated) exitWith {};
waitUntil {!isNull player};

if (playerSide isEqualTo civilian) exitWith {
  phx_selector_optics = [];
  phx_selector_weapons = [];
  phx_selector_explosives = [];
  phx_selector_grenades = [];
  missionNamespace setVariable ["phx_loadoutAssigned",true];
  [
    "[%1] Player %2 loaded as civilian, loadout scripts cancelled",
    [(cba_missionTime),"HH:MM:SS"] call BIS_fnc_secondsToString,
    name player
  ] call BIS_fnc_logFormatServer;
};

{player unlinkItem _x} forEach (assignedItems player);
{
  player unassignItem _x;
  player removeItem _x;
} forEach [
  "NVGoggles",
  "NVGoggles_OPFOR",
  "NVGoggles_INDEP"
];
removeAllItems player;
removeAllWeapons player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

params [["_LOADOUTROLE", (player getVariable "phxLoadout")]];
if (!isNil {(player getVariable "phxLoadout")}) then {
  diag_log text format["[FNF] (loadout) INFO: Player role is %1.", (player getVariable "phxLoadout")];
};
if (isNil {_LOADOUTROLE}) exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Invalid role assignment. Please notify staff and select another slot.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Slot has no role assigned."];
    [] spawn {
      sleep 10;
      endMission "END1";
    };
  }] call CBA_fnc_waitUntilAndExecute;
};

#define PLAYERLOADOUTVAR _LOADOUTROLE

private "_sideLabel";
switch (playerSide) do {
  case east: {_sideLabel = "opfor"};
  case west: {_sideLabel = "blufor"};
  case independent: {_sideLabel = "indfor"};
};
mySideUniformSelection = missionNamespace getVariable ("phx_" + _sideLabel + "Uniform");
mySideGearSelection = missionNamespace getVariable ("phx_" + _sideLabel + "Gear");


// if MATA and the configured MAT for player's squad is not reloadable, assign Rifleman (RI) kit instead.
if (PLAYERLOADOUTVAR in ["MAT1","MATA1","MAT2","MATA2"]) then {
  [PLAYERLOADOUTVAR] call phx_loadout_fnc_setMAT;
  if (
    !phx_loadout_mediumantitank_isReloadable &&
    PLAYERLOADOUTVAR in ["MATA1","MATA2"]
  ) then {
    PLAYERLOADOUTVAR = "RI";
    player setVariable ["phxLoadout", "RI"];
  };
};


if (PLAYERLOADOUTVAR == "SHQAUX") exitWith {
  [player, PLAYERLOADOUTVAR] call phx_loadout_fnc_handleSHQAUX;
};



#define LOADOUTROLE(_str) (PLAYERLOADOUTVAR isEqualTo _str)
#define CFGUNIFORM missionConfigFile >> "CfgLoadouts" >> "UNIFORMS" >> mySideUniformSelection >> PLAYERLOADOUTVAR
#define CFGGEAR missionConfigFile >> "CfgLoadouts" >> "GEAR" >> mySideGearSelection >> PLAYERLOADOUTVAR
#define CFGCOMMON missionConfigFile >> "CfgLoadouts" >> "common"
#define CFGOPTICS missionConfigFile >> "CfgLoadouts" >> "optics"

// "debug_console" callExtension format["
// ----- LOADED -----
// ROLE: %1
// UNIFORM: %2
// GEAR: %3
// COMMON: %4
// CFGOPTICS: %5
// ",
//   PLAYERLOADOUTVAR,
//   call {private _t = [CFGUNIFORM, true] call BIS_fnc_returnParents; reverse _t; _t},
//   call {private _t = [CFGGEAR, true] call BIS_fnc_returnParents; reverse _t; _t},
//   call {private _t = [CFGCOMMON, true] call BIS_fnc_returnParents; reverse _t; _t},
//   call {private _t = [CFGOPTICS, true] call BIS_fnc_returnParents; reverse _t; _t}
// ];

private _cfgUniform = (CFGUNIFORM >> "uniform") call BIS_fnc_getCfgDataArray;
private _cfgVest = (CFGUNIFORM >> "vest") call BIS_fnc_getCfgDataArray;
private _cfgHeadgear = (CFGUNIFORM >> "headgear") call BIS_fnc_getCfgDataArray;
private _cfgBackpack = (CFGUNIFORM >> "backpack") call BIS_fnc_getCfgDataArray;
private _cfgBackpackItems = (CFGGEAR >> "backpackItems") call BIS_fnc_getCfgDataArray;
private _cfgLaunchers = (CFGGEAR >> "launchers") call BIS_fnc_getCfgDataArray;
private _cfgSidearms = (CFGGEAR >> "sidearms") call BIS_fnc_getCfgDataArray;
private _cfgMagazines = (CFGGEAR >> "magazines") call BIS_fnc_getCfgDataArray;
private _cfgItems = (CFGGEAR >> "items") call BIS_fnc_getCfgDataArray;
private _cfgLinkedItems = (CFGGEAR >> "linkedItems") call BIS_fnc_getCfgDataArray;
private _cfgWeaponChoices = (CFGGEAR >> "weaponChoices") call BIS_fnc_getCfgDataArray;
private _cfgAttachments = (CFGGEAR >> "attachments") call BIS_fnc_getCfgDataArray;
private _cfgExplosiveChoices = (CFGGEAR >> "explosiveChoices") call BIS_fnc_getCfgDataArray;
private _cfgGrenadeChoices = (CFGGEAR >> "grenadeChoices") call BIS_fnc_getCfgDataArray;
// Side key - 0 = no, 1 = side, 2 = global
private _cfgGiveSideKey = (CFGGEAR >> "giveSideKey") call BIS_fnc_getCfgData;
private _cfgGiveSRRadio = (CFGGEAR >> "giveSRRadio") call BIS_fnc_getCfgDataBool;
private _cfgGiveLRRadio = (CFGGEAR >> "giveLRRadio") call BIS_fnc_getCfgDataBool;
// private _cfgHandgunAttachments = getArray (_cfgPath >> "handgunAttachments");

_pairs = [
  ["uniform", _cfgUniform],
  ["vest", _cfgVest],
  ["headgear", _cfgHeadgear],
  ["backpack", _cfgBackpack],
  ["backpackItems", _cfgBackpackItems],
  ["launchers", _cfgLaunchers],
  ["sidearms", _cfgSidearms],
  ["magazines", _cfgMagazines],
  ["items", _cfgItems],
  ["linkedItems", _cfgLinkedItems],
  ["weaponChoices", _cfgWeaponChoices],
  ["attachments", _cfgAttachments],
  ["explosiveChoices", _cfgExplosiveChoices],
  ["grenadeChoices", _cfgGrenadeChoices],
  ["giveSideKey", _cfgGiveSideKey],
  ["giveSRRadio", _cfgGiveSRRadio],
  ["giveLRRadio", _cfgGiveLRRadio]
];
_cfgLoaded = [_pairs, []] call CBA_fnc_hashCreate;
phx_loadout = [_cfgLoaded, false] call CBA_fnc_deserializeNamespace;

// Wearable
phx_loadout_uniform = if (_cfgUniform isEqualTo []) then { "" } else { selectRandom _cfgUniform };
phx_loadout_vest = if (_cfgVest isEqualTo []) then { "" } else { selectRandom _cfgVest };
phx_loadout_backpack = if (_cfgBackpack isEqualTo []) then { "" } else { selectRandom _cfgBackpack };
phx_loadout_headgear = if (_cfgHeadgear isEqualTo []) then { "" } else { selectRandom _cfgHeadgear };





if (isNil {
  [
    player,
    phx_loadout_uniform,
    phx_loadout_vest,
    phx_loadout_backpack,
    phx_loadout_headgear
  ] call phx_loadout_fnc_addUniform
}) exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process uniform settings.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to process uniform settings."];
  }] call CBA_fnc_waitUntilAndExecute;
};



// if (isNil {
//   [
//     player,
//     _cfgGiveSRRadio,
//     _cfgGiveLRRadio
//   ] call phx_loadout_fnc_giveRadios
// }) exitWith {
//   [{time > 2}, {
//     ["<t align='center'>Error:<br/>Failed to process radio assignment settings.</t>", "error", 20] call phx_ui_fnc_notify;
//     diag_log text format["[FNF] (loadout) ERROR: Failed to process radio assignment settings."];
//   }] call CBA_fnc_waitUntilAndExecute;
// };

[{
  params [["_swRadio", true], ["_lrRadio", false]];
  [
    player,
    _swRadio,
    _lrRadio
  ] call phx_loadout_fnc_giveRadios;
  diag_log text "[FNF] (loadoutRadio) Completed radio assignment.";
}, [_cfgGiveSRRadio, _cfgGiveLRRadio], 5] call CBA_fnc_waitAndExecute;


if (isNil {
  [
    player,
    _cfgMagazines,
    _cfgItems,
    _cfgBackpackItems,
    _cfgLinkedItems
  ] call phx_loadout_fnc_giveGear
}) exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process gear settings.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to process gear settings."];
  }] call CBA_fnc_waitUntilAndExecute;
};


if (isNil {[player, _cfgWeaponChoices] call phx_loadout_fnc_givePrimaryWeapon}) exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process primary weapon settings.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to process primary weapon settings."];
  }] call CBA_fnc_waitUntilAndExecute;
};

if (isNil {[player, _cfgWeaponChoices] call phx_loadout_fnc_prepWeaponsSelector}) exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process weapon selector settings.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to process weapon selector settings."];
  }] call CBA_fnc_waitUntilAndExecute;
};



if (isNil {[player, _cfgSidearms] call phx_loadout_fnc_giveSidearmWeapon}) exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process sidearm weapon settings.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to process sidearm weapon settings."];
  }] call CBA_fnc_waitUntilAndExecute;
};

if (isNil {[player, getNumber(CFGGEAR >> "giveSilencer")] call phx_loadout_fnc_giveSilencer}) exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process silencer settings.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to process silencer settings."];
  }] call CBA_fnc_waitUntilAndExecute;
};

if (isNil {[player, phx_addNVG, getText(CFGCOMMON >> "NVG")] call phx_loadout_fnc_giveNVG}) exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process NVG settings.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to process NVG settings."];
  }] call CBA_fnc_waitUntilAndExecute;
};


if (isNil {[player, PLAYERLOADOUTVAR] call phx_loadout_fnc_giveAT}) exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process AT settings.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to process AT settings."];
  }] call CBA_fnc_waitUntilAndExecute;
};


if (isNil {[player, PLAYERLOADOUTVAR, CFGOPTICS] call phx_loadout_fnc_prepOpticsSelector}) exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process optics settings.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to process optics settings."];
  }] call CBA_fnc_waitUntilAndExecute;
};


if (isNil {[player, _cfgExplosiveChoices] call phx_loadout_fnc_giveCECharges}) exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process CE explosives settings.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to process CE explosives settings."];
  }] call CBA_fnc_waitUntilAndExecute;
};

if (isNil {[player, _cfgGrenadeChoices] call phx_loadout_fnc_giveCEGrenades}) exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process CE grenade settings.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to process CE grenade settings."];
  }] call CBA_fnc_waitUntilAndExecute;
};

if (isNil {[player, PLAYERLOADOUTVAR] call phx_loadout_fnc_setAttributes}) exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process ACE attribute settings.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to process ACE attribute settings."];
  }] call CBA_fnc_waitUntilAndExecute;
};


if (isNil {[player, _cfgGiveSideKey] call phx_loadout_fnc_giveSideKey}) exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process ACE vehicle key settings.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to process ACE vehicle key settings."];
  }] call CBA_fnc_waitUntilAndExecute;
};

if (isNil {[player, PLAYERLOADOUTVAR] call phx_loadout_fnc_giveBinoculars}) exitWith {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process gear settings.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to process binocular settings."];
  }] call CBA_fnc_waitUntilAndExecute;
};

// get this before loading, so Diary displays /all/ of them
_playerMagazines = magazines player;


if (isNil {[player, PLAYERLOADOUTVAR] call phx_loadout_fnc_loadWeapons}) then {
  [{time > 2}, {
    // ["<t align='center'>Error:<br/>Failed to auto-load weapons.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to auto-load weapons."];
  }] call CBA_fnc_waitUntilAndExecute;
};

// set rank from phx_loadout_roles (for Nametags)
[PLAYERLOADOUTVAR] call phx_loadout_fnc_setRank;

// for Vietnam, customize faces based on uniform set
call phx_loadout_fnc_setFace;


if (uniform player != "") then {
  player setVariable ["phx_lastLoadout", PLAYERLOADOUTVAR];
  [true] call phx_briefing_fnc_parseGear;
  missionNamespace setVariable ["phx_loadoutAssigned",true];

  [
    "[%1] Loadout assigned",
    [(cba_missionTime),"HH:MM:SS"] call BIS_fnc_secondsToString,
    name player
  ] call BIS_fnc_logFormatServer;
} else {
  [{time > 2}, {
    ["<t align='center'>Error:<br/>Failed to process uniform settings.</t>", "error", 20] call phx_ui_fnc_notify;
    diag_log text format["[FNF] (loadout) ERROR: Failed to process uniform settings."];
  }] call CBA_fnc_waitUntilAndExecute;
};


true



// configProperties [missionConfigFile >> "CfgLoadoutWeapons" >> "west" >> "PL"];
// (missionConfigFile >> "CfgLoadoutWeapons" >> "west") call BIS_fnc_getCfgSubClasses;
// (missionConfigFile >> "CfgLoadoutWeapons" >> "west" >> "PL" >> "vest") call BIS_fnc_getCfgData;
