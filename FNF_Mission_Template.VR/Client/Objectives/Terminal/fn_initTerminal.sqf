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

_targetConfig = _objectiveObject call CBA_fnc_getObjectConfig;
_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Land_DataTerminal_01_F.jpg"] call CBA_fnc_getConfigEntry;

_task = "";

_objNum = str((count fnf_objectives) + 1);

_marker = createMarkerLocal ["terminal_timer_" + _objNum, [0,0,0]];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTextLocal "[Idle]";
_marker setMarkerTypeLocal "mil_dot";
_markerColour = [playerSide, true] call BIS_fnc_sideColor;
_marker setMarkerColorLocal _markerColour;

switch (playerSide) do {
  case west:
  {
    [_objectiveObject, "blue", "blue", "blue"] call BIS_fnc_dataTerminalColor;
  };
  case east:
  {
    [_objectiveObject, "red", "red", "red"] call BIS_fnc_dataTerminalColor;
  };
  case independent:
  {
    [_objectiveObject, "green", "green", "green"] call BIS_fnc_dataTerminalColor;
  };
  default {};
};

if (_objectiveType == "hck") then
{
  if (_forPlayer) then
  {
    _task = player createSimpleTask [(_objNum + ": Hack the Terminal"), fnf_myTasksParentTask];
  } else {
    _task = player createSimpleTask [(_objNum + ": Hack the Terminal"), fnf_allyTasksParentTask];
  };

  _zoneKnown = _objective getVariable ["fnf_zoneKnown", true];

  if (not _zoneKnown) then
  {
    if (fnf_debug) then
    {
      systemChat "WARNING: Terminal objective is not known which hiding zone it is in, currently this disables the in-map timer, please reconsider this option";
    };
  };

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

    _task setSimpleTaskDescription [format["<img image='%1' width='300'><br/><br/><t>To complete this objective you must hack the objective for %2 seconds<br/><br/>%3", _targetPic, _hackingTime, _helperString], _objNum + ": Hack the Terminal", _objNum + ": Hack the Terminal"];

    [
      _objectiveObject,
      "Start Hack",
      "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
      "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
      "(_this distance _target < 3) && ((_target getVariable ['fnf_currentlyHackingSide', sideUnknown]) != playerSide) && not ([playerSide, (_target getVariable ['fnf_currentlyHackingSide', sideUnknown])] call BIS_fnc_sideIsFriendly)",
      "_caller distance _target < 3",
      {},
      {},
      {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [[(_arguments select 0), (_arguments select 1), playerSide, false], FNF_ServerSide_fnc_switchTerminal] remoteExec ['call', 2];
      },
      {},
      [_objectiveObject, _hackingTime],
      2,
      0,
      false,
      false
    ] call BIS_fnc_holdActionAdd;

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

    _task setSimpleTaskDescription [format["<img image='%1' width='300'><br/><br/><t>For your allies to complete this objective they must hack the objective for %2 seconds<br/><br/>%3", _targetPic, _hackingTime, _helperString], _objNum + ": Hack the Terminal", _objNum + ": Hack the Terminal"];
  };

  _marker setMarkerColorLocal "ColorUNKNOWN";
  [_objectiveObject, "orange", "orange", "orange"] call BIS_fnc_dataTerminalColor;

  _task setSimpleTaskType "upload";
  if (count _hidingZones == 0) then
  {
    _task setSimpleTaskTarget [_objectiveObject, true];
  } else {
    [_objectiveObject, _task, _zoneKnown, _hidingZones] call FNF_ClientSide_fnc_addObjectToHide;
  };

} else {

  if (_forPlayer) then
  {
    _task = player createSimpleTask [(_objNum + ": Defend the Terminal"), fnf_myTasksParentTask];
  } else {
    _task = player createSimpleTask [(_objNum + ": Defend the Terminal"), fnf_allyTasksParentTask];
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
    _task setSimpleTaskDescription [format["<img image='%1' width='300'><br/><br/><t>To complete this objective you must prevent the objective from being hacked, it will take the hackers %2 seconds to complete the hack%3", _targetPic, _hackingTime, _helperString], _objNum + ": Defend the Terminal", _objNum + ": Defend the Terminal"];

    [
      _objectiveObject,
      "Cancel Hack",
      "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
      "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
      "(_this distance _target < 3) && ((_target getVariable ['fnf_currentlyHackingCompletionTime', -1]) != -1)",
      "_caller distance _target < 3",
      {},
      {},
      {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [[(_arguments select 0), (_arguments select 1), playerSide, true], FNF_ServerSide_fnc_switchTerminal] remoteExec ['call', 2];
      },
      {},
      [_objectiveObject, _hackingTime],
      2,
      0,
      false,
      false
    ] call BIS_fnc_holdActionAdd;
  } else {
    _task setSimpleTaskDescription [format["<img image='%1' width='300'><br/><br/><t>For your allies to complete this objective they must prevent the objective from being hacked, it will take the hackers %2 seconds to complete the hack%3", _targetPic, _hackingTime, _helperString], _objNum + ": Defend the Terminal", _objNum + ": Defend the Terminal"];
  };
};

[{
  _objLoc = taskDestination ((_this select 0) select 1);
  if (_objLoc isEqualTo [0,0,0]) then
  {
    _objLoc = [-50000, -50000, -50000];
  };
  ((_this select 0) select 0) setMarkerPosLocal _objLoc;
},0.1,[_marker, _task]] call CBA_fnc_addPerFrameHandler;

//add objective to objective stack
fnf_objectives pushBack ["TERMINAL", _objective, _objectiveObject, _task, _forPlayer, _marker];
