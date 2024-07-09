/*
	Author: Mallen

	Description:
		Checks whether an objective is a sequential objective and if it is adds it to the queue to be checked

	Parameter(s):
		0: OBJECT -		The objective module
		1: INTEGER -	The objective index
		2: ARRAY -		The sequential objective planner modules

	Returns:
		None
*/

params ["_module", "_objectiveIndex", "_sequentialPlannersAssigned"];

if (isNil "fnf_seqObjHandelerQueueServer") then
{
	call FNF_ServerSide_fnc_initSequentialHandler;
};

_preRequisitePlanners = [];

{
	if ([_x, _module] call FNF_ClientSide_fnc_getBottomLeft) then
	{
		_preRequisitePlanners pushBack _x;
	};
} forEach _sequentialPlannersAssigned;

if (count _preRequisitePlanners isEqualTo 0) exitWith
{
	//tells init to continue as if it wasn't there
	[3,[]];
};

_objKnown = false;

_preRequisiteModules = [];
{
	_plannerModule = _x;
	_syncedObjects = synchronizedObjects _plannerModule;
	{
		if ([_x, _plannerModule] call FNF_ClientSide_fnc_getBottomLeft) then
		{
			_preRequisiteModules pushBackUnique _x;
		};
	} forEach _syncedObjects;

	if (not _objKnown) then
	{
		_objKnown = _plannerModule getVariable ["fnf_nextObjectiveKnown", false];
	};
} forEach _preRequisitePlanners;

_preRequisiteIndexs = [];
{
	_preRequisiteModule = _x;
	_index = fnf_serverObjectives findIf {_preRequisiteModule isEqualTo (_x select 1)};
	if (_index isNotEqualTo -1) then
	{
		_preRequisiteIndexs pushBack _index;
	};
} forEach _preRequisiteModules;

_statetoSend = 1;
if (_objKnown) then
{
	_statetoSend = 2;
};

_queueIndex = fnf_seqObjHandelerQueueServer findIf {_x select 0 isEqualTo _preRequisiteIndexs};

if (_queueIndex isEqualTo -1) then
{
	fnf_seqObjHandelerQueueServer pushBack [_preRequisiteIndexs, [_objectiveIndex]];
} else {
	fnf_seqObjHandelerQueueServer select _queueIndex select 1 pushBack _objectiveIndex;
};

[_statetoSend, _preRequisiteIndexs];
