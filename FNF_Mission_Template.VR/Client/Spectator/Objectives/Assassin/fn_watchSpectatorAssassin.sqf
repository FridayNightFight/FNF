/*
	Author: Mallen

	Description:
		watch a destroy objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		1: ARRAY - Array that objective is stored in

	Returns:
		Boolean
*/

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

_objEntry params["_objType","_objectiveModule","_dupeLogicCheck", "_objNum", "_task"];

_objComplete = _objectiveModule getVariable ["fnf_objComplete", false];

if (_objComplete) exitWith
{
	_targetName = _objectiveModule getVariable ["fnf_targetName", "Unknown Name"];

	["<t size='1.5' align='center'>Objective " + _objNum + " Complete</t><br/><br/><t align='center'>" + _targetName + " has been eliminated</t>", "success", 10] call FNF_ClientSide_fnc_notificationSystem;

	true;
};

if (_objType isEqualTo "ASSASSINDUPE") exitWith {false;};

_syncedObjects = synchronizedObjects _objectiveModule;

//find the target thats supposed to be killed or protected
_playerObject = objNull;
{
	if (isPlayer _x) then
	{
		_playerObject = _x;
	};
} forEach _syncedObjects;

_description = ((taskDescription _task) select 0);
_objType = taskType _task;

if (not isNull _playerObject) then
{
	_marker = ("assassin_obj_marker_" + _objNum);
	createMarkerLocal [_marker, _playerObject];
	_marker setMarkerPosLocal _playerObject;
	_marker setMarkerTypeLocal "mil_objective";
	_marker setMarkerTextLocal "Assassin " + _objNum;
} else {
	_marker = ("assassin_obj_marker_" + _objNum);
	deleteMarkerLocal _marker;
};

false;
