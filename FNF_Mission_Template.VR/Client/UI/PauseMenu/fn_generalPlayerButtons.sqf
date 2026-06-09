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

_conStfButton = _display ctrlCreate ["RscShortcutButton", 7045];
_conStfButton ctrlSetPosition [
0.025 * safeZoneW + safeZoneX,
0.2 * safeZoneH + safeZoneY,
0.1 * safeZoneW,
0.03 * safeZoneH
];
_conStfButton ctrlSetText "Contact Staff";
_conStfButton ctrlSetBackgroundColor [0, 0.5, 0, 0.9];
_conStfButton ctrlAddEventHandler ["ButtonClick", {
	[] spawn FNF_ClientSide_fnc_contactStaff;
}];
_conStfButton ctrlCommit 0;


_reviewButton = _display ctrlCreate ["RscShortcutButton", 7045];
_reviewButton ctrlSetPosition [
0.025 * safeZoneW + safeZoneX,
0.15 * safeZoneH + safeZoneY,
0.1 * safeZoneW,
0.03 * safeZoneH
];
_reviewButton ctrlSetText "Mission Review";
_reviewButton ctrlSetBackgroundColor [0, 0.5, 0, 0.9];
_reviewButton ctrlAddEventHandler ["ButtonClick", {
	[] spawn FNF_ClientSide_fnc_missionReviewScreen;
}];
_reviewButton ctrlCommit 0;

_livesLeft = missionNamespace getVariable [("fnf_livesLeft_" + getPlayerUID player), "NONE FOUND"];
if (_livesLeft isEqualTo "NONE FOUND") exitWith {};

_livesLeftText = _display ctrlCreate ["RscText", 7047];
_livesLeftText ctrlSetPosition [
0.025 * safeZoneW + safeZoneX,
0.25 * safeZoneH + safeZoneY,
0.1 * safeZoneW,
0.03 * safeZoneH
];
_livesLeftText ctrlSetText "Respawns Left: " + str(_livesLeft);
_livesLeftText ctrlSetBackgroundColor [0, 0, 0, 0.5];
_livesLeftText ctrlCommit 0;
