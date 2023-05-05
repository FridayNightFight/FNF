/*
	Author: Mallen

	Description:
    init a destroy objective including setting up local watch, local task control, local ordering enforcement, and breifing data

	Parameter(s):
		0: OBJECT -  The destroy objective module to be processed
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
    systemChat "DANGER: Destroy objective does not have objective type set, objective will NOT function"
  };
};

_syncedObjects = synchronizedObjects _objective;

//find the object thats supposed to be killed or protected
_objectiveObject = "";
{
  _typeOfObject = typeOf _x;
  if (_typeOfObject == "SideBLUFOR_F" or _typeOfObject == "SideOPFOR_F" or _typeOfObject == "SideResistance_F") then
  {
    continue;
  };
  if (_objectiveObject == "") then
  {
    _objectiveObject = _x;
  } else {
    if (fnf_debug) then
    {
      systemChat "WARNING: Destroy objective has more than one possible objects as target";
    };
  };
} forEach _syncedObjects;

//get objects name and picture
_targetConfig = _objectiveObject call CBA_fnc_getObjectConfig;
_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;
_targetName = getText (_targetConfig >> "DisplayName");

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

//create and setup objective task
if (_objectiveType == "des") then
{
  if (_forPlayer) then
  {
    _task = player createSimpleTask [("Destroy the " + _targetName), fnf_myTasksParentTask];
  } else {
    _task = player createSimpleTask [("Destroy the " + _targetName), fnf_allyTasksParentTask];
  };
  _task setSimpleTaskDescription [format["<img image='%1' width='300'>", _targetPic], "Destroy the " + _targetName, "Destroy the " + _targetName];
  _task setSimpleTaskType "destroy";
} else {
  if (_forPlayer) then
  {
    _task = player createSimpleTask [("Defend the " + _targetName), fnf_myTasksParentTask];
  } else {
    _task = player createSimpleTask [("Defend the " + _targetName), fnf_allyTasksParentTask];
  };
  _task setSimpleTaskDescription [format["<img image='%1' width='300'>", _targetPic], "Defend the " + _targetName, "Defend the " + _targetName];
  _task setSimpleTaskType "defend";
  _task setSimpleTaskDestination (getpos _objectiveObject);
};

//add objective to objective stack
// [type, objective, task]
fnf_objectives pushBack ["DESTROY", _objective, _objectiveObject, _task];
