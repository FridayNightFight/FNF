/*
	Author: Mallen

	Description:
		watch a destroy objective server side

	Parameter(s):
		0: INTEGER -	The index of the objective to watch

	Returns:
		Boolean
*/

params ["_objectiveIndex"];

_objEntry = fnf_serverObjectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_objType = _module getVariable ["fnf_objectiveType", "des"];

_params params ["_targetObject", "_marker"];

_timeOfCompletion = _targetObject getVariable ['fnf_currentlyHackingCompletionTime', -1];
_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];

if (_timeOfCompletion isEqualTo -1 or _timeServerStarted isEqualTo -1) then
{
	_marker setMarkerTextLocal "Terminal [Idle]";
} else {
	_resultTime = objNull;
	if (isServer and hasInterface) then
	{
		_resultTime = _timeOfCompletion - time;
	} else {
		_resultTime = _timeOfCompletion - (serverTime - _timeServerStarted);
	};
	_timeText = [_resultTime, "MM:SS"] call BIS_fnc_secondsToString;

	_marker setMarkerTextLocal format["Terminal [%1]", _timeText];

	_previouslyHackingSide = _targetObject getVariable ['fnf_previouslyHackingSide', sideUnknown];

	if (markerColor _marker isEqualTo "ColorBlack") then
	{
		_markerColour = [_previouslyHackingSide, true] call BIS_fnc_sideColor;
		_marker setMarkerColorLocal _markerColour;
	} else {
		_marker setMarkerColorLocal "ColorBlack";
	};
};

_result = objNull;
if (isServer and hasInterface) then
{
	_result = time > _timeOfCompletion;
} else {
	_result = (serverTime - _timeServerStarted) > _timeOfCompletion;
	if (_timeServerStarted isEqualTo -1) then
	{
		_result = false;
	};
};
if (_timeOfCompletion isEqualTo -1) then
{
	_result = false;
};

if (not _result) exitWith {};

_newObjState = 5;
if (_objType isEqualTo "hck") then
{
	_newObjState = 4;
};

_completedExplosion = _targetObject getVariable ['fnf_explosionHandeled', false];

if (not _completedExplosion) then
{
	_targetObject setVariable ['fnf_explosionHandeled', true, false];
	playSound3D ["fnf_sounds\sounds\bomb_alarm.ogg", _targetObject];
	[{
		hideObjectGlobal _this;
		"Bo_GBU12_LGB" createVehicle (getposATL _this);
	},_targetObject,12] call CBA_fnc_waitAndExecute;
};

_module setVariable ["fnf_objServerState", _newObjState, true];

fnf_serverObjectives set [_objectiveIndex, [_newObjState, _module, _task, _alliedTask, _codeOnCompletion, _params]];

call _codeOnCompletion;
