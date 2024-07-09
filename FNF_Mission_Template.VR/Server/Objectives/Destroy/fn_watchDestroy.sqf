/*
	Author: Mallen

	Description:
		watch a destroy objective server side

	Parameter(s):
		1: INTEGER -	The index of the objective to watch

	Returns:
		Boolean
*/

params ["_objectiveIndex"];

_objEntry = fnf_serverObjectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_objType = _module getVariable ["fnf_objectiveType", "des"];

_params params ["_targetObject", "_marker"];
_markerPos = getMarkerPos _marker;
_targetPos = getPos _targetObject;

if (_markerPos distance2D _targetPos > 1) then
{
	_marker setMarkerPosLocal _targetPos;
};

if (alive _targetObject) exitWith {};

_marker setMarkerTextLocal "(Complete) Destroy OBJ";

_newObjState = 5;
if (_objType isEqualTo "des") then
{
	_newObjState = 4;
};

_module setVariable ["fnf_objServerState", _newObjState, true];

fnf_serverObjectives set [_objectiveIndex, [_newObjState, _module, _task, _alliedTask, _codeOnCompletion, _params]];

call _codeOnCompletion;
