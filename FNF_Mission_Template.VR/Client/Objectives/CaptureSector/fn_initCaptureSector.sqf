/*
	Author: Mallen

	Description:
    init a capture sector objective including setting up local watch, local task control, local ordering enforcement, and breifing data

	Parameter(s):
		0: OBJECT -  The capture sector objective module to be processed
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
    systemChat "DANGER: Capture Sector objective does not have objective type set, objective will NOT function";
  };
};

_syncedObjects = synchronizedObjects _objective;

//find any sequential planners
_sequentialObjPlanners = [];
{
  _typeOfObject = typeOf _x;
  if (_typeOfObject isEqualTo "SideBLUFOR_F" or _typeOfObject isEqualTo "SideOPFOR_F" or _typeOfObject isEqualTo "SideResistance_F") then
  {
    continue;
  };

  if (_typeOfObject isEqualTo "fnf_module_sequentialObjectivePlanner") then
  {
    _sequentialObjPlanners pushBack _x;
    continue;
  };

  if (fnf_debug) then
  {
    systemChat "WARNING: Capture Sector objective has something that is not a Sequential Objective Planner synced to it";
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
    systemChat "DANGER: Capture Sector objective has more than one prerequisite sequential planners, objective will NOT function";
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

_zonePrefix = _objective getVariable ["fnf_prefix", "FAILED"];

//if no type found exit obj settup and inform mission maker
if (_zonePrefix isEqualTo "FAILED") exitWith
{
  if (fnf_debug) then
  {
    systemChat "DANGER: Capture Sector objective does not have marker prefix set, objective will NOT function";
  };
};

//get objective number
_objNum = str((count fnf_objectives) + 1);

//get sector number
_secNum = _objNum;

//check if zone already exists, if not create it
_result = [_zonePrefix] call FNF_ClientSide_fnc_verifyZone;
if (not _result) then
{
  _resultAddZone = [_zonePrefix, "Sector " + _secNum, true, false] call FNF_ClientSide_fnc_addZone;
  if (not _resultAddZone) exitWith
  {
    if (fnf_debug) then
    {
      systemChat "DANGER: Capture Sector objective zone failed to be initialised, objective will NOT function";
    };
  };
} else {
  _displayName = [_zonePrefix] call FNF_ClientSide_fnc_getDisplayName;
  _displayNameArray = _displayName splitString " ";
  _secNum = _displayNameArray select 1;
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

_taskPos = [_zonePrefix] call FNF_ClientSide_fnc_getVisualCenter;

_task = "";

_colour = [playerSide, false] call BIS_fnc_sideColor;

//create and setup objective task
if (_objectiveType isEqualTo "cap") then
{
  if (_forPlayer) then
  {
    _task = player createSimpleTask [(_objNum + ": Capture Sector " + _secNum), fnf_myTasksParentTask];
    _task setSimpleTaskDescription ["To complete this objective you must have more players on yours or your allies sides than any enemies to capture the sector", _objNum + ": Capture sector " + _secNum, _objNum + ": Capture sector " + _secNum];
  } else {
    _task = player createSimpleTask [(_objNum + ": Capture Sector " + _secNum), fnf_allyTasksParentTask];
    _task setSimpleTaskDescription ["For your allies to complete this objective they must have more players on their or their allies sides than any enemies to capture the sector", _objNum + ": Capture sector " + _secNum, _objNum + ": Capture sector " + _secNum];
  };

  _colour = [sideUnknown, false] call BIS_fnc_sideColor;

  _task setSimpleTaskType "meet";
  _task setSimpleTaskDestination _taskPos;
} else {
  if (_forPlayer) then
  {
    _task = player createSimpleTask [(_objNum + ": Defend Sector " + _secNum), fnf_myTasksParentTask];
    _task setSimpleTaskDescription ["To complete this objective you must have more players on yours or your allies sides than any enemies to defend the sector", _objNum + ": Defend sector " + _secNum, _objNum + ": Defend sector " + _secNum];
  } else {
    _task = player createSimpleTask [(_objNum + ": Defend Sector " + _secNum), fnf_allyTasksParentTask];
    _task setSimpleTaskDescription ["For your allies to complete this objective they must have more players on their or their allies sides than any enemies to defend the sector", _objNum + ": Defend sector " + _secNum, _objNum + ": Defend sector " + _secNum];
  };
  _task setSimpleTaskType "defend";
  _task setSimpleTaskDestination _taskPos;
};

//setup right side graphic for a sector being captured
_text = format ["<t align='center' size='1.25' font='PuristaBold' color='#FFFFFF' shadow='2'>%1</t>", _secNum];

_texture = "\A3\ui_f\data\map\markers\nato\n_installation.paa";

_statusSlotID = [-1, _text, _texture, _colour, 1, _taskPos, 0] call BIS_fnc_setMissionStatusSlot;

[_task, true] call FNF_ClientSide_fnc_addTaskToTaskControl;

//add objective to objective stack
fnf_objectives pushBack ["CAPTURESECTOR", _objective, _task, _forPlayer, _statusSlotID];
