/*
	Author: Indigo (edited by Mallen)

	Description:
		Shows a button to contact staff

	Parameter(s):
		1: DISPLAY -	The display object of the pause screen

	Returns:
		None
*/

disableSerialization;

params ["_display"];

_button = _display ctrlCreate ["RscShortcutButton", 7045];
_button ctrlSetPosition [
0.025 * safeZoneW + safeZoneX,
0.2 * safeZoneH + safeZoneY,
0.1 * safeZoneW,
0.03 * safeZoneH
];
_button ctrlSetText "Contact Staff";
_button ctrlSetBackgroundColor [0, 0.5, 0, 0.9];
_button ctrlAddEventHandler ["ButtonClick", {
	[] spawn FNF_ClientSide_fnc_contactStaff;
}];
_button ctrlCommit 0;
