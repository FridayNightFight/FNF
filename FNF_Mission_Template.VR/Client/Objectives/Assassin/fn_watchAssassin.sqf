/*
	Author: Mallen

	Description:
		watch a destroy objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		1: ARRAY - Array that objective is stored in

	Returns:
		Boolean
*/

params["_objEntry"];

_objEntry params["_objType","_objectiveModule","_hidingZones", "_task", "_forPlayer"];

_objComplete = _objectiveModule getVariable ["fnf_objComplete", false];

_targetName = _objectiveModule getVariable ["fnf_targetName", "Unknown Name"];
_desc = taskDescription _task;
_splitString = (_desc select 1) splitString " ";
_objNumWithColon = _splitString select 0;
_objNum = (_objNumWithColon splitString "") select 0;

if (_objComplete) exitWith
{
	_taskType = taskType _task;
	if (_taskType isEqualTo "kill") then
	{
		_task setTaskState "Succeeded";
		if (_forPlayer) then
		{
			["<t size='1.5' align='center'>Objective " + _objNum + " Complete</t><br/><br/><t align='center'>" + _targetName + " has been eliminated</t>", "success", 10] call FNF_ClientSide_fnc_notificationSystem;
		} else {
			["<t size='1.5' align='center'>Objective " + _objNum + " Complete<br/>(Ally Objective)</t><br/><br/><t align='center'>" + _targetName + " has been eliminated</t>", "success", 10] call FNF_ClientSide_fnc_notificationSystem;
		};
	} else {
		_task setTaskState "Failed";
		if (_forPlayer) then
		{
			["<t size='1.5' align='center'>Objective " + _objNum + " Failed</t><br/><br/><t align='center'>" + _targetName + " has been eliminated</t>", "failure", 10] call FNF_ClientSide_fnc_notificationSystem;
		} else {
			["<t size='1.5' align='center'>Objective " + _objNum + " Failed<br/>(Ally Objective)</t><br/><br/><t align='center'>" + _targetName + " has been eliminated</t>", "failure", 10] call FNF_ClientSide_fnc_notificationSystem;
		};
	};

	[_task] call FNF_ClientSide_fnc_removeTaskfromTaskControl;

	true;
};

_syncedObjects = synchronizedObjects _objectiveModule;

//find the target thats supposed to be killed or protected
_playerObject = objNull;
{
	if (isPlayer _x) then
	{
		_playerObject = _x;
	};
} forEach _syncedObjects;

[_task] call FNF_ClientSide_fnc_removeObjectToHide;

_description = ((taskDescription _task) select 0);
_objType = taskType _task;

if (not isNull _playerObject) then
{
	if (count _hidingZones isNotEqualTo 0) then
	{
		_zoneKnown = _objectiveModule getVariable ["fnf_zoneKnown", true];
		[_playerObject, _task, _zoneKnown, _hidingZones] call FNF_ClientSide_fnc_addObjectToHide;
	} else {
		_task setSimpleTaskTarget [_playerObject, true];
	};

	_actualName = name _playerObject;

	if (_objType isEqualTo "kill") then
	{
		_task setSimpleTaskDescription [_description, _objNum + ": Eliminate " + _targetName + " (" + _actualName + ")", _objNum + ": Eliminate " + _targetName + " (" + _actualName + ")"];
	} else {
		_task setSimpleTaskDescription [_description, _objNum + ": Defend " + _targetName + " (" + _actualName + ")", _objNum + ": Defend " + _targetName + " (" + _actualName + ")"];
	};
} else {
	cancelSimpleTaskDestination _task;
	if (_objType isEqualTo "kill") then
	{
		_task setSimpleTaskDescription [_description, _objNum + ": Eliminate " + _targetName, _objNum + ": Eliminate " + _targetName];
	} else {
		_task setSimpleTaskDescription [_description, _objNum + ": Defend " + _targetName, _objNum + ": Defend " + _targetName];
	};
};

