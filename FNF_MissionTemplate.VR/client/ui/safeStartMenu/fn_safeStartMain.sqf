// params ["_weapons", "_optics", "_charges"];
_weapons = +phx_selector_weapons;
_optics = +phx_selector_optics;
_charges = +phx_selector_explosives;
_grenades = +phx_selector_grenades;

// menu resource types are arma2, buttonList, popup, rose
phx_safeStartMenu = [
	[
		"safeStartMenu",
		"FNF SafeStart Menu",
		"popup",
		"",
		false
	],
	[
		["Weapon Selector", "", "", "", format["[%1] call phx_ui_fnc_weaponSelector", _weapons], -1],
		["Optic Selector", "", "", "", format["[%1] call phx_ui_fnc_opticSelector", _optics], -1],
		["Charges Selector", "", "", "", format["[%1] call phx_ui_fnc_chargesSelector", _charges], -1, (pRole == ROLE_CE)],
		["Grenades Selector", "", "", "", format["[%1] call phx_ui_fnc_grenadesSelector", _grenades], -1, (pRole == ROLE_CE)]
	]
];



// _mainMenu pushBack [_weaponSubMenu];
// _return pushBack _weps;
// "debug_console" callextension str _mainMenu;
phx_safeStartMenu