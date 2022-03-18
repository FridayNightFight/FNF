// #define DEBUG_MODE_FULL
// #define DEBUG_MODE_NORMAL
#include "\x\cba\addons\main\script_macros_common.hpp"


[
  "fnf_pref_loadoutInterface", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
  "LIST", // setting type
  [
    "Preferred Loadout Interface", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Defines the system you wish to use to change optics, weapons, explosives, etc"
  ],
  "Friday Night Fight", // Pretty name of the category where the setting can be found. Can be stringtable entry.
  [
    [
      "ACE",
      "CBA"
    ],
    [
      "ACE Self-Interact",
      "CBA FlexiMenu"
    ],
    0
  ], // data for this setting: [min, max, default, number of shown trailing decimals]
  nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {
    params ["_value"];
  } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;


[
  "fnf_pref_spectatorInterface", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
  "LIST", // setting type
  [
    "Preferred Spectator Interface", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "Defines the system you wish to use for spectating"
  ],
  "Friday Night Fight", // Pretty name of the category where the setting can be found. Can be stringtable entry.
  [
    [
      "ACE"
    ],
    [
      "ACE Spectator"
    ],
    0
  ], // data for this setting: [min, max, default, number of shown trailing decimals]
  nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {
    params ["_value"];
  } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;
