/*
	Author: Indigo (edited by Mallen)

	Description:
		Shows a button to make a mission review

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
0.15 * safeZoneH + safeZoneY,
0.1 * safeZoneW,
0.03 * safeZoneH
];
_button ctrlSetText "Mission Review";
_button ctrlSetBackgroundColor [0, 0.5, 0, 0.9];
_button ctrlAddEventHandler ["ButtonClick", {
	[] spawn FNF_ClientSide_fnc_missionReviewScreen;
}];
_button ctrlCommit 0;
