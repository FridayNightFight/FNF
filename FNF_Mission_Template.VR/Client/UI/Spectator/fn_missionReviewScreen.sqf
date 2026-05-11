/*
	Author: Mallen

	Description:
		Shows a screen where players can leave reviews based on UIDs

	Parameter(s):
		None

	Returns:
		None
*/

disableSerialization;
_display = objNull;
if (ace_spectator_isSet) then
{
	_display = findDisplay 60000 createDisplay "RscDisplayEmpty";
} else {
	_display = findDisplay 46 createDisplay "RscDisplayEmpty";
};

_hashMap = missionNamespace getVariable ["fnf_missionsReviews", createHashMap];
_currentValues = _hashMap getOrDefault [(getPlayerUID player), [name player,0,"",0]];
_currentMissionSlider = _currentValues select 1;
_currentText = _currentValues select 2;
_currentCommanderSlider = _currentValues select 3;

//create background
_background = _display ctrlCreate ["RscBackgroundGUI", -1];
_background ctrlSetPosition [0,0,1,1];
_background ctrlCommit 0;

_title = _display ctrlCreate ["RscStructuredText", -1];
_title ctrlSetPosition [0,0,1,0.15];
_title ctrlSetStructuredText parseText "<t size='2' color='#FF8E38'>Mission Review</t><br/>Reviews are saved on server and are submitted when the round is over";
_title ctrlCommit 0;

_missionSliderTitle = _display ctrlCreate ["RscStructuredText", -1];
_missionSliderTitle ctrlSetPosition [0,0.15,1,0.05];
_missionSliderTitle ctrlSetStructuredText parseText "What would you rate this mission out of 10?        0/10";
_missionSliderTitle ctrlCommit 0;

_missionSlider = _display ctrlCreate ["RscXSliderH", -1];
_missionSlider ctrlSetPosition [0.01,0.2,0.5,0.05];
_missionSlider sliderSetRange [0, 10];
_missionSlider sliderSetSpeed [1, 1, 1];
_missionSlider sliderSetPosition _currentMissionSlider;
_missionSlider ctrlCommit 0;

_commanderSliderTitle = _display ctrlCreate ["RscStructuredText", -1];
_commanderSliderTitle ctrlSetPosition [0,0.3,1,0.05];
_commanderSliderTitle ctrlSetStructuredText parseText "What would you rate the commanding out of 10?        0/10";
_commanderSliderTitle ctrlCommit 0;

_commanderSlider = _display ctrlCreate ["RscXSliderH", -1];
_commanderSlider ctrlSetPosition [0.01,0.35,0.5,0.05];
_commanderSlider sliderSetRange [0, 10];
_commanderSlider sliderSetSpeed [1, 1, 1];
_commanderSlider sliderSetPosition _currentCommanderSlider;
_commanderSlider ctrlCommit 0;

_textTitle = _display ctrlCreate ["RscStructuredText", -1];
_textTitle ctrlSetPosition [0,0.45,1,0.05];
_textTitle ctrlSetStructuredText parseText "Do you have any notes about the mission?";
_textTitle ctrlCommit 0;

_text = _display ctrlCreate ["RscEditMulti", -1];
_text ctrlSetPosition [0.01,0.5,0.98,0.4];
_text ctrlSetText _currentText;
_text ctrlCommit 0;

fnf_test = [];

_saveButton = _display ctrlCreate ["RscShortcutButton", -1];
_saveButton ctrlSetText "Save";
_saveButton ctrlSetPosition [0.79,0.92,0.2,0.06];
_saveButton ctrlSetBackgroundColor [0, 0.5, 0, 0.9];
_saveButton ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];
	_display = ctrlParent _control;

	_ctrls = allControls _display;

	_missionSlider = objNull;
	_commanderSlider = objNull;
	_text = objNull;

	{
		_type = ctrlType _x;
		if (_type isEqualTo 2) then
		{
			_text = _x;
		};
		if (_type isEqualTo 43) then
		{
			if ((ctrlPosition _x) isEqualTo ([0.01,0.2,0.5,0.05])) then
			{
				_missionSlider = _x;
			} else {
				_commanderSlider = _x;
			};
		};
	} forEach _ctrls;

	_missionSliderPos = sliderPosition _missionSlider;
	_commanderSliderPos = sliderPosition _commanderSlider;
	_textContent = ctrlText _text;

	_upToDateHashMap = missionNamespace getVariable ["fnf_missionsReviews", createHashMap];
	_upToDateHashMap set [getPlayerUID player, [name player, _missionSliderPos, _textContent, _commanderSliderPos]];
	missionNamespace setVariable ["fnf_missionsReviews", _upToDateHashMap, true];

	_display closeDisplay 1;
	[{["<t size='1.5' align='center'>Review Saved</t><br/><br/><t align='center'>Review has been saved on the server, it will be submitted when the mission is finished, you can edit your review at any point before that!</t>", "info", 10] call FNF_ClientSide_fnc_notificationSystem;}, [], 1] call CBA_fnc_waitAndExecute;
}];
_saveButton ctrlCommit 0;

_cancelButton = _display ctrlCreate ["RscShortcutButton", -1];
_cancelButton ctrlSetText "Cancel";
_cancelButton ctrlSetPosition [0.01,0.92,0.2,0.06];
_cancelButton ctrlSetBackgroundColor [0, 0.5, 0, 0.9];
_cancelButton ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];
	_display = ctrlParent _control;
	_display closeDisplay 2;
}];
_cancelButton ctrlCommit 0;

_handle = [{
	(_this select 0) params ["_missionSlider","_missionSliderTitle", "_commanderSlider", "_commanderSliderTitle"];

	_missionPosition = sliderPosition _missionSlider;
	_missionSliderTitle ctrlSetStructuredText parseText (format["What would you rate this mission out of 10?        %1/10", _missionPosition]);
	_missionSliderTitle ctrlCommit 0;

	_commanderPosition = sliderPosition _commanderSlider;
	_commanderSliderTitle ctrlSetStructuredText parseText (format["What would you rate the commanding out of 10?        %1/10", _commanderPosition]);
	_commanderSliderTitle ctrlCommit 0;
},0,[_missionSlider, _missionSliderTitle, _commanderSlider, _commanderSliderTitle]] call CBA_fnc_addPerFrameHandler;

//add EH to delete PFH when menu is closed
fnf_missionReviewPFH = _handle;

_display displayAddEventHandler ["Unload", {
	[fnf_missionReviewPFH] call CBA_fnc_removePerFrameHandler;
}];
