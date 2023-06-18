/*
Creates a control on the pause screen for the player to send a message to connected admins.
*/

disableSerialization;
private "_display";
if (ace_spectator_isSet) then {
	_display = findDisplay 60000 createDisplay "RscDisplayEmpty";
} else {
	_display = findDisplay 46 createDisplay "RscDisplayEmpty";
};
private _ctrlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
private _ctrlBackground = _display ctrlCreate ["RscTextMulti", -1, _ctrlGroup];
IDD_EDIT_BOX = 123;
private _ctrlEdit = _display ctrlCreate ["RscEditMulti", IDD_EDIT_BOX, _ctrlGroup];
private _ctrlButton = _display ctrlCreate ["RscShortcutButton", -1, _ctrlGroup];
_ctrlGroup ctrlSetPosition [0.5, 0.5, 0, 0];
_ctrlGroup ctrlCommit 0;
_ctrlBackground ctrlSetPosition [0, 0, 0.5, 0.5];
_ctrlBackground ctrlSetBackgroundColor [0.5, 0.5, 0.5, 0.9];
_ctrlBackground ctrlSetText "Contact Connected Staff";
_ctrlBackground ctrlEnable false;
_ctrlBackground ctrlCommit 0;
_ctrlEdit ctrlSetPosition [0.01, 0.05, 0.48, 0.34];
_ctrlEdit ctrlSetBackgroundColor [0, 0, 0, 0.5];
_ctrlEdit ctrlCommit 0;
_ctrlButton ctrlSetPosition [0.185, 0.42, 0.13, 0.05];
_ctrlButton ctrlCommit 0;
_ctrlButton ctrlSetText "SUBMIT";
_ctrlButton ctrlAddEventHandler ["ButtonClick",
{
	params ["_ctrl"];
	_display = ctrlParent _ctrl;
	_text = ctrlText (_display displayCtrl IDD_EDIT_BOX);

	if (_text == "") then {
		_display closeDisplay 1;
	} else {

		private _msgLength = count _text;
		private _grid = mapGridPosition player;
		private _infoText = [];
		private _msgText = [];
		private _prefix = "";

		_prefix = format [
			"GRID: %1 | SIDE: %2",
			_grid,
			(playerSide call BIS_fnc_sideID) call BIS_fnc_sideName
		];
		_infoText pushBack _prefix;
		// ["fnfAdminMessageSent", [player, _prefix]] call CBA_fnc_globalEvent;

		_prefix = format [
			"ROLE: %1 in %2",
			((roleDescription player) splitString '@') # 0,
			groupId (group player)
		];
		_infoText pushBack _prefix;
		// ["fnfAdminMessageSent", [player, _prefix]] call CBA_fnc_globalEvent;

		if (_msgLength > 300) then {

			private _index = 0;
			private _thisPart = "";

			while {_msgLength > 0} do {
				_thisPart = _text select [_index * 300, 300];
				_msgText pushBack _thisPart;
				// ["fnfAdminMessageSent", [player, _thisPart]] call CBA_fnc_globalEvent;
				_msgLength = _msgLength - 300;
				_index = _index + 1;
			};
		} else {
			_msgText pushBack _text;
			// ["fnfAdminMessageSent", [player, _message]] call CBA_fnc_globalEvent;
		};


		_elapsed = cba_missionTime;
		_minutes = floor(_elapsed / 60);
		_seconds = floor(_elapsed % 60);
		// [_minutes, _seconds]

		// send global event -- staff will have a handler to deal with it
		["fnfAdminMessageSent", [player, _infoText, _msgText]] call CBA_fnc_globalEvent;

		// sends event to server w/ information
		// server resolves currently logged in admin then publishes Discord embed with report
		["fnfAdminMessageServer", [
			"",
			name player,
			(_msgText joinString "\n"),
			(playerSide call BIS_fnc_sideID) call BIS_fnc_sideName,
			format [
				"%1 in %2",
				((roleDescription player) splitString '@') # 0,
				groupId (group player)
			],
			briefingName,
			worldName,
			_grid,
			// cba_missionTime
			[cba_missionTime / 60, "HH:MM"] call BIS_fnc_timeToString
		]] call CBA_fnc_serverEvent;

		_display closeDisplay 1;
	};
}];
ctrlSetFocus _ctrlEdit;
_ctrlGroup ctrlSetPosition [0.25, 0.25, 0.5, 0.5];
_ctrlGroup ctrlCommit 0.1;
