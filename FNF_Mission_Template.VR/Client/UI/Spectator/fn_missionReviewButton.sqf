/*
	Author: Mallen

	Description:
		Shows a button to submit a mission review

	Parameter(s):
		None

	Returns:
		None
*/

[{!isNull findDisplay 60000}, {
	disableSerialization;
	_display = findDisplay 60000;
	if (isNull _display) exitWith {};
	_button = _display ctrlCreate ["RscShortcutButton", 7046];
	_button ctrlSetPosition [
	0.7 * safeZoneW + safeZoneX,
	0.05 * safeZoneH + safeZoneY,
	0.1 * safeZoneW,
	0.03 * safeZoneH
	];
	_button ctrlSetText "Mission Review";
	_button ctrlSetBackgroundColor [0, 0.5, 0, 0.9];
	_button ctrlAddEventHandler ["ButtonClick", {
		[] spawn FNF_ClientSide_fnc_missionReviewScreen;
	}];
	_button ctrlCommit 0;
}] call CBA_fnc_waitUntilAndExecute;
