/*
	Author: Mallen

	Description:
		watch a escort objective server side

	Parameter(s):
		0: INTEGER -	The index of the objective to watch

	Returns:
		Boolean
*/

params ["_objectiveIndex"];

_objEntry = fnf_serverObjectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_objType = _module getVariable ["fnf_objectiveType", "stl"];

_params params ["_targetObject", "_zonePrefix"];

if (alive _targetObject) then
{

	//if object is not in zone don't care about it, reset timer
	if (not ([_targetObject, _zonePrefix] call FNF_ClientSide_fnc_isObjectInZone)) exitWith { _module setVariable ["fnf_objTimeInZone", 0, false]; };

	_timeInZone = _module getVariable ["fnf_objTimeInZone", 0];

	//if timer is not at 5 seconds dont end objective
	if (_timeInZone < 5) exitWith { _module setVariable ["fnf_objTimeInZone", (_timeInZone + 1), false]; };

	_newObjState = 5;
	if (_objType isEqualTo "des") then
	{
		_newObjState = 4;
	};
} else {
	_newObjState = 4;
	if (_objType isEqualTo "des") then
	{
		_newObjState = 5;
	};
};

_module setVariable ["fnf_objServerState", _newObjState, true];

fnf_serverObjectives set [_objectiveIndex, [_newObjState, _module, _task, _alliedTask, _codeOnCompletion, _params]];

call _codeOnCompletion;
