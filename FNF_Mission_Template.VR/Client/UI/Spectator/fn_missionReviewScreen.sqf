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

_display = findDisplay 60000 createDisplay "RscDisplayEmpty";

_hashMap = missionNamespace getVariable ["fnf_missionsReviews", createHashMap];
_currentValues = _hashMap getOrDefault [(getPlayerUID player), [name player,0,""]];
_currentSlider = _currentValues select 1;
_currentText = _currentValues select 2;

//create background
_background = _display ctrlCreate ["RscBackgroundGUI", -1];
_background ctrlSetPosition [0,0,1,1];
_background ctrlCommit 0;

_title = _display ctrlCreate ["RscStructuredText", -1];
_title ctrlSetPosition [0,0,1,0.15];
_title ctrlSetStructuredText parseText "<t size='2' color='#FF8E38'>Mission Review</t><br/>Reviews are saved on server and are submitted when the round is over";
_title ctrlCommit 0;

_sliderTitle = _display ctrlCreate ["RscStructuredText", -1];
_sliderTitle ctrlSetPosition [0,0.15,1,0.05];
_sliderTitle ctrlSetStructuredText parseText "What would you rate this mission out of 5?        0/5";
_sliderTitle ctrlCommit 0;

_slider = _display ctrlCreate ["RscXSliderH", -1];
_slider ctrlSetPosition [0.01,0.2,0.5,0.05];
_slider sliderSetRange [0, 10];
_slider sliderSetSpeed [1, 1, 1];
_slider sliderSetPosition _currentSlider;
_slider ctrlCommit 0;

_textTitle = _display ctrlCreate ["RscStructuredText", -1];
_textTitle ctrlSetPosition [0,0.3,1,0.05];
_textTitle ctrlSetStructuredText parseText "Do you have any notes about the mission?";
_textTitle ctrlCommit 0;

_text = _display ctrlCreate ["RscEditMulti", -1];
_text ctrlSetPosition [0.01,0.35,0.98,0.55];
_text ctrlSetText _currentText;
_text ctrlCommit 0;

_saveButton = _display ctrlCreate ["RscShortcutButton", -1];
_saveButton ctrlSetText "Save";
_saveButton ctrlSetPosition [0.79,0.92,0.2,0.06];
_saveButton ctrlSetBackgroundColor [0, 0.5, 0, 0.9];
_saveButton ctrlAddEventHandler ["ButtonClick", {
	params ["_control"];
	_display = ctrlParent _control;

	_ctrls = allControls _display;

	_slider = objNull;
	_text = objNull;

	{
		_type = ctrlType _x;
		if (_type isEqualTo 2) then
		{
			_text = _x;
		};
		if (_type isEqualTo 43) then
		{
			_slider = _x;
		};
	} forEach _ctrls;

	_sliderPos = sliderPosition _slider;
	_textContent = ctrlText _text;

	_upToDateHashMap = missionNamespace getVariable ["fnf_missionsReviews", createHashMap];
	_upToDateHashMap set [getPlayerUID player, [name player, _sliderPos, _textContent]];
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
	(_this select 0) params ["_slider","_sliderTitle"];

	_position = sliderPosition _slider;
	_sliderTitle ctrlSetStructuredText parseText (format["What would you rate this mission out of 10?        %1/10", _position]);
	_sliderTitle ctrlCommit 0;
},0,[_slider, _sliderTitle]] call CBA_fnc_addPerFrameHandler;

//add EH to delete PFH when menu is closed
fnf_missionReviewPFH = _handle;

_display displayAddEventHandler ["Unload", {
	[fnf_missionReviewPFH] call CBA_fnc_removePerFrameHandler;
}];
