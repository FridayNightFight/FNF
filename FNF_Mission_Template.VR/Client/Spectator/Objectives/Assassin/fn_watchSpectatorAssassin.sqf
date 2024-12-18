/*
	Author: Mallen

	Description:
		watch an Assassin objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		1: INTEGER -	The index of the objective to watch

	Returns:
		Boolean
*/

params ["_objectiveIndex"];

_objEntry = fnf_objectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_serverState = _module getVariable ["fnf_objServerState", 3];

_params params ["_targetObject", "_hidingZonesAssigned", "_marker", "_standardTitle"];

if (_targetObject isEqualTo objNull) then
{
	_taskDescArray = taskDescription _task;
	_task setSimpleTaskDescription [_taskDescArray select 0, _standardTitle, _standardTitle];

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

		_taskDescArray = taskDescription _task;
		_task setSimpleTaskDescription [_taskDescArray select 0, _standardTitle + " (" + (name _newPlayerObject) + ")", _standardTitle + " (" + (name _newPlayerObject) + ")"];

		fnf_objectives set [_objectiveIndex, [_serverState, _module, _task, _alliedTask, _codeOnCompletion, [_newPlayerObject, _hidingZonesAssigned, _marker, _standardTitle]]];
	};
};

if (serverCommandAvailable "#kick") then
{
	if (_targetObject isEqualTo objNull) then
	{
		["<t align='center' size='1.4' color='#FFFF00'>ADMIN ATTENTION</t><t align='center'><br/><br/>Assassin objective has reported target cannot be found, please confirm whether objective is complete</t>", "deep-purple", 5] call FNF_ClientSide_fnc_notificationSystem;
	} else {
		if (not alive _targetObject) then
		{
			["<t align='center' size='1.4' color='#FFFF00'>ADMIN ATTENTION</t><t align='center'><br/><br/>Assassin objective has reported target is dead, please find target with name: " + (name _targetObject) + " and confirm his death</t>", "deep-purple", 5] call FNF_ClientSide_fnc_notificationSystem;
		};
	};
};

//if server does not say the obj is done, don't continue
if (_serverState isEqualTo 3) exitWith {};

//programatically check if objective is secondary OBJ module and first should be watched
_isSecondaryObj = [_targetObject, _module] call FNF_ClientSide_fnc_checkSecondaryObjective;

//start notification creation
_stringArray = [(format["<t size='1.5' align='center'>Objective %1 Complete", (_objectiveIndex + 1)])];

_notificationType = "info";
_marker setMarkerTextLocal "(Complete) Assassin OBJ";

//set values based on a succed or fail
if (_serverState isEqualTo 4) then
{
	_task setTaskState "Succeeded";
};
if (_serverState isEqualTo 5) then
{
	_task setTaskState "Failed";
};

_targetName = _module getVariable ["fnf_targetName", "the VIP"];
_stringArray pushBack format["</t><br/><br/><t align='center'>%1 has ", _targetName];

//this is irrespective of obj outcome and therefor is based on status of human
if (not isNull _targetObject) then
{
	if (alive _targetObject) then
	{
		_stringArray pushBack "not been assassinated in time</t><br/><br/>";
	} else {
		_stringArray pushBack "been assassinated</t><br/><br/>";
	};
} else {
	_stringArray pushBack "been assassinated</t><br/><br/>";
};

_string = _stringArray joinString "";
if (not _isSecondaryObj) then
{
	[_string, _notificationType, 10, 20] call FNF_ClientSide_fnc_notificationSystem;
};

fnf_objectives set [_objectiveIndex, [_serverState, _module, _task, _alliedTask, _codeOnCompletion, [_targetObject, _hidingZonesAssigned, _marker, _standardTitle]]];

call _codeOnCompletion;

