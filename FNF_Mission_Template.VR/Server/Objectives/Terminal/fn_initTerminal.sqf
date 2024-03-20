/*
	Author: Mallen

	Description:
    init a terminal objective including setting up server watch

	Parameter(s):
		0: OBJECT -  The terminal objective module to be processed
    1: SIDE -  The side that the objective is assigned to

	Returns:
		None
*/

params ["_objective", "_side"];

_syncedObjects = synchronizedObjects _objective;

//find the object thats supposed to be hacked
_sequentialObjPlanners = [];
_objectiveObject = "";
{
  _typeOfObject = typeOf _x;
  if (_typeOfObject isEqualTo "SideBLUFOR_F" or _typeOfObject isEqualTo "SideOPFOR_F" or _typeOfObject isEqualTo "SideResistance_F" or _typeOfObject isEqualTo "fnf_module_hidingZone") then
  {
    continue;
  };

  if (_typeOfObject isEqualTo "fnf_module_sequentialObjectivePlanner") then
  {
    _sequentialObjPlanners pushBack _x;
    continue;
  };

  if (_objectiveObject isEqualTo "") then
  {
    _objectiveObject = _x;
  };
} forEach _syncedObjects;

_topRightCount = 0;
_topRightCandidate = objNull;

if (count _sequentialObjPlanners isNotEqualTo 0) then
{
  {
    _result = [_objective, _x] call FNF_ClientSide_fnc_getBottomLeft;
    if (not _result) then
    {
      _topRightCount = _topRightCount + 1;
      _topRightCandidate = _x;
    };
  } forEach _sequentialObjPlanners;
};

if (_topRightCount > 1) exitWith {};

_sequentialInit = false;
_addSequentialHandle = false;

if (not isNull _topRightCandidate) then
{
  //check if we're initing this from the sequential planner, if we are we don't need to re-add it
  _alreadyCompletedSequentialPlanning = _topRightCandidate getVariable ["fnf_sequentialObjCompleted", false];
  if (not _alreadyCompletedSequentialPlanning) then
  {
    _addSequentialHandle = true;
  };
};

if (_addSequentialHandle) exitWith
{
  [_objective, _side, _topRightCandidate] call FNF_ServerSide_fnc_addSequentialHandle;
};


//check if there is an object to do anything with
if (_objectiveObject isEqualTo "") exitWith {};

//add objective to objective stack
// [type, objective, task]
fnf_serverObjectives pushBack [false, "TERMINAL", _side, _objective, _objectiveObject];
