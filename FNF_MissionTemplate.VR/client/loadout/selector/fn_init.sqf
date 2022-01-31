/*
Creates a gear selector for the player allowing switching of optic, weapon and charge loadout for CEs

Format for adding weapons to the selector within weapon set file:
phx_selector_weapons = [["WEAPON_CLASS"]]
or phx_selector_weapons = [["WEAPON_CLASS", "MAG_CLASS:Num"]]
or phx_selector_weapons = [["WEAPON_CLASS", "MAG_CLASS:Num", "MAG_CLASS:Num"]]

*Num = number of magazines to add
**phx_selector_weapons must be a 2 dimensional array**

-If no magazine is specified, the selector will use the default of phx_loadout_rifle_mag and phx_loadout_rifle_mag_tracer for units that start with tracer mags
-The weapon selector only works with primary weapon slot weapons
*/

#define PLAYERLOADOUTVAR (player getVariable "phxLoadout")
#define LOADOUTROLE(_str) (PLAYERLOADOUTVAR isEqualTo _str)

//Exit if there is nothing for the player to select
if (
  count (phx_selector_optics) == 0
  &&
  count (phx_selector_weapons) == 0
  &&
  count (phx_selector_explosives) == 0
  &&
  count (phx_selector_grenades) == 0
) exitWith {};

//Create base actions
switch (phx_gameMode == "sustainedAssault") do {
  case false: {
    _action = ["Gear_Selector","Gear Selector","",{},{
      // limit gear selector in Standard to when:
      // - safeStart enabled (phx_server_fnc_safety)
      (missionNamespace getVariable ["phx_safetyEnabled", true])
    }] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions"],_action] call ace_interact_menu_fnc_addActionToClass;
  };
  case true: {
    _action = ["Gear_Selector","Gear Selector","",{},{
      // limit gear selector in SA to when:
      // - in safe zone (phx_safety_fnc_init) OR
      // - safeStart enabled, forcing them to be in a safe zone anyway (phx_safety_fnc_startBoundary)
      (player getVariable ["fnf_zoneProtectionActive", false]) || (missionNamespace getVariable ["phx_safetyEnabled", true])
    }] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions"],_action] call ace_interact_menu_fnc_addActionToClass;
  };
};

// optics
// parent
_action = ["Optic_Selector","Optic","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;
// lo
_action = ["Optic_Selector_Lo","Low Zoom","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector", "Optic_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;
// med
_action = ["Optic_Selector_Med","Med Zoom","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector", "Optic_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;
// hi
_action = ["Optic_Selector_Hi","Hi Zoom","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector", "Optic_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;


_action = ["Weapon_Selector","Weapon","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Explosives_Selector","Explosives","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Grenades_Selector","Grenades","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;

_action = ["CSW_Selector","Crew-Served Weapons","",{},{(missionNamespace getVariable ["phx_safetyEnabled", true])}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"],_action] call ace_interact_menu_fnc_addActionToClass;

// Add actions if there are items to select from

// Weapons actions
{
  // "debug_console" callExtension ("ForEach phx_selector_weapons: " + str(_x));
  _action = [
    "Weapon_Selector",
    getText (configFile >> "cfgWeapons" >> _x # 0 >> "displayName"),
    "",
    { // param to code above

      (_this select 2) call phx_selector_fnc_weapons;
    },
    { // condition
      primaryWeapon player != "" && count phx_selector_weapons > 1 && fnf_pref_loadoutInterface == "ACE"
    },
    {},
    _x // arg to be used in param, arg is array
  ] call ace_interact_menu_fnc_createAction;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Weapon_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
} forEach phx_selector_weapons;


// optics actions
{
  private _thisCfg = _x call CBA_fnc_getItemConfig;
  private _dispName = [_thisCfg] call BIS_fnc_displayName;

  private _maxZoomOverall = 0;
  // show magnification
  if (isClass (_thisCfg >> "ItemInfo" >> "OpticsModes")) then {
    private _opticsModes = "true" configClasses (_thisCfg >> "ItemInfo" >> "OpticsModes");
    _dispName = _dispName + " (";
    private _zoomsArr = [];
    {
      _fovAt1xZoom = ([] call CBA_fnc_getFov) select 0;
      // _fovAt1xZoom = 0.75;
      private _zoomMax = _fovAt1xZoom / getNumber(_x >> "opticsZoomMax");
      if (_zoomMax > 1) then {
        _zoomMax = ceil(_zoomMax / 2) - 1 max 1;
      } else {
        _zoomMax = ceil(_zoomMax);
      };
      _zoomsArr pushBack _zoomMax;
    } forEach _opticsModes;
    _zoomsArr sort true;
    _maxZoomOverall = _zoomsArr select (count _zoomsArr - 1);
    _zoomsArr = _zoomsArr apply {str(_x) + "x"};
    _dispName = _dispName + (_zoomsArr joinString "/") + ")";
  };

  private _actionName = "";
  switch (true) do {
    case (_maxZoomOverall <= 2): {_actionName = "Optic_Selector_Lo"};
    case (_maxZoomOverall > 2 && _maxZoomOverall <= 5): {_actionName = "Optic_Selector_Med"};
    case (_maxZoomOverall > 5): {_actionName = "Optic_Selector_Hi"};
  };

  _action = [
    _actionName,
    _dispName,
    "",
    { // statement
      _this call phx_selector_fnc_optics;
    },
    { // condition
      (_this select 2) in ([primaryWeapon player, "optic"] call CBA_fnc_compatibleItems) &&
      fnf_pref_loadoutInterface == "ACE"
    },
    {}, // child code
    _x
  ] call ace_interact_menu_fnc_createAction;

  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Optic_Selector",_actionName], _action] call ace_interact_menu_fnc_addActionToClass;
} forEach phx_selector_optics;

_action = [
  "Optic_Selector",
  "None",
  "",
  { // statement
    player removePrimaryWeaponItem ((primaryWeaponItems player) select 2);
    player setVariable ["phx_ChosenOptic", ""];
  },
  { // condition
    player getVariable "phx_ChosenOptic" != "" &&
    fnf_pref_loadoutInterface == "ACE"
  }
] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Optic_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;


// Charges selector
if (count (missionNamespace getVariable ["phx_selector_explosives",[]]) > 0 && LOADOUTROLE("CE")) then {
  //charges actions
  {
    // "debug_console" callExtension ("ForEach phx_selector_charges: " + str(_x));
    _action = [
      "Explosives_Selector",
      _x select 0,
      "",
      { // statement
        (_this select 2) call phx_selector_fnc_charges;
      },
      { // condition
        fnf_pref_loadoutInterface == "ACE"
      },
      {}, // child code
      _x
    ] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Explosives_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
  } forEach phx_selector_explosives;
};


// Grenades selector
if (count (missionNamespace getVariable ["phx_selector_grenades",[]]) > 0 && LOADOUTROLE("CE")) then {
  {
    _action = [
      "Grenades_Selector",
      _x select 0,
      "",
      { // statement
        (_this select 2) call phx_selector_fnc_grenades;
      },
      { // condition
        fnf_pref_loadoutInterface == "ACE"
      },
      {}, // child code
      _x
    ] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Grenades_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
  } forEach phx_selector_grenades;
};

// selector removal has been removed, as their parent Gear Selector has its own conditions now
// these actions persist through respawn, because the player respawns as the same 'typeOf' object and
// refer to arrays that are updated by the loadout script each run

//Remove selector when safe start ends
// [{!phx_safetyEnabled}, {
//   [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector", "Optic_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
//   [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector", "Weapon_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
//   [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector", "Explosives_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
//   [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector", "Grenades_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
//   [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
// }] call CBA_fnc_waitUntilAndExecute;
