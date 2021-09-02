/*
	Adds FNF-related settings and keybinds.
*/
class CfgPatches
{
	class fnf_setup
	{
		units[] = {};
		weapons[]={};
		requiredAddons[] = {"cba_xeh", "cba_settings"};
		requiredVersion = 0.1;
		author = "FNF Technical Team";
	};
};

class Extended_PreInit_EventHandlers {
	class FNF_SettingsToCBA {
		// CBA settings
		init = "call compile preprocessFileLineNumbers 'fnf_setup\XEH_preInit.sqf'";
	};
};

class Extended_PostInit_EventHandlers {
	class FNF_KeybindsToCBA {
		// hotkeys
		init = "call compile preprocessFileLineNumbers 'fnf_setup\XEH_postInit.sqf'";
	};
};