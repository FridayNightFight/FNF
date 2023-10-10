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
    systemChat "DANGER: Terminal objective does not have objective type set, objective will NOT function";
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

  if (_typeOfObject == "Land_DataTerminal_01_F") then
  {
    if (_objectiveObject isEqualTo "") then
    {
      _objectiveObject = _x;
      continue;
    } else {
      if (fnf_debug) then
      {
        systemChat "WARNING: Terminal objective has more than one possible objects as target";
      };
    };
  };

  if (fnf_debug) then
  {
    systemChat "WARNING: Terminal objective has an object that is not a Terminal synced to it";
  };
} forEach _syncedObjects;

if (_objectiveObject isEqualTo "") exitWith
{
  if (fnf_debug) then
  {
    systemChat "DANGER: Terminal objective does not have terminal synced, objective will NOT function";
  };
};

_isObjDuplicate = false;
{
  if (_x select 0 == "TERMINAL") then
  {
    if  (_x select 2 isEqualTo _objectiveObject) then
    {
      _isObjDuplicate = true;
    };
  };
} forEach fnf_objectives;

_hackingTime = _objective getVariable ["fnf_hackingTime", "FAILED"];
if (_hackingTime isEqualTo "FAILED") exitWith
{
  if (fnf_debug) then
  {
    systemChat "DANGER: Terminal objective does not have time to complete hack set, objective will NOT function";
  };
};

if (_hackingTime == 0) exitWith
{
  if (fnf_debug) then
  {
    systemChat "DANGER: Terminal objective time to complete hack is set to zero, objective will NOT function";
  };
};

if (_hackingTime < 0) exitWith
{
  if (fnf_debug) then
  {
    systemChat "DANGER: Terminal objective time to complete hack is set to a negative number, objective will NOT function";
  };
};

if (_hackingTime > 299) then
{
  if (fnf_debug) then
  {
    systemChat "WARNING: Terminal objective time to complete hack is set to 5 minutes or longer, this is very long for a terminal objective";
  };
};

_targetConfig = _objectiveObject call CBA_fnc_getObjectConfig;
_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Land_DataTerminal_01_F.jpg"] call CBA_fnc_getConfigEntry;

_objNum = str((count fnf_objectives) + 1);

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

if (not _isObjDuplicate) then
{
  _marker = createMarkerLocal ["terminal_timer_" + _objNum, getPos _objectiveObject];
  _marker setMarkerShapeLocal "ICON";
  _marker setMarkerTextLocal "Terminal " + _objNum + " [Idle]";
  _marker setMarkerTypeLocal "mil_dot";
  _marker setMarkerColorLocal "ColorUNKNOWN";

  [_objectiveObject, "orange", "orange", "orange"] call BIS_fnc_dataTerminalColor;

  //add objective to objective stack
  fnf_objectives pushBack ["TERMINAL", _objective, _objectiveObject, _marker];
};
