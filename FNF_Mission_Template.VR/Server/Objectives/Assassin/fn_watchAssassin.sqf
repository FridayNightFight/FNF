/*
	Author: Mallen

	Description:
		watch a assassin objective server side

	Parameter(s):
		0: INTEGER -	The index of the objective to watch

	Returns:
		Boolean
*/

params ["_objectiveIndex"];

_objEntry = fnf_serverObjectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_serverState = _module getVariable ["fnf_objServerState", 3];

_params params ["_targetObject"];

if (_targetObject isEqualTo objNull) then
{
	_newPlayerObject = objNull;

	//get relevant objects synced to module
	_syncedObjects = synchronizedObjects _module;
	{
		_typeOfObject = typeOf _x;
		if (_typeOfObject isEqualTo "SideBLUFOR_F" or _typeOfObject isEqualTo "SideOPFOR_F" or _typeOfObject isEqualTo "SideResistance_F" or _typeOfObject isEqualTo "fnf_module_hidingZone" or _typeOfObject isEqualTo "fnf_module_sequentialObjectivePlanner") then
		{
			continue;
		};

		if (_x isKindOf "Man" and isNull _newPlayerObject) then
		{
			_newPlayerObject = _x;
		}
	} forEach _syncedObjects;

	if (not isNull _newPlayerObject) then
	{
		_targetObject = _newPlayerObject;

		fnf_serverObjectives set [_objectiveIndex, [_serverState, _module, _task, _alliedTask, _codeOnCompletion, [_newPlayerObject]]];
	};
};

//if server does not say the obj is done, don't continue
if (_serverState isEqualTo 3) exitWith {};

fnf_serverObjectives set [_objectiveIndex, [_serverState, _module, _task, _alliedTask, _codeOnCompletion, [_targetObject]]];

call _codeOnCompletion;

