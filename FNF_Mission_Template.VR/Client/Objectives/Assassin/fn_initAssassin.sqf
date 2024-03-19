/*
	Author: Mallen

	Description:
    init a assassin objective including setting up local watch, local task control, local ordering enforcement, and breifing data

	Parameter(s):
		0: OBJECT -  The assassin objective module to be processed
    1: BOOLEAN -  Whether the objective is for the player, if not treat breifing and task control differently

	Returns:
		None
*/

params ["_objective", "_forPlayer"];

//get the objective type
_objectiveType = _objective getVariable ["fnf_objectiveType", "FAILED"];

//if no type found exit obj settup and inform mission maker
if (_objectiveType isEqualTo "FAILED") exitWith
{
  if (fnf_debug) then
  {
    systemChat "DANGER: Assassin objective does not have objective type set, objective will NOT function";
  };
};

_syncedObjects = synchronizedObjects _objective;

//find the target thats supposed to be killed or protected
_hidingZones = [];
_sequentialObjPlanners = [];
_playerObject = objNull;
{
  _typeOfObject = typeOf _x;
  if (_typeOfObject isEqualTo "SideBLUFOR_F" or _typeOfObject isEqualTo "SideOPFOR_F" or _typeOfObject isEqualTo "SideResistance_F" or _typeOfObject isEqualTo "Logic") then
  {
    continue;
  };

  if (_typeOfObject isEqualTo "fnf_module_hidingZone") then
  {
    _hidingZones pushBack _x;
    continue;
  };

  if (_typeOfObject isEqualTo "fnf_module_sequentialObjectivePlanner") then
  {
    _sequentialObjPlanners pushBack _x;
    continue;
  };

  if (isPlayer _x) then
  {
    _playerObject = _x;
    continue;
  };

  if (fnf_debug) then
  {
    systemChat "WARNING: Assassin objective has an object that is not a hiding zone, side, or player synced to it, objective will still function";
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

if (_topRightCount > 1) exitWith
{
  if (fnf_debug) then
  {
    systemChat "DANGER: Assassin objective has more than one prerequisite sequential planners, objective will NOT function";
  };
};

_sequentialInit = false;
_addSequentialHandle = false;

if (not isNull _topRightCandidate) then
{
  //check if we're initing this from the sequential planner, if we are we don't need to re-add it
  _alreadyCompletedSequentialPlanning = _topRightCandidate getVariable ["fnf_sequentialObjCompleted", false];
  if (_alreadyCompletedSequentialPlanning) then
  {
    _objKnown = _topRightCandidate getVariable ["fnf_nextObjectiveKnown", false];
    if (_objKnown) then
    {
      //obj is already known and 90% of setup is completed, lets just handle task description and task control
      //find correct task via fnf_objectives
      //edit Task Control
      //edit task description
      //this task can be completed before available as i dont wanna make someone invincible, maybe remove tracking?
    };
  } else {
    //sequential planner before we do stuff, lets figure out what needs doing....
    _objKnown = _topRightCandidate getVariable ["fnf_nextObjectiveKnown", false];
    if (not _objKnown) then
    {
      //obj is not known yet, lets exit Init and come back later
      _addSequentialHandle = true;
    };
  };
};

if (_addSequentialHandle) exitWith
{
  [_objective, _forPlayer, _topRightCandidate] call FNF_ClientSide_fnc_addSequentialHandle;
};

//this task is impossible to throw debug error if module is synced to multiple people due to how things are handeled :(

_objectiveObject = _objective;

if (not isNull _playerObject) then
{
  _objectiveObject = _playerObject;
};

//if parent task for my tasks doesnt exist create it
if (isNil "fnf_myTasksParentTask") then
{
  fnf_myTasksParentTask = player createSimpleTask ["My Tasks"];
  fnf_myTasksParentTask setSimpleTaskType "documents";
};

//if parent task for ally tasks doesnt exist and its needed create it
if (isNil "fnf_allyTasksParentTask" and not _forPlayer) then
{
  fnf_allyTasksParentTask = player createSimpleTask ["Ally Tasks"];
  fnf_allyTasksParentTask setSimpleTaskType "documents";
};

_task = "";

_targetName = _objective getVariable ["fnf_targetName", "Unknown Name"];

_objNum = str((count fnf_objectives) + 1);

//create and setup objective task
if (_objectiveType isEqualTo "elm") then
{
  if (_forPlayer) then
  {
    _task = player createSimpleTask [(_objNum + ": Eliminate " + _targetName), fnf_myTasksParentTask];
  } else {
    _task = player createSimpleTask [(_objNum + ": Eliminate " + _targetName), fnf_allyTasksParentTask];
  };
  _zoneKnown = _objective getVariable ["fnf_zoneKnown", true];

  if (_forPlayer) then
  {
    _helperString = "The location of the objective is marked on your map, or you can find it by hitting the 'Locate' button above";

    if (count _hidingZones isNotEqualTo 0) then
    {
      _helperString = "The location of the objective may be in a hiding zone, if it is, the zone it is hidden is marked on your map, if it isn't, the objectives exact location is marked instead, in either case you can find it by hitting the 'Locate' button above";
      if (not _zoneKnown) then
      {
        _helperString = "The location of the objective may be in a hiding zone, if it is, you will have to search all hiding zones to find the objective, if it isn't, the objectives exact location is marked on your map, or you can find it by hitting the 'Locate' button above";
      };
    };

    _task setSimpleTaskDescription [format["<t>To complete this objective you must eliminate %1<br/><br/>%2</t>", _targetName, _helperString], _objNum + ": Eliminate " + _targetName, _objNum + ": Eliminate " + _targetName];
  } else {
    _helperString = "The location of the objective is marked on your map, or you can find it by hitting the 'Locate' button above";

    if (count _hidingZones isNotEqualTo 0) then
    {
      _helperString = "The location of the objective may be in a hiding zone, if it is, the zone it is hidden is marked on your map, if it isn't, the objectives exact location is marked instead, in either case you can find it by hitting the 'Locate' button above";
      if (not _zoneKnown) then
      {
        _helperString = "The location of the objective may be in a hiding zone, if it is, you will have to search all hiding zones to find the objective, if it isn't, the objectives exact location is marked on your map, or you can find it by hitting the 'Locate' button above";
      };
    };

    _task setSimpleTaskDescription [format["<t>For your allies to complete this objective they must eliminate %1<br/><br/>%2</t>", _targetName, _helperString], _objNum + ": Eliminate " + _targetName, _objNum + ": Eliminate " + _targetName];
  };

  _task setSimpleTaskType "kill";
  if (count _hidingZones isEqualTo 0) then
  {
    _task setSimpleTaskTarget [_objectiveObject, true];
  } else {
    [_objectiveObject, _task, _zoneKnown, _hidingZones] call FNF_ClientSide_fnc_addObjectToHide;
  };
} else {
  if (_forPlayer) then
  {
    _task = player createSimpleTask [(_objNum + ": Defend " + _targetName), fnf_myTasksParentTask];
  } else {
    _task = player createSimpleTask [(_objNum + ": Defend " + _targetName), fnf_allyTasksParentTask];
  };
  _task setSimpleTaskType "defend";
  _task setSimpleTaskTarget [_objectiveObject, true];

  _helperString = "";

  if (count _hidingZones isNotEqualTo 0) then
  {
    {
      _prefix = _x getVariable ["fnf_prefix", "FAILED"];

      if (_prefix isEqualTo "FAILED") then
      {
        if (fnf_debug) then
        {
          systemChat "WARNING: Hiding zone does not have a valid zone prefix and will not function";
        };
        continue;
      };

      _result = [_prefix] call FNF_ClientSide_fnc_verifyZone;
      if (not _result) then
      {
        [_prefix, "", true, false] call FNF_ClientSide_fnc_addZone;
      };
    } forEach _hidingZones;

    _helperString = "<br/><br/>The objective can be hidden in the hiding zones provided";
  };
  if (_forPlayer) then
  {
    _task setSimpleTaskDescription [format["<t>To complete this objective you must prevent %1 from being eliminated for the duration of the game%2</t>", _targetName, _helperString], _objNum + ": Defend " + _targetName, _objNum + ": Defend " + _targetName];
  } else {
    _task setSimpleTaskDescription [format["<t>For your allies to complete this objective they must prevent %1 from being eliminated for the duration of the game%2</t>", _targetName, _helperString], _objNum + ": Defend " + _targetName, _objNum + ": Defend " + _targetName];
  };
};

[_task, true] call FNF_ClientSide_fnc_addTaskToTaskControl;

//add objective to objective stack
fnf_objectives pushBack ["ASSASSIN", _objective, _hidingZones, _task, _forPlayer];
