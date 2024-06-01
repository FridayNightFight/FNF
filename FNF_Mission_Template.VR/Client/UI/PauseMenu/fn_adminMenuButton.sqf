/*
	Author: Indigo (edited by Mallen)

	Description:
		Shows a button to open the admin Menu

	Parameter(s):
		1: DISPLAY -	The display object of the pause screen

	Returns:
		None
*/

disableSerialization;

params ["_display"];

if (not serverCommandAvailable "#kick") exitWith {};

_button = _display ctrlCreate ["RscShortcutButton", 7050];
_button ctrlSetPosition [
0.025 * safeZoneW + safeZoneX,
0.1 * safeZoneH + safeZoneY,
0.1 * safeZoneW,
0.03 * safeZoneH
];
_button ctrlSetText "Admin Menu";
_button ctrlSetBackgroundColor [0, 0.5, 0, 0.9];
_button ctrlAddEventHandler ["ButtonClick", {
	[] spawn FNF_ClientSide_fnc_adminMenu;
}];
_button ctrlCommit 0;
