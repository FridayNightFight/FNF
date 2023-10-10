/*
	Author: Mallen

	Description:
    init a destroy objective for spectators

	Parameter(s):
		0: OBJECT -  The destroy objective module to be processed

	Returns:
		None
*/

params ["_objective"];

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

_isObjDuplicate = false;
{
  if (_x select 0 == "DESTROY") then
  {
    if  (_x select 2 isEqualTo _objectiveObject) then
    {
      _isObjDuplicate = true;
    };
  };
} forEach fnf_objectives;

//get objects name and picture
_targetConfig = _objectiveObject call CBA_fnc_getObjectConfig;
_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;
_targetName = getText (_targetConfig >> "DisplayName");

_objNum = str((count fnf_objectives) + 1);

//create and setup objective task
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

//add objective to objective stack
// [type, objective, objectiveObject, task, for Player?]
if (not _isObjDuplicate) then
{
  fnf_objectives pushBack ["DESTROY", _objective, _objectiveObject, _objNum];
  _marker = createMarkerLocal ["destroy_obj_marker_" + _objNum, getPos _objectiveObject];
  _marker setMarkerTypeLocal "mil_objective";
  _marker setMarkerText "Destroy " + _objNum;

  [{
    params["_marker", "_object"];
    not alive _object;
  }, {
    params["_marker", "_object"];
    deleteMarkerLocal _marker;
  }, [_marker, _objectiveObject]] call CBA_fnc_waitUntilAndExecute;
};
