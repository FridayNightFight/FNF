#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[["FNF", "UI/Screenshots"], "phx_key_hideUI", ["Hide UI","Used to Hide all UI, useful for taking screenshots!"], {
	private _missionRuntimeSecs = (phx_missionTimelimit * 60) + phx_safetyEndTime;
    if (count (shownHUD select {_x isEqualTo true}) > 0) then {
        // if any HUD elements currently visible, we need to hide all
        showHUD [false,false,false,false,false,false,false,false,false,false,false];
        diwako_dui_main_toggled_off=true;
        showChat false;

		private _staminaBarContainer = uiNamespace getVariable ["ace_advanced_fatigue_staminaBarContainer", controlNull];
		ctrlDelete _staminaBarContainer;
		ace_advanced_fatigue_enableStaminaBar = false;

		[phx_missionTimeUI_PFH] call CBA_fnc_removePerFrameHandler;
      	uiNameSpace getVariable "timeleftStructText" closeDisplay 1;
    } else {
        // in any other case, we should show
        showHUD [true,true,true,true,true,true,false,true,true,true,false];
        diwako_dui_main_toggled_off=false;
        showChat true;

		ace_advanced_fatigue_enableStaminaBar = true;
		call ace_advanced_fatigue_fnc_createStaminaBar;
		if ((_missionRuntimeSecs - (15 * 60)) <= CBA_missionTime) then {
      		call phx_fnc_clientTime;
  		};
    };
}, "", [DIK_F12, [true, false , false]]] call cba_fnc_addKeybind;