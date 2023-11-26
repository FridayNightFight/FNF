/*
	Author: Mallen

	Description:
    watch a terminal objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		1: ARRAY - Array that objective is stored in

	Returns:
		Boolean
*/

params["_objEntry"];

_objEntry params["_objType","_objectiveModule","_objectiveObject", "_task", "_forPlayer", "_marker", "_markerSetLocationPFH"];

_timeOfCompletion = _objectiveObject getVariable ['fnf_currentlyHackingCompletionTime', -1];

_currentlyHackingSide = _objectiveObject getVariable ['fnf_currentlyHackingSide', sideUnknown];

_previouslyHackingSide = _objectiveObject getVariable ['fnf_previouslyHackingSide', sideUnknown];

//check if terminal should've finished hacking
_timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];
_result = objNull;
if (isServer and hasInterface) then
{
  _result = time > _timeOfCompletion;
} else {
  _result = (serverTime - _timeServerStarted) > _timeOfCompletion;
};
if (time < 1) then
{
  _result = false;
};

//grab OBJ number
_desc = taskDescription _task;
_splitString = (_desc select 1) splitString " ";
_objNumWithColon = _splitString select 0;
_objNum = (_objNumWithColon splitString "") select 0;

//if time of completion is never then set marker to idle
if (_timeOfCompletion == -1) then
{
  _result = false;
  _marker setMarkerTextLocal "[Idle]";
  if (ace_spectator_isset) then
  {
    _marker setMarkerTextLocal "Terminal " + _objNum + " [Idle]";
  };
};

//if terminal hacked
if (_result) then
{
  _taskType = taskType _task;
  if (_taskType == "upload" and _currentlyHackingSide == playerSide) then
  {
    _task setTaskState "Succeeded";
    if (_forPlayer) then
    {
      ["<t size='1.5' align='center'>Objective " + _objNum + " Complete</t><br/><br/><t align='center'>The Terminal has been hacked and is rigged to explode in 12 seconds</t>", "success", 10, 20] call FNF_ClientSide_fnc_notificationSystem;
    } else {
      ["<t size='1.5' align='center'>Objective " + _objNum + " Complete<br/>(Ally Objective)</t><br/><br/><t align='center'>The Terminal has been hacked and is rigged to explode in 12 seconds</t>", "success", 10, 20] call FNF_ClientSide_fnc_notificationSystem;
    };
  };
  if (_taskType == "upload" and _currentlyHackingSide != playerSide) then
  {
    if ([playerSide, _currentlyHackingSide] call BIS_fnc_sideIsFriendly) then
    {
      _task setTaskState "Succeeded";
      if (_forPlayer) then
      {
        ["<t size='1.5' align='center'>Objective " + _objNum + " Complete</t><br/><br/><t align='center'>The Terminal has been hacked by an ally and is rigged to explode in 12 seconds</t>", "success", 10] call FNF_ClientSide_fnc_notificationSystem;
      } else {
        ["<t size='1.5' align='center'>Objective " + _objNum + " Complete<br/>(Ally Objective)</t><br/><br/><t align='center'>The Terminal has been hacked by an ally and is rigged to explode in 12 seconds</t>", "success", 10] call FNF_ClientSide_fnc_notificationSystem;
      };
    } else {
      _task setTaskState "Failed";
      if (_forPlayer) then
      {
        ["<t size='1.5' align='center'>Objective " + _objNum + " Failed</t><br/><br/><t align='center'>The Terminal has been hacked by the enemy and is rigged to explode in 12 seconds</t>", "failure", 10] call FNF_ClientSide_fnc_notificationSystem;
      } else {
        ["<t size='1.5' align='center'>Objective " + _objNum + " Failed<br/>(Ally Objective)</t><br/><br/><t align='center'>The Terminal has been hacked by the enemy and is rigged to explode in 12 seconds</t>", "failure", 10] call FNF_ClientSide_fnc_notificationSystem;
      };
    };
  };
  if (_taskType == "defend") then {
    _task setTaskState "Failed";
    if (_forPlayer) then
    {
      ["<t size='1.5' align='center'>Objective " + _objNum + " Failed</t><br/><br/><t align='center'>The Terminal has been hacked and is rigged to explode in 12 seconds</t>", "failure", 10] call FNF_ClientSide_fnc_notificationSystem;
    } else {
      ["<t size='1.5' align='center'>Objective " + _objNum + " Failed<br/>(Ally Objective)</t><br/><br/><t align='center'>The Terminal has been hacked and is rigged to explode in 12 seconds</t>", "failure", 10] call FNF_ClientSide_fnc_notificationSystem;
    };
  };
  [_task] call FNF_ClientSide_fnc_removeTaskfromTaskControl;
  [_markerSetLocationPFH] call CBA_fnc_removePerFrameHandler;
  deleteMarkerLocal _marker;
} else {
  //OBJ has not been completed
  //if someone is hacking
  if (_timeOfCompletion != -1) then
  {
    //get time left on the hack
    _resultTime = objNull;
    if (isServer and hasInterface) then
    {
      _resultTime = _timeOfCompletion - time;
    } else {
      _resultTime = _timeOfCompletion - (serverTime - _timeServerStarted);
    };
    _timeText = [_resultTime, "MM:SS"] call BIS_fnc_secondsToString;
    //set the marker to this value of time left
    _marker setMarkerTextLocal "[" + _timeText + "]";
    if (ace_spectator_isset) then
    {
      _marker setMarkerTextLocal "Terminal " + _objNum + " [" + _timeText + "]";
    };

    //blink marker colour because it looks pretty on the map and says whos hacking at a glance
    if (markerColor _marker == "ColorBlack") then
    {
      _markerColour = [_previouslyHackingSide, true] call BIS_fnc_sideColor;
      _marker setMarkerColorLocal _markerColour;
    } else {
      _marker setMarkerColorLocal "ColorBlack";
    };
  };

  if (_currentlyHackingSide == _previouslyHackingSide) exitWith
  {
    false;
  };

  _objectiveObject setVariable ['fnf_previouslyHackingSide', _currentlyHackingSide, false];

  _markerColour = [_currentlyHackingSide, true] call BIS_fnc_sideColor;
  _marker setMarkerColorLocal _markerColour;
};

_result;
