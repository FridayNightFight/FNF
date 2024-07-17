/*
	Author: Mallen

	Description:
		watch a terminal objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		0: INTEGER -	The index of the objective to watch

	Returns:
		Boolean
*/

params ["_objectiveIndex"];

_objEntry = fnf_objectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_serverState = _module getVariable ["fnf_objServerState", 3];

_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];

//marker coping here
_timeOfCompletion = _targetObject getVariable ['fnf_currentlyHackingCompletionTime', -1];
_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];

if (_timeOfCompletion isEqualTo -1 or _timeServerStarted isEqualTo -1) then
{
	_marker setMarkerTextLocal "Terminal OBJ [Idle]";
} else {
	_resultTime = objNull;
	if (isServer and hasInterface) then
	{
		_resultTime = _timeOfCompletion - time;
	} else {
		_resultTime = _timeOfCompletion - (serverTime - _timeServerStarted);
	};
	_timeText = [_resultTime, "MM:SS"] call BIS_fnc_secondsToString;

	_marker setMarkerTextLocal format["Terminal OBJ [%1]", _timeText];

	_previouslyHackingSide = _targetObject getVariable ['fnf_previouslyHackingSide', sideUnknown];

	if (markerColor _marker isEqualTo "ColorBlack") then
	{
		_markerColour = [_previouslyHackingSide, true] call BIS_fnc_sideColor;
		_marker setMarkerColorLocal _markerColour;
	} else {
		_marker setMarkerColorLocal "ColorBlack";
	};
};

if (_serverState isEqualTo 3) exitWith {};

//programatically check if objective is secondary OBJ module and first should be watched
_isSecondaryObj = [_targetObject, _module] call FNF_ClientSide_fnc_checkSecondaryObjective;

//get objects name and picture
_targetConfig = _targetObject call CBA_fnc_getObjectConfig;
_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Land_DataTerminal_01_F.jpg"] call CBA_fnc_getConfigEntry;

_stringArray = [(format["<t size='1.5' align='center'>Objective %1 Complete", (_objectiveIndex + 1)])];

_notificationType = "info";
_marker setMarkerTextLocal "(Complete) Terminal OBJ";
_marker setMarkerColorLocal "ColorBlack";

if (_serverState isEqualTo 4) then
{
	_task setTaskState "Succeeded";
};
if (_serverState isEqualTo 5) then
{
	_task setTaskState "Failed";
};

_stringArray pushBack "</t><br/><br/><t align='center'>Terminal has ";

if (not _targetObject getVariable ['fnf_explosionHandeled', false]) then
{
	_stringArray pushBack "not been hacked in time</t><br/><br/>";
} else {
	_stringArray pushBack "been hacked</t><br/><br/>";
};

_stringArray pushBack format["<img size='6' align='center' image='%1'/>", _targetPic];

_string = _stringArray joinString "";
if (not _isSecondaryObj) then
{
	[_string, _notificationType, 10, 20] call FNF_ClientSide_fnc_notificationSystem;
};

fnf_objectives set [_objectiveIndex, [_serverState, _module, _task, _alliedTask, _codeOnCompletion, _params]];

call _codeOnCompletion;
