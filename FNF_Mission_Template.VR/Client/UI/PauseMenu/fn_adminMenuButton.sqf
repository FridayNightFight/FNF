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

_buttonOpforPlus = _display ctrlCreate ["RscShortcutButton", -1];
_buttonOpforPlus ctrlSetPosition [
0.115 * safeZoneW + safeZoneX,
0.42 * safeZoneH + safeZoneY,
0.02 * safeZoneW,
0.03 * safeZoneH
];
_buttonOpforPlus ctrlSetText "+1";
_buttonOpforPlus ctrlSetBackgroundColor [0.5, 0, 0, 0.9];
_buttonOpforPlus ctrlAddEventHandler ["ButtonClick", {
	_opforScore = missionNamespace getVariable ["fnf_opforScore", 0];
	missionNamespace setVariable ["fnf_opforScore", _opforScore + 1, true];
}];
_buttonOpforPlus ctrlCommit 0;

_buttonOpforMinus = _display ctrlCreate ["RscShortcutButton", -1];
_buttonOpforMinus ctrlSetPosition [
0.095 * safeZoneW + safeZoneX,
0.42 * safeZoneH + safeZoneY,
0.02 * safeZoneW,
0.03 * safeZoneH
];
_buttonOpforMinus ctrlSetText "-1";
_buttonOpforMinus ctrlSetBackgroundColor [0.5, 0, 0, 0.9];
_buttonOpforMinus ctrlAddEventHandler ["ButtonClick", {
	_opforScore = missionNamespace getVariable ["fnf_opforScore", 0];
	missionNamespace setVariable ["fnf_opforScore", _opforScore - 1, true];
}];
_buttonOpforMinus ctrlCommit 0;

_buttonClear = _display ctrlCreate ["RscShortcutButton", -1];
_buttonClear ctrlSetPosition [
0.065 * safeZoneW + safeZoneX,
0.42 * safeZoneH + safeZoneY,
0.03 * safeZoneW,
0.03 * safeZoneH
];
_buttonClear ctrlSetText "Clear";
_buttonClear ctrlSetBackgroundColor [0.3, 0.3, 0.3, 0.9];
_buttonClear ctrlAddEventHandler ["ButtonClick", {
	[] spawn {
		private _parentDisplay = findDisplay 46; //Mission display
		private _spectatorDisplay = findDisplay 60000; //ACE spectator display

		if (!isNull _spectatorDisplay) then {_parentDisplay = _spectatorDisplay}; //If ACE spectator display is active, use it for GUI message parent display

		private _result = ["Are you sure you want to clear all scores?", "Confirm", true, true, _parentDisplay] call BIS_fnc_guiMessage;

		if (_result) then {
			missionNamespace setVariable ["fnf_opforScore", 0, true];
			missionNamespace setVariable ["fnf_bluforScore", 0, true];
		};
	};
}];
_buttonClear ctrlCommit 0;

_buttonBluforPlus = _display ctrlCreate ["RscShortcutButton", -1];
_buttonBluforPlus ctrlSetPosition [
0.025 * safeZoneW + safeZoneX,
0.42 * safeZoneH + safeZoneY,
0.02 * safeZoneW,
0.03 * safeZoneH
];
_buttonBluforPlus ctrlSetText "+1";
_buttonBluforPlus ctrlSetBackgroundColor [0, 0.3, 0.6, 0.9];
_buttonBluforPlus ctrlAddEventHandler ["ButtonClick", {
	_bluforScore = missionNamespace getVariable ["fnf_bluforScore", 0];
	missionNamespace setVariable ["fnf_bluforScore", _bluforScore + 1, true];
}];
_buttonBluforPlus ctrlCommit 0;

_buttonBluforMinus = _display ctrlCreate ["RscShortcutButton", -1];
_buttonBluforMinus ctrlSetPosition [
0.045 * safeZoneW + safeZoneX,
0.42 * safeZoneH + safeZoneY,
0.02 * safeZoneW,
0.03 * safeZoneH
];
_buttonBluforMinus ctrlSetText "-1";
_buttonBluforMinus ctrlSetBackgroundColor [0, 0.3, 0.6, 0.9];
_buttonBluforMinus ctrlAddEventHandler ["ButtonClick", {
	_bluforScore = missionNamespace getVariable ["fnf_bluforScore", 0];
	missionNamespace setVariable ["fnf_bluforScore", _bluforScore - 1, true];
}];
_buttonBluforMinus ctrlCommit 0;
