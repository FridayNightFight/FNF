/*
	Author: Mallen

	Description:
		Shows a Peice of text telling the player how many lives they have left

	Parameter(s):
		1: DISPLAY -	The display object of the pause screen

	Returns:
		None
*/

disableSerialization;

params ["_display"];

_button = _display ctrlCreate ["RscText", 7047];
_button ctrlSetPosition [
0.025 * safeZoneW + safeZoneX,
0.15 * safeZoneH + safeZoneY,
0.1 * safeZoneW,
0.03 * safeZoneH
];
_button ctrlSetText "Respawns Left: " + str(missionNamespace getVariable [("fnf_livesLeft_" + getPlayerUID player), -1]);
_button ctrlSetBackgroundColor [0, 0, 0, 0.5];
_button ctrlCommit 0;
