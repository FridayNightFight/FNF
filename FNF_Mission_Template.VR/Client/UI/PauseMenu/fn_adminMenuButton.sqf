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

fnf_staffInfo = [
  "76561198004582151",
  "76561198089279362",
  "76561198106536334",
  "76561198045877943",
  "76561197963359463",
  "76561198077070073",
  "76561197972754614",
  "76561198111741251",
  //Mallen, For testing:
  "76561198061743924"
];

//if player is not logged in admin, kick them
if (not ((getPlayerUID player) in fnf_staffInfo)) exitWith {};

_button = _display ctrlCreate ["RscShortcutButton", 7045];
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
