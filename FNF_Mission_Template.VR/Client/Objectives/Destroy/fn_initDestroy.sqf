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
_hidingZones = [];
_objectiveObject = "";
{
  _typeOfObject = typeOf _x;
  if (_typeOfObject == "SideBLUFOR_F" or _typeOfObject == "SideOPFOR_F" or _typeOfObject == "SideResistance_F") then
  {
    continue;
  };

  if (_typeOfObject == "fnf_module_hidingZone") then
  {
    _hidingZones pushBack _x;
    continue;
  };

  if (_objectiveObject isEqualTo "") then
  {
    _objectiveObject = _x;
  } else {
    if (fnf_debug) then
    {
      systemChat "WARNING: Destroy objective has more than one possible objects as target";
    };
  };
} forEach _syncedObjects;

//check if there is an object to do anything with
if (_objectiveObject isEqualTo "") exitWith
{
  if (fnf_debug) then
  {
    systemChat "DANGER: Destroy objective does not have object synced, objective will NOT function"
  };
};

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

_objNum = str((count fnf_objectives) + 1);

//create and setup objective task
if (_objectiveType == "des") then
{
  if (_forPlayer) then
  {
    _task = player createSimpleTask [(_objNum + ": Destroy the " + _targetName), fnf_myTasksParentTask];
  } else {
    _task = player createSimpleTask [(_objNum + ": Destroy the " + _targetName), fnf_allyTasksParentTask];
  };
  _zoneKnown = _objective getVariable "fnf_zoneKnown";

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

    _task setSimpleTaskDescription [format["<img image='%1' width='300'><br/><br/><t>To complete this objective you must destroy the %2<br/><br/>%3", _targetPic, _targetName, _helperString], _objNum + ": Destroy the " + _targetName, _objNum + ": Destroy the " + _targetName];
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

    _task setSimpleTaskDescription [format["<img image='%1' width='300'><br/><br/><t>For your allies to complete this objective they must destroy the %2<br/><br/>%3", _targetPic, _targetName, _helperString], _objNum + ": Destroy the " + _targetName, _objNum + ": Destroy the " + _targetName];
  };

  _task setSimpleTaskType "destroy";
  if (count _hidingZones == 0) then
  {
    _task setSimpleTaskTarget [_objectiveObject, true];
  } else {
    [_objectiveObject, _task, _zoneKnown, _hidingZones] call FNF_ClientSide_fnc_addObjectToHide;
  };
} else {
  if (_forPlayer) then
  {
    _task = player createSimpleTask [(_objNum + ": Defend the " + _targetName), fnf_myTasksParentTask];
  } else {
    _task = player createSimpleTask [(_objNum + ": Defend the " + _targetName), fnf_allyTasksParentTask];
  };
  _task setSimpleTaskType "defend";
  _task setSimpleTaskTarget [_objectiveObject, true];

  _helperString = "";

  if (count _hidingZones != 0) then
  {
    {
      _prefix = _x getVariable "fnf_prefix";
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
    _task setSimpleTaskDescription [format["<img image='%1' width='300'><br/><br/><t>To complete this objective you must prevent the %2 from being destroyed for the duration of the game%3", _targetPic, _targetName, _helperString], _objNum + ": Defend the " + _targetName, _objNum + ": Defend the " + _targetName];
  } else {
    _task setSimpleTaskDescription [format["<img image='%1' width='300'><br/><br/><t>For your allies to complete this objective they must prevent the %2 from being destroyed for the duration of the game%3", _targetPic, _targetName, _helperString], _objNum + ": Defend the " + _targetName, _objNum + ": Defend the " + _targetName];
  };
};

//add objective to objective stack
// [type, objective, objectiveObject, task, for Player?]
fnf_objectives pushBack ["DESTROY", _objective, _objectiveObject, _task, _forPlayer];
