/*
	Author: Mallen

	Description:
    init a destroy objective for spectators

	Parameter(s):
		0: OBJECT -  The destroy objective module to be processed

	Returns:
		None
*/

params ["_objective","_side"];

//get the objective type
_objectiveType = _objective getVariable ["fnf_objectiveType", "FAILED"];

//if no type found exit obj settup and inform mission maker
if (_objectiveType == "FAILED") exitWith
{
  if (fnf_debug) then
  {
    systemChat "DANGER: Destroy objective does not have objective type set, objective will NOT function";
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
    systemChat "DANGER: Destroy objective does not have object synced, objective will NOT function";
  };
};

_objNum = str(({_x select 0 != "DESTROYDUPE" and _x select 0 != "CAPTURESECTORDUPE" and _x select 0 != "TERMINALDUPE"} count fnf_objectives) + 1);

//check if OBJ is a dupe, if so inform code and update OBJ number
_isObjDuplicate = false;
{
  if (_x select 0 == "DESTROY") then
  {
    if  (_x select 2 isEqualTo _objectiveObject) then
    {
      _isObjDuplicate = true;
      _objNum = _x select 3;
    };
  };
} forEach fnf_objectives;

//get objects name and picture
_targetConfig = _objectiveObject call CBA_fnc_getObjectConfig;
_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;
_targetName = getText (_targetConfig >> "DisplayName");

//setup hiding zones if they are wanted
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
};

_task = "";

//create and setup objective task
if (_objectiveType == "des") then
{
  _task = player createSimpleTask [(_objNum + ": Destroy the " + _targetName)];
  _zoneKnown = _objective getVariable ["fnf_zoneKnown", true];

  _helperString = "The location of the objective is marked on " + ([_side] call BIS_fnc_sideName) + "s map";

  if (count _hidingZones != 0) then
  {
    _helperString = "The location of the objective may be in a hiding zone, if it is, the zone it is hidden is marked on " + ([_side] call BIS_fnc_sideName) + "s map, if it isn't, the objectives exact location is marked instead";
    if (not _zoneKnown) then
    {
      _helperString = "The location of the objective may be in a hiding zone, if it is, " + ([_side] call BIS_fnc_sideName) + " will have to search all hiding zones to find the objective, if it isn't, the objectives exact location is marked on " + ([_side] call BIS_fnc_sideName) + "s map";
    };
  };

  _task setSimpleTaskDescription [format["<img width='300' image='%1'/><br/><br/><t>To complete this objective " + ([_side] call BIS_fnc_sideName) + " must destroy the %2<br/><br/>%3</t>", _targetPic, _targetName, _helperString], _objNum + ": Destroy the " + _targetName, _objNum + ": Destroy the " + _targetName];


  _task setSimpleTaskType "destroy";
  _task setSimpleTaskTarget [_objectiveObject, true];

} else {

  _task = player createSimpleTask [(_objNum + ": Defend the " + _targetName)];

  _task setSimpleTaskType "defend";
  _task setSimpleTaskTarget [_objectiveObject, true];

  _helperString = "";

  if (count _hidingZones != 0) then
  {
    _helperString = "<br/><br/>The objective can be hidden in the hiding zones provided";
  };

  _task setSimpleTaskDescription [format["<img width='300' image='%1'/><br/><br/><t>To complete this objective " + ([_side] call BIS_fnc_sideName) + " must prevent the %2 from being destroyed for the duration of the game%3</t>", _targetPic, _targetName, _helperString], _objNum + ": Defend the " + _targetName, _objNum + ": Defend the " + _targetName];

};

//add objective to objective stack
if (not _isObjDuplicate) then
{
  fnf_objectives pushBack ["DESTROY", _objective, _objectiveObject, _objNum, _task];
  //if obj not dupe setup destroy marker so easier to view in map
  _marker = createMarkerLocal ["destroy_obj_marker_" + _objNum, _objectiveObject];
  _marker setMarkerTypeLocal "mil_objective";
  _marker setMarkerTextLocal "Destroy " + _objNum;

  [{
    params["_marker", "_object"];
    _marker setMarkerPosLocal _object;
    not alive _object;
  }, {
    params["_marker", "_object"];
    deleteMarkerLocal _marker;
  }, [_marker, _objectiveObject]] call CBA_fnc_waitUntilAndExecute;
} else {
  fnf_objectives pushBack ["DESTROYDUPE", _objective, _objectiveObject, _objNum, _task];
};
