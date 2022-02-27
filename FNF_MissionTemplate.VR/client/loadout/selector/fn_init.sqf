/*
Creates a gear selector for the player allowing switching of optic, weapon and charge loadout for CEs

Format for adding weapons to the selector within weapon set file:
fnf_selector_weapons = [["WEAPON_CLASS"]]
or fnf_selector_weapons = [["WEAPON_CLASS", "MAG_CLASS:Num"]]
or fnf_selector_weapons = [["WEAPON_CLASS", "MAG_CLASS:Num", "MAG_CLASS:Num"]]

*Num = number of magazines to add
**fnf_selector_weapons must be a 2 dimensional array**

-If no magazine is specified, the selector will use the default of fnf_loadout_rifle_mag and fnf_loadout_rifle_mag_tracer for units that start with tracer mags
-The weapon selector only works with primary weapon slot weapons
*/

#define PLAYERLOADOUTVAR (player getVariable "fnfLoadout")
#define LOADOUTROLE(_str) (PLAYERLOADOUTVAR isEqualTo _str)

//Exit if there is nothing for the player to select
// if (
//   count (fnf_selector_optics) == 0
//   &&
//   count (fnf_selector_weapons) == 0
//   &&
//   count (fnf_selector_explosives) == 0
//   &&
//   count (fnf_selector_grenades) == 0
// ) exitWith {};



private _condition = {};
switch (fnf_gameMode) do {
  case "sustainedAssault": {
    _condition = {
      // limit gear selector in SA to when:
      // - in safe zone (fnf_safety_fnc_init) OR
      // - safeStart enabled, forcing them to be in a safe zone anyway (fnf_safety_fnc_startBoundary)
      [player, playerSide] call fnf_fnc_inSafeZone || (missionNamespace getVariable ["fnf_safetyEnabled", true])
    };
  };
  default {
    _condition = {
      // limit gear selector in Standard to when:
      // - safeStart enabled (fnf_server_fnc_safety)
      (missionNamespace getVariable ["fnf_safetyEnabled", true])
    };
  };
};

_mainAction = [
  "Gear_Selector",
  "Gear Selector",
  "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa",
  {}, // statement
  _condition, // condition
  {
    params ["_target", "_player", "_params"];
    // diag_log format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

    // Add children to this action
    private _actions = [];



    private _weaponsAction = [
      "Weapon_Selector",
      "Weapon",
      (
        if (missionNamespace getVariable ["fnf_loadout_weapon", ""] != "") then {
          getText(configFile >> "CfgWeapons" >> fnf_loadout_weapon >> "picture")
        } else {
          "\a3\weapons_f\data\ui\icon_mg_ca.paa"
        }
      ), // icon
      {}, // statement
      {primaryWeapon player != "" && count fnf_selector_weapons > 1 && fnf_pref_loadoutInterface == "ACE"}, // condition
      {
        params ["_target", "_player", "_params"];
        // diag_log format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

        // Add children to this action
        private _actions = [];
        {
          _x params ["_weapon", "_mags"];
          private _childStatement = {
            params ["_target", "_player", "_params"];
            _params call fnf_selector_fnc_weapons;
          };
          private _action = [
            getText (configFile >> "cfgWeapons" >> _weapon >> "displayName"),
            getText (configFile >> "cfgWeapons" >> _weapon >> "displayName"),
            getText (configFile >> "cfgWeapons" >> _weapon >> "picture"),
            _childStatement,
            {true},
            {},
            _x
          ] call ace_interact_menu_fnc_createAction;
          _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
        } forEach (missionNamespace getVariable ["fnf_selector_weapons", []]);

        _actions
      }, // populate child items
      []
    ] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_weaponsAction, [], _target]; // New action, it's children, and the action's target


    private _opticsAction = [
      "Optic_Selector",
      "Optics",
      (
        if (missionNamespace getVariable ["fnf_loadout_chosenOptic", ""] != "") then {
          getText(configFile >> "CfgWeapons" >> fnf_loadout_chosenOptic >> "picture")
        } else {
          "\A3\ui_f\data\igui\cfg\weaponicons\srifle_ca.paa"
        }
      ), // icon
      {}, // statement
      {primaryWeapon player != "" && count fnf_selector_optics > 1 && fnf_pref_loadoutInterface == "ACE"}, // condition
      {
        params ["_target", "_player", "_params"];
        // diag_log format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

        // Add children to this action
        private _actions = [];
        private _lowChildActions = [];
        private _medChildActions = [];
        private _hiChildActions = [];

        {
          private _thisCfg = _x call CBA_fnc_getItemConfig;
          private _dispName = [_thisCfg] call BIS_fnc_displayName;
          private _picture = getText (_thisCfg >> "picture");

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

          private _action = [
            _dispName,
            _dispName,
            _picture,
            { // statement
              params ["_target", "_player", "_params"];
              _params call fnf_selector_fnc_optics;
            },
            { // condition
              params ["_target", "_player", "_params"];
              _params in ([primaryWeapon player, "optic"] call CBA_fnc_compatibleItems) &&
              fnf_pref_loadoutInterface == "ACE"
            },
            {}, // child code
            _x
          ] call ace_interact_menu_fnc_createAction;


          switch (true) do {
            case (_maxZoomOverall <= 2): {_lowChildActions pushBack [_action, [], _target]};
            case (_maxZoomOverall > 2 && _maxZoomOverall <= 5): {_medChildActions pushBack [_action, [], _target]};
            case (_maxZoomOverall > 5): {_hiChildActions pushBack [_action, [], _target]};
          };
        } forEach (missionNamespace getVariable ["fnf_selector_optics", []]);

        // lo
        _actions pushBack [
          ["Optic_Selector_Lo","Low Zoom","\A3\ui_f\data\igui\cfg\weaponicons\srifle_ca.paa",{},{true}] call ace_interact_menu_fnc_createAction,
          _lowChildActions,
          _target
        ];
        // med
        _actions pushBack [
          ["Optic_Selector_Med","Med Zoom","\A3\ui_f\data\igui\cfg\weaponicons\srifle_ca.paa",{},{true}] call ace_interact_menu_fnc_createAction,
          _medChildActions,
          _target
        ];
        // hi
        _actions pushBack [
          ["Optic_Selector_Hi","Hi Zoom","\A3\ui_f\data\igui\cfg\weaponicons\srifle_ca.paa",{},{true}] call ace_interact_menu_fnc_createAction,
          _hiChildActions,
          _target
        ];

        _actions
      }, // populate child items
      []
    ] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_opticsAction, [], _target]; // New action, it's children, and the action's target


    private _explosivesAction = [
      "Explosives_Selector",
      "Explosives",
      (call {
        if (count (missionNamespace getVariable ["fnf_selector_currentExplosives", []]) > 0) exitWith {
          private _explTypeImages = (fnf_selector_currentExplosives select [1, 3]) apply {(_x splitString ':') select 0} apply {getText (configFile >> "CfgMagazines" >> _x >> "picture")};
          selectRandom(_explTypeImages)
        };
        "\z\ace\addons\explosives\data\ui\clacker.paa"
      }), // icon
      {}, // statement
      {LOADOUTROLE("CE") && fnf_pref_loadoutInterface == "ACE"}, // condition
      {
        params ["_target", "_player", "_params"];
        // diag_log format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

        // Add children to this action
        private _actions = [];
        {
          _x params ["_name", "_items1", "_items2"];
          private _explTypeImages = (_x select [1, 3]) apply {(_x splitString ':') select 0} apply {getText (configFile >> "CfgMagazines" >> _x >> "picture")};
          private _childStatement = {
            params ["_target", "_player", "_params"];
            _params call fnf_selector_fnc_charges;
          };
          private _action = [
            _name,
            _name,
            selectRandom(_explTypeImages),
            _childStatement,
            {true},
            {},
            _x
          ] call ace_interact_menu_fnc_createAction;
          _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
        } forEach (missionNamespace getVariable ["fnf_selector_explosives", []]);

        _actions
      }, // populate child items
      []
    ] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_explosivesAction, [], _target]; // New action, it's children, and the action's target


    private _grenadesAction = [
      "Grenades_Selector",
      "Grenades",
      (call {
        if (count (missionNamespace getVariable ["fnf_selector_currentGrenades", []]) > 0) exitWith {
          ((fnf_selector_currentGrenades # 1) splitString ':') params ["_grenadeClass", "_count"];
          private _thisCfg = _grenadeClass call CBA_fnc_getItemConfig;
          getText (_thisCfg >> "picture")
        };
        "\a3\weapons_f\data\ui\icon_gl_ca.paa"
      }), // icon
      {}, // statement
      {LOADOUTROLE("CE") && fnf_pref_loadoutInterface == "ACE"}, // condition
      {
        params ["_target", "_player", "_params"];
        // diag_log format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

        // Add children to this action
        private _actions = [];
        {
          _x params ["_name", "_items"];
          (_items splitString ':') params ["_grenadeClass", "_count"];
          private _childStatement = {
            params ["_target", "_player", "_params"];
            _params call fnf_selector_fnc_grenades;
          };
          private _action = [
            getText (configFile >> "CfgMagazines" >> _grenadeClass >> "displayName"),
            format["%1x %2", _count, getText (configFile >> "CfgMagazines" >> _grenadeClass >> "displayName")],
            getText (configFile >> "CfgMagazines" >> _grenadeClass >> "picture"),
            _childStatement,
            {true},
            {},
            _x
          ] call ace_interact_menu_fnc_createAction;
          _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
        } forEach (missionNamespace getVariable ["fnf_selector_grenades", []]);

        _actions
      }, // populate child items
      []
    ] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_grenadesAction, [], _target]; // New action, it's children, and the action's target


    // CSW
    fnf_cswItems params ["_weapon", "_tripod"];
    private _thisCfg = _weapon call CBA_fnc_getItemConfig;
    private _deployedItemStr = getText((configProperties [_thisCfg >> "ACE_CSW" >> "assembleTo"]) select 0);
    private _cswWepName = getText(configfile >> "CfgVehicles" >> _deployedItemStr >> "displayName");
    private _cswWepPic = getText(configfile >> "CfgVehicles" >> _deployedItemStr >> "picture");

    private _cswAction = [
      "CSW_Selector",
      _cswWepName,
      _cswWepPic, // icon
      {
        params ["_target", "_player", "_params"];
        _params call fnf_selector_fnc_csw;
      }, // statement
      {LOADOUTROLE("SHQAUX") && fnf_pref_loadoutInterface == "ACE"}, // condition
      {
        params ["_target", "_player", "_params"];
        // diag_log format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

        (missionNamespace getVariable ["fnf_cswItems", []]) params ["_weapon", "_tripod"];
        private _mags = missionNamespace getVariable ["fnf_cswMags", []];

        // Add children to this action
        private _actions = [];
        {
          private _childStatement = {
            params ["_target", "_player", "_params"];
            _params call fnf_selector_fnc_csw;
          };
          private _action = [
            (if (_x isEqualTo "") then {"Ammo only"} else {getText (configFile >> "CfgWeapons" >> _x >> "displayName")}),
            (if (_x isEqualTo "") then {"Ammo only"} else {getText (configFile >> "CfgWeapons" >> _x >> "displayName")}),
            (
              if (_x isEqualTo "") then {
                _mag = selectRandom(fnf_cswMags) splitString ':' select 0;
                getText(configFile >> "CfgMagazines" >> _mag >> "picture")
              } else {
                getText(configFile >> "CfgWeapons" >> _x >> "picture")
              }
            ), // icon
            _childStatement,
            {true},
            {},
            _x
          ] call ace_interact_menu_fnc_createAction;
          _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
        } forEach (missionNamespace getVariable ["fnf_cswItems", []]);

        _actions
      }, // populate child items
      []
    ] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_cswAction, [], _target]; // New action, it's children, and the action's target

    _actions
  } // child code
] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _mainAction] call ace_interact_menu_fnc_addActionToClass;


// weapons
// _weaponsAction = [
//   "Weapon_Selector",
//   "Weapon",
//   (
//     if (missionNamespace getVariable ["fnf_loadout_weapon", ""] != "") then {
//       getText(configFile >> "CfgWeapons" >> fnf_loadout_weapon >> "picture")
//     } else {
//       "\a3\weapons_f\data\ui\icon_mg_ca.paa"
//     }
//   ), // icon
//   {}, // statement
//   {primaryWeapon player != "" && count fnf_selector_weapons > 1 && fnf_pref_loadoutInterface == "ACE"}, // condition
//   {
//     params ["_target", "_player", "_params"];
//     // diag_log format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

//     // Add children to this action
//     private _actions = [];
//     {
//       _x params ["_weapon", "_mags"];
//       private _childStatement = {
//         params ["_target", "_player", "_params"];
//         _params call fnf_selector_fnc_weapons;
//       };
//       private _action = [
//         getText (configFile >> "cfgWeapons" >> _weapon >> "displayName"),
//         getText (configFile >> "cfgWeapons" >> _weapon >> "displayName"),
//         getText (configFile >> "cfgWeapons" >> _weapon >> "picture"),
//         _childStatement,
//         {true},
//         {},
//         _x
//       ] call ace_interact_menu_fnc_createAction;
//       _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
//     } forEach (missionNamespace getVariable ["fnf_selector_weapons", []]);

//     _actions
//   }, // populate child items
//   []
// ] call ace_interact_menu_fnc_createAction;
// [(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;



// optics
// _opticsAction = [
//   "Optic_Selector",
//   "Optics",
//   (
//     if (missionNamespace getVariable ["fnf_loadout_chosenOptic", ""] != "") then {
//       getText(configFile >> "CfgWeapons" >> fnf_loadout_chosenOptic >> "picture")
//     } else {
//       "\A3\ui_f\data\igui\cfg\weaponicons\srifle_ca.paa"
//     }
//   ), // icon
//   {}, // statement
//   {primaryWeapon player != "" && count fnf_selector_weapons > 1 && fnf_pref_loadoutInterface == "ACE"}, // condition
//   {
//     params ["_target", "_player", "_params"];
//     // diag_log format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

//     // Add children to this action
//     private _actions = [];
//     private _lowChildActions = [];
//     private _medChildActions = [];
//     private _hiChildActions = [];

//     {
//       private _thisCfg = _x call CBA_fnc_getItemConfig;
//       private _dispName = [_thisCfg] call BIS_fnc_displayName;
//       private _picture = getText (_thisCfg >> "picture");

//       private _maxZoomOverall = 0;
//       // show magnification
//       if (isClass (_thisCfg >> "ItemInfo" >> "OpticsModes")) then {
//         private _opticsModes = "true" configClasses (_thisCfg >> "ItemInfo" >> "OpticsModes");
//         _dispName = _dispName + " (";
//         private _zoomsArr = [];
//         {
//           _fovAt1xZoom = ([] call CBA_fnc_getFov) select 0;
//           // _fovAt1xZoom = 0.75;
//           private _zoomMax = _fovAt1xZoom / getNumber(_x >> "opticsZoomMax");
//           if (_zoomMax > 1) then {
//             _zoomMax = ceil(_zoomMax / 2) - 1 max 1;
//           } else {
//             _zoomMax = ceil(_zoomMax);
//           };
//           _zoomsArr pushBack _zoomMax;
//         } forEach _opticsModes;
//         _zoomsArr sort true;
//         _maxZoomOverall = _zoomsArr select (count _zoomsArr - 1);
//         _zoomsArr = _zoomsArr apply {str(_x) + "x"};
//         _dispName = _dispName + (_zoomsArr joinString "/") + ")";
//       };

//       private _action = [
//         _dispName,
//         _dispName,
//         _picture,
//         { // statement
//           params ["_target", "_player", "_params"];
//           _params call fnf_selector_fnc_optics;
//         },
//         { // condition
//           params ["_target", "_player", "_params"];
//           _params in ([primaryWeapon player, "optic"] call CBA_fnc_compatibleItems) &&
//           fnf_pref_loadoutInterface == "ACE"
//         },
//         {}, // child code
//         _x
//       ] call ace_interact_menu_fnc_createAction;


//       switch (true) do {
//         case (_maxZoomOverall <= 2): {_lowChildActions pushBack [_action, [], _target]};
//         case (_maxZoomOverall > 2 && _maxZoomOverall <= 5): {_medChildActions pushBack [_action, [], _target]};
//         case (_maxZoomOverall > 5): {_hiChildActions pushBack [_action, [], _target]};
//       };
//     } forEach (missionNamespace getVariable ["fnf_selector_optics", []]);

//     // lo
//     _actions pushBack [
//       ["Optic_Selector_Lo","Low Zoom","\A3\ui_f\data\igui\cfg\weaponicons\srifle_ca.paa",{},{true}] call ace_interact_menu_fnc_createAction,
//       _lowChildActions,
//       _target
//     ];
//     // med
//     _actions pushBack [
//       ["Optic_Selector_Med","Med Zoom","\A3\ui_f\data\igui\cfg\weaponicons\srifle_ca.paa",{},{true}] call ace_interact_menu_fnc_createAction,
//       _medChildActions,
//       _target
//     ];
//     // hi
//     _actions pushBack [
//       ["Optic_Selector_Hi","Hi Zoom","\A3\ui_f\data\igui\cfg\weaponicons\srifle_ca.paa",{},{true}] call ace_interact_menu_fnc_createAction,
//       _hiChildActions,
//       _target
//     ];

//     _actions
//   }, // populate child items
//   []
// ] call ace_interact_menu_fnc_createAction;
// [(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;




// explosives
// _explosivesAction = [
//   "Explosives_Selector",
//   "Explosives",
//   (call {
//     if (count (missionNamespace getVariable ["fnf_selector_currentExplosives", []]) > 0) exitWith {
//       private _explTypeImages = (fnf_selector_currentExplosives select [1, 3]) apply {(_x splitString ':') select 0} apply {getText (configFile >> "CfgMagazines" >> _x >> "picture")};
//       selectRandom(_explTypeImages)
//     };
//     "\z\ace\addons\explosives\data\ui\clacker.paa"
//   }), // icon
//   {}, // statement
//   {LOADOUTROLE("CE") && fnf_pref_loadoutInterface == "ACE"}, // condition
//   {
//     params ["_target", "_player", "_params"];
//     // diag_log format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

//     // Add children to this action
//     private _actions = [];
//     {
//       _x params ["_name", "_items1", "_items2"];
//       private _explTypeImages = (_x select [1, 3]) apply {(_x splitString ':') select 0} apply {getText (configFile >> "CfgMagazines" >> _x >> "picture")};
//       private _childStatement = {
//         params ["_target", "_player", "_params"];
//         _params call fnf_selector_fnc_charges;
//       };
//       private _action = [
//         _name,
//         _name,
//         selectRandom(_explTypeImages),
//         _childStatement,
//         {true},
//         {},
//         _x
//       ] call ace_interact_menu_fnc_createAction;
//       _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
//     } forEach (missionNamespace getVariable ["fnf_selector_explosives", []]);

//     _actions
//   }, // populate child items
//   []
// ] call ace_interact_menu_fnc_createAction;
// [(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;


// CE grenades
// _grenadesAction = [
//   "Grenades_Selector",
//   "Grenades",
//   (call {
//     if (count (missionNamespace getVariable ["fnf_selector_currentGrenades", []]) > 0) exitWith {
//       ((fnf_selector_currentGrenades # 1) splitString ':') params ["_grenadeClass", "_count"];
//       private _thisCfg = _grenadeClass call CBA_fnc_getItemConfig;
//       getText (_thisCfg >> "picture")
//     };
//     "\a3\weapons_f\data\ui\icon_gl_ca.paa"
//   }), // icon
//   {}, // statement
//   {LOADOUTROLE("CE") && fnf_pref_loadoutInterface == "ACE"}, // condition
//   {
//     params ["_target", "_player", "_params"];
//     // diag_log format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

//     // Add children to this action
//     private _actions = [];
//     {
//       _x params ["_name", "_items"];
//       (_items splitString ':') params ["_grenadeClass", "_count"];
//       private _childStatement = {
//         params ["_target", "_player", "_params"];
//         _params call fnf_selector_fnc_grenades;
//       };
//       private _action = [
//         getText (configFile >> "CfgMagazines" >> _grenadeClass >> "displayName"),
//         format["%1x %2", _count, getText (configFile >> "CfgMagazines" >> _grenadeClass >> "displayName")],
//         getText (configFile >> "CfgMagazines" >> _grenadeClass >> "picture"),
//         _childStatement,
//         {true},
//         {},
//         _x
//       ] call ace_interact_menu_fnc_createAction;
//       _actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
//     } forEach (missionNamespace getVariable ["fnf_selector_grenades", []]);

//     _actions
//   }, // populate child items
//   []
// ] call ace_interact_menu_fnc_createAction;
// // [(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;

// _action = ["CSW_Selector","Crew-Served Weapons","\rhsusf\addons\rhsusf_heavyweapons\data\ico\rhs_m2staticmg_d_ca.paa",{},{
//   // limit gear selector in SA to when:
//   // - in safe zone (fnf_safety_fnc_init) OR
//   // - safeStart enabled, forcing them to be in a safe zone anyway (fnf_safety_fnc_startBoundary)
//   (player getVariable ["fnf_zoneProtectionActive", false]) || (missionNamespace getVariable ["fnf_safetyEnabled", true])
// }] call ace_interact_menu_fnc_createAction;
// [(typeOf player), 1, ["ACE_SelfActions"],_action] call ace_interact_menu_fnc_addActionToClass;





// Add actions if there are items to select from

// Weapons actions
// {
//   // "debug_console" callExtension ("ForEach fnf_selector_weapons: " + str(_x));
//   _action = [
//     "Weapon_Selector",
//     getText (configFile >> "cfgWeapons" >> _x # 0 >> "displayName"),
//     "",
//     { // param to code above

//       (_this select 2) call fnf_selector_fnc_weapons;
//     },
//     { // condition
//       primaryWeapon player != "" && count fnf_selector_weapons > 1 && fnf_pref_loadoutInterface == "ACE"
//     },
//     {},
//     _x // arg to be used in param, arg is array
//   ] call ace_interact_menu_fnc_createAction;
//   [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Weapon_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
// } forEach fnf_selector_weapons;


// optics actions
// {
//   private _thisCfg = _x call CBA_fnc_getItemConfig;
//   private _dispName = [_thisCfg] call BIS_fnc_displayName;

//   private _maxZoomOverall = 0;
//   // show magnification
//   if (isClass (_thisCfg >> "ItemInfo" >> "OpticsModes")) then {
//     private _opticsModes = "true" configClasses (_thisCfg >> "ItemInfo" >> "OpticsModes");
//     _dispName = _dispName + " (";
//     private _zoomsArr = [];
//     {
//       _fovAt1xZoom = ([] call CBA_fnc_getFov) select 0;
//       // _fovAt1xZoom = 0.75;
//       private _zoomMax = _fovAt1xZoom / getNumber(_x >> "opticsZoomMax");
//       if (_zoomMax > 1) then {
//         _zoomMax = ceil(_zoomMax / 2) - 1 max 1;
//       } else {
//         _zoomMax = ceil(_zoomMax);
//       };
//       _zoomsArr pushBack _zoomMax;
//     } forEach _opticsModes;
//     _zoomsArr sort true;
//     _maxZoomOverall = _zoomsArr select (count _zoomsArr - 1);
//     _zoomsArr = _zoomsArr apply {str(_x) + "x"};
//     _dispName = _dispName + (_zoomsArr joinString "/") + ")";
//   };

//   private _actionName = "";
//   switch (true) do {
//     case (_maxZoomOverall <= 2): {_actionName = "Optic_Selector_Lo"};
//     case (_maxZoomOverall > 2 && _maxZoomOverall <= 5): {_actionName = "Optic_Selector_Med"};
//     case (_maxZoomOverall > 5): {_actionName = "Optic_Selector_Hi"};
//   };

//   _action = [
//     _actionName,
//     _dispName,
//     "",
//     { // statement
//       _this call fnf_selector_fnc_optics;
//     },
//     { // condition
//       (_this select 2) in ([primaryWeapon player, "optic"] call CBA_fnc_compatibleItems) &&
//       fnf_pref_loadoutInterface == "ACE"
//     },
//     {}, // child code
//     _x
//   ] call ace_interact_menu_fnc_createAction;

//   [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Optic_Selector",_actionName], _action] call ace_interact_menu_fnc_addActionToClass;
// } forEach fnf_selector_optics;

// _action = [
//   "Optic_Selector",
//   "None",
//   "",
//   { // statement
//     player removePrimaryWeaponItem ((primaryWeaponItems player) select 2);
//     fnf_loadout_chosenOptic = "";
//   },
//   { // condition
//     fnf_loadout_chosenOptic != "" &&
//     fnf_pref_loadoutInterface == "ACE"
//   }
// ] call ace_interact_menu_fnc_createAction;
// [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Optic_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;


// Charges selector
// if (count (missionNamespace getVariable ["fnf_selector_explosives",[]]) > 0 && LOADOUTROLE("CE")) then {
//   //charges actions
//   {
//     // "debug_console" callExtension ("ForEach fnf_selector_charges: " + str(_x));
//     _action = [
//       "Explosives_Selector",
//       _x select 0,
//       "",
//       { // statement
//         (_this select 2) call fnf_selector_fnc_charges;
//       },
//       { // condition
//         fnf_pref_loadoutInterface == "ACE"
//       },
//       {}, // child code
//       _x
//     ] call ace_interact_menu_fnc_createAction;
//     [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Explosives_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
//   } forEach fnf_selector_explosives;
// };


// Grenades selector
// if (count (missionNamespace getVariable ["fnf_selector_grenades",[]]) > 0 && LOADOUTROLE("CE")) then {
//   {
//     _action = [
//       "Grenades_Selector",
//       _x select 0,
//       "",
//       { // statement
//         (_this select 2) call fnf_selector_fnc_grenades;
//       },
//       { // condition
//         fnf_pref_loadoutInterface == "ACE"
//       },
//       {}, // child code
//       _x
//     ] call ace_interact_menu_fnc_createAction;
//     [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Grenades_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
//   } forEach fnf_selector_grenades;
// };

// selector removal has been removed, as their parent Gear Selector has its own conditions now
// these actions persist through respawn, because the player respawns as the same 'typeOf' object and
// refer to arrays that are updated by the loadout script each run

//Remove selector when safe start ends
// [{!fnf_safetyEnabled}, {
//   [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector", "Optic_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
//   [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector", "Weapon_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
//   [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector", "Explosives_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
//   [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector", "Grenades_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
//   [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
// }] call CBA_fnc_waitUntilAndExecute;
