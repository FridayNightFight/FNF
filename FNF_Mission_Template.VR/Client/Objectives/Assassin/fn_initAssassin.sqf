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
if (_objectiveType == "FAILED") exitWith
{
  if (fnf_debug) then
  {
    systemChat "DANGER: Assassin objective does not have objective type set, objective will NOT function";
  };
};

_syncedObjects = synchronizedObjects _objective;

//find the target thats supposed to be killed or protected
_hidingZones = [];
_playerObject = objNull;
{
  _typeOfObject = typeOf _x;
  if (_typeOfObject == "SideBLUFOR_F" or _typeOfObject == "SideOPFOR_F" or _typeOfObject == "SideResistance_F" or _typeOfObject == "Logic") then
  {
    continue;
  };

  if (_typeOfObject == "fnf_module_hidingZone") then
  {
    _hidingZones pushBack _x;
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
if (_objectiveType == "elm") then
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

    if (count _hidingZones != 0) then
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

    if (count _hidingZones != 0) then
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
  if (count _hidingZones == 0) then
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

  if (count _hidingZones != 0) then
  {
    {
      _prefix = _x getVariable ["fnf_prefix", "FAILED"];

      if (_prefix == "FAILED") then
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

//add objective to objective stack
fnf_objectives pushBack ["ASSASSIN", _objective, _hidingZones, _task, _forPlayer];
