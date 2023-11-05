/*
	Author: Indigo (edited by Mallen)

	Description:
		Shows a button to view mission details

	Parameter(s):
	  1: DISPLAY -  The display object of the pause screen

	Returns:
		None
*/

disableSerialization;

[{!isNull findDisplay 60000}, {
  disableSerialization;
  _display = findDisplay 60000;
  if (isNull _display) exitWith {};
  _button = _display ctrlCreate ["RscShortcutButton", 7045];
  _button ctrlSetPosition [
  0.2 * safeZoneW + safeZoneX,
  0.05 * safeZoneH + safeZoneY,
  0.1 * safeZoneW,
  0.03 * safeZoneH
  ];
  _button ctrlSetText "Mission Details";
  _button ctrlSetBackgroundColor [0, 0.5, 0, 0.9];
  _button ctrlAddEventHandler ["ButtonClick", {
    [] spawn FNF_ClientSide_fnc_missionDetailsScreen;
  }];
  _button ctrlCommit 0;
}] call CBA_fnc_waitUntilAndExecute;
