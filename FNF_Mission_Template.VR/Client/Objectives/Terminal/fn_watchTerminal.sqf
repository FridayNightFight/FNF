/*
	Author: Mallen

	Description:
		watch a terminal objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		1: INTEGER -	The index of the objective to watch

	Returns:
		Boolean
*/

params ["_objectiveIndex"];

_objEntry = fnf_objectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_serverState = _module getVariable ["fnf_objServerState", 3];

_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];

//get current timer values
_timeOfCompletion = _targetObject getVariable ['fnf_currentlyHackingCompletionTime', -1];
_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];

//if timer not active
if (_timeOfCompletion isEqualTo -1 or (_timeServerStarted isEqualTo -1 and not isServer)) then
{
	//set marker text to idle
	_marker setMarkerTextLocal "[Idle]";
	if (ace_spectator_isset) then
	{
		_marker setMarkerTextLocal format["Terminal %1 [Idle]", _objectiveIndex + 1];
	};
} else {
	//get in seconds how much is left on the timer
	_resultTime = objNull;
	if (isServer and hasInterface) then
	{
		_resultTime = _timeOfCompletion - time;
	} else {
		_resultTime = _timeOfCompletion - (serverTime - _timeServerStarted);
	};

	if (_resultTime < 0) then
	{
		_resultTime = 0;
	};

	_timeText = [_resultTime, "MM:SS"] call BIS_fnc_secondsToString;

	//set marker time
	_marker setMarkerTextLocal format["[%1]", _timeText];
	if (ace_spectator_isset) then
	{
		_marker setMarkerTextLocal format["Terminal %1 [%2]", _objectiveIndex + 1, _timeText];
	};

	//toggle marker colour
	_previouslyHackingSide = _targetObject getVariable ['fnf_currentlyHackingSide', sideUnknown];

	if (markerColor _marker isEqualTo "ColorBlack") then
	{
		_markerColour = [_previouslyHackingSide, true] call BIS_fnc_sideColor;
		_marker setMarkerColorLocal _markerColour;
	} else {
		_marker setMarkerColorLocal "ColorBlack";
	};
};

//if status of terminal has not changed exit
if (_serverState isEqualTo 3) exitWith {};

[_task] call FNF_ClientSide_fnc_removeTaskfromTaskControl;

//get objects picture
_targetConfig = _targetObject call CBA_fnc_getObjectConfig;
_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Land_DataTerminal_01_F.jpg"] call CBA_fnc_getConfigEntry;

//start notification creation
_stringArray = [(format["<t size='1.5' align='center'>Objective %1 ", (_objectiveIndex + 1)])];

_notificationType = "info";

//set values based on a succed or fail
if (_serverState isEqualTo 4) then
{
	_task setTaskState "Succeeded";
	_stringArray pushBack "Complete";
	_notificationType = "success";
	_marker setMarkerTextLocal "(Complete) Terminal OBJ";
	_marker setMarkerColorLocal "ColorBlack";
};
if (_serverState isEqualTo 5) then
{
	_task setTaskState "Failed";
	_stringArray pushBack "Failed";
	_notificationType = "failure";
	_marker setMarkerTextLocal "(Failed) Terminal OBJ";
	_marker setMarkerColorLocal "ColorBlack";
};

if (_alliedTask) then
{
	_stringArray pushBack "<br/>(Ally Objective)";
};

_stringArray pushBack "</t><br/><br/><t align='center'>Terminal has ";

//this is irrespective of obj outcome and therefor is based on status of vic
if (not (_targetObject getVariable ['fnf_explosionHandeled', false])) then
{
	_stringArray pushBack "not been hacked in time</t><br/><br/>";
} else {
	_stringArray pushBack "been hacked</t><br/><br/>";
};

_stringArray pushBack format["<img size='6' align='center' image='%1'/>", _targetPic];

_string = _stringArray joinString "";

[_string, _notificationType, 10, 20] call FNF_ClientSide_fnc_notificationSystem;

fnf_objectives set [_objectiveIndex, [_serverState, _module, _task, _alliedTask, _codeOnCompletion, _params]];

call _codeOnCompletion;
