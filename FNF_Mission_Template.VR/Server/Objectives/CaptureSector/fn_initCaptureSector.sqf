/*
	Author: Mallen

	Description:
    init a capture sector objective including setting up server watch

	Parameter(s):
		0: OBJECT -  The capture sector objective module to be processed
    1: SIDE -  The side that the objective is assigned to

	Returns:
		None
*/

params ["_objective", "_side"];

_zonePrefix = _objective getVariable ["fnf_prefix", "FAILED"];

//if no type found exit obj settup
if (_zonePrefix isEqualTo "FAILED") exitWith {};

_syncedObjects = synchronizedObjects _objective;
_sequentialObjPlanners = [];
{
  _typeOfObject = typeOf _x;

  if (_typeOfObject isEqualTo "fnf_module_sequentialObjectivePlanner") then
  {
    _sequentialObjPlanners pushBack _x;
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

//check if zone already exists, if not create it
_result = [_zonePrefix] call FNF_ClientSide_fnc_verifyZone;
if (not _result and isDedicated) then
{
  _resultAddZone = [_zonePrefix, "", false, false] call FNF_ClientSide_fnc_addZone;
  if (not _resultAddZone) exitWith {};
};

//add objective to objective stack
fnf_serverObjectives pushBack [false, "CAPTURESECTOR", _side, _objective];
