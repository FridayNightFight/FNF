if (!hasInterface) exitWith {};
// #define DEBUG_MODE_FULL
// #define DEBUG_MODE_NORMAL
#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
// https://community.bistudio.com/wiki/DIK_KeyCodes


// Hide UI
// Ctrl-F12 default
// IndigoFox/Mallen
[
  [
    "Friday Night Fight",
    "User Interface"
  ],
  "fnf_key_hideUI",
  [
    "Hide UI",
    "Pressing this key will hide HUD elements for screenshot or recording purposes."
  ],
  { // key down code
    if (isNil "fnf_safetyEnabled") exitWith {};
    private _missionRuntimeSecs = (fnf_missionTimelimit * 60) + fnf_safetyEndTime;
    if (count (shownHUD select {_x isEqualTo true}) > 0) then {
      // if any HUD elements currently visible, we need to hide all
      showHUD [false,false,false,false,false,false,false,false,false,false,false];
      diwako_dui_main_toggled_off=true;
      showChat false;

      private _staminaBarContainer = uiNamespace getVariable ["ace_advanced_fatigue_staminaBarContainer", controlNull];
      ctrlDelete _staminaBarContainer;
      ace_advanced_fatigue_enableStaminaBar = false;

      [fnf_missionTimeUI_PFH] call CBA_fnc_removePerFrameHandler;
      uiNameSpace getVariable "timeleftStructText" closeDisplay 1;
    } else {
      // in any other case, we should show
      showHUD [true,true,true,true,true,true,false,true,true,true,false];
      diwako_dui_main_toggled_off=false;
      showChat true;

      ace_advanced_fatigue_enableStaminaBar = true;
      call ace_advanced_fatigue_fnc_createStaminaBar;
      if ((_missionRuntimeSecs - (15 * 60)) <= CBA_missionTime) then {
        call fnf_fnc_clientTime;
      };
    };
  },
  "", // no up code
  [DIK_F12, false, true, false], // default bind to Ctrl F12
  false, // don't press every frame while key down
  0, // 0 delay in execution
  false // don't overwrite custom bind
] call cba_fnc_addKeybind;


// Open Loadout Menu (if CBA)
// Ctrl-Shift-N default
// IndigoFox
[

  [
    "Friday Night Fight",
    "User Interface"
  ],
  "fnf_key_openLoadoutFleximenu",
  [
    "Open Loadout Selector (CBA only)",
    "If the CBA Fleximenu loadout interface is chosen, this key will be used to open it during safe start."
  ],
  { // key down code
    if (isNil "fnf_safetyEnabled") exitWith {};
    if (fnf_pref_LoadoutInterface isEqualTo "CBA" && fnf_safetyEnabled) then {
      ["player", [], -100, "call fnf_ui_fnc_safeStartMain"] call cba_fnc_flexiMenu_add;
      ["player", [], -100, "call fnf_ui_fnc_safeStartMain"] call cba_fnc_fleximenu_openMenuByDef;
    };
  },
  "", // no up code
  [DIK_N, [true, true, false]], // default bind to Ctrl Shift N
  false, // don't press every frame while key down
  0, // 0 delay in execution
  false // don't overwrite custom bind
] call cba_fnc_addKeybind;

// Open Mission Info Panel
// Ctrl-J default
// IndigoFox
[

  [
    "Friday Night Fight",
    "User Interface"
  ],
  "fnf_key_missionInfoPanel",
  [
    "Open Mission Info Panel",
    "View mission details, including in spectator"
  ],
  { // key down code
    if (!dialog) then {
      [] spawn fnf_ui_fnc_missionInfoPanel;
    };
  },
  "", // no up code
  [DIK_J, [false, true, false]], // default bind to Ctrl J
  false, // don't press every frame while key down
  0, // 0 delay in execution
  false // don't overwrite custom bind
] call cba_fnc_addKeybind;

// Open Admin Panel
// Shift-J default
// IndigoFox
[

  [
    "Friday Night Fight",
    "Administration"
  ],
  "fnf_key_adminPanel",
  [
    "Open Admin Panel",
    "Perform routine administrative tasks to the mission and players in it"
  ],
  { // key down code
    if (!dialog && (getPlayerUID player in (missionNamespace getVariable ["fnf_staffInfo",[]]) || serverCommandAvailable "#kick")) then {
      [] spawn fnf_admin_fnc_adminUI;
    };
  },
  "", // no up code
  [DIK_J, [true, false, false]], // default bind to Shift J
  false, // don't press every frame while key down
  0, // 0 delay in execution
  false // don't overwrite custom bind
] call cba_fnc_addKeybind;
