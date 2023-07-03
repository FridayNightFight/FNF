/*
	Author: Indigo (edited by Mallen)

	Description:
		Shows the further text box for contacting staff with the message

	Parameter(s):
	  None

	Returns:
		None
*/

disableSerialization;

//if player is in spectator change which display to make button on
_display = objNull;
if (ace_spectator_isSet) then {
	_display = findDisplay 60000 createDisplay "RscDisplayEmpty";
} else {
	_display = findDisplay 46 createDisplay "RscDisplayEmpty";
};

//create text box to type message in to
_ctrlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_ctrlBackground = _display ctrlCreate ["RscTextMulti", -1, _ctrlGroup];
_ctrlEdit = _display ctrlCreate ["RscEditMulti", 123, _ctrlGroup];
_ctrlButton = _display ctrlCreate ["RscShortcutButton", -1, _ctrlGroup];
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

//add eventhandeler for button
_ctrlButton ctrlAddEventHandler ["ButtonClick",
{
	params ["_ctrl"];
	_display = ctrlParent _ctrl;
	_text = ctrlText (_display displayCtrl 123);

	if (_text == "") then {
		_display closeDisplay 1;
	} else {
    _playerName = name player;
    _pos = getPos player;

		// send global event -- staff will have a handler to deal with it
    [_playerName, _pos, _text] remoteExec ["FNF_ClientSide_fnc_recieveContactStaffRequest", 0, false];

		_display closeDisplay 1;
	};
}];
ctrlSetFocus _ctrlEdit;
_ctrlGroup ctrlSetPosition [0.25, 0.25, 0.5, 0.5];
_ctrlGroup ctrlCommit 0.1;
