/*
	Author: Mallen

	Description:
    init a assassin objective for spectator

	Parameter(s):
		0: OBJECT -  The assassin objective module to be processed

	Returns:
		None
*/

params ["_objective","_side"];

//get the objective type
_objectiveType = _objective getVariable ["fnf_objectiveType", "FAILED"];

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
_playerObject = objNull;
_dupeLogicCheck = objNull;
{
  _typeOfObject = typeOf _x;
  if (_typeOfObject isEqualTo "SideBLUFOR_F" or _typeOfObject isEqualTo "SideOPFOR_F" or _typeOfObject isEqualTo "SideResistance_F") then
  {
    continue;
  };

  if (_typeOfObject isEqualTo "fnf_module_hidingZone") then
  {
    _hidingZones pushBack _x;
    continue;
  };

  if (isPlayer _x) then
  {
    _playerObject = _x;
    continue;
  };

  if (_typeOfObject isEqualTo "Logic") then
  {
    _dupeLogicCheck = _x;
    continue;
  };

  if (fnf_debug) then
  {
    systemChat "WARNING: Assassin objective has an object that is not a hiding zone, side, or player synced to it, objective will still function";
  };
} forEach _syncedObjects;

_objectiveObject = _objective;

if (not isNull _playerObject) then
{
  _objectiveObject = _playerObject;
};

_objNum = str(({_x select 0 isNotEqualTo "DESTROYDUPE" and _x select 0 isNotEqualTo "CAPTURESECTORDUPE" and _x select 0 isNotEqualTo "TERMINALDUPE" and _x select 0 isNotEqualTo "ASSASSINDUPE"} count fnf_objectives) + 1);

//check if OBJ is a dupe, if so inform code and update OBJ number
_isObjDuplicate = false;
{
  if (_x select 0 isEqualTo "ASSASSIN") then
  {
    if  (_x select 2 isEqualTo _dupeLogicCheck) then
    {
      _isObjDuplicate = true;
      _objNum = _x select 3;
    };
  };
} forEach fnf_objectives;

//setup hiding zones if they are wanted
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
};

_task = "";

_targetName = _objective getVariable ["fnf_targetName", "Unknown Name"];

//create and setup objective task
if (_objectiveType isEqualTo "elm") then
{
  _task = player createSimpleTask [(_objNum + ": Eliminate " + _targetName)];
  _zoneKnown = _objective getVariable ["fnf_zoneKnown", true];

  _helperString = "The location of the objective is marked on " + ([_side] call BIS_fnc_sideName) + "s map";

  if (count _hidingZones isNotEqualTo 0) then
  {
    _helperString = "The location of the objective may be in a hiding zone, if it is, the zone it is hidden is marked on " + ([_side] call BIS_fnc_sideName) + "s map, if it isn't, the objectives exact location is marked instead";
    if (not _zoneKnown) then
    {
      _helperString = "The location of the objective may be in a hiding zone, if it is, " + ([_side] call BIS_fnc_sideName) + " will have to search all hiding zones to find the objective, if it isn't, the objectives exact location is marked on " + ([_side] call BIS_fnc_sideName) + "s map";
    };
  };

  _task setSimpleTaskDescription [format["<t>To complete this objective " + ([_side] call BIS_fnc_sideName) + " must eliminate %1<br/><br/>%2</t>", _targetName, _helperString], _objNum + ": Eliminate " + _targetName, _objNum + ": Eliminate " + _targetName];


  _task setSimpleTaskType "kill";
  _task setSimpleTaskTarget [_objectiveObject, true];
} else {
  _task = player createSimpleTask [(_objNum + ": Defend " + _targetName)];

  _task setSimpleTaskType "defend";
  _task setSimpleTaskTarget [_objectiveObject, true];

  _helperString = "";

  if (count _hidingZones isNotEqualTo 0) then
  {
    _helperString = "<br/><br/>The objective can be hidden in the hiding zones provided";
  };

  _task setSimpleTaskDescription [format["<t>To complete this objective " + ([_side] call BIS_fnc_sideName) + " must prevent %1 from being eliminated for the duration of the game%2</t>", _targetName, _helperString], _objNum + ": Defend " + _targetName, _objNum + ": Defend " + _targetName];
};

//add objective to objective stack
if (not _isObjDuplicate) then
{
  fnf_objectives pushBack ["ASSASSIN", _objective, _dupeLogicCheck, _objNum, _task];
} else {
  fnf_objectives pushBack ["ASSASSINDUPE", _objective, _dupeLogicCheck, _objNum, _task];
};
