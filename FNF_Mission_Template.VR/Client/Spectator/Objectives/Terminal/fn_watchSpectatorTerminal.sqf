/*
	Author: Mallen

	Description:
    watch a terminal objective for spectators

	Parameter(s):
		1: ARRAY - Array that objective is stored in

	Returns:
		Boolean
*/

params["_objEntry"];

_objEntry params["_objType","_objectiveModule","_objectiveObject","_marker","_objNum"];

_timeOfCompletion = _objectiveObject getVariable ['fnf_currentlyHackingCompletionTime', -1];

_currentlyHackingSide = _objectiveObject getVariable ['fnf_currentlyHackingSide', sideUnknown];

_previouslyHackingSide = _objectiveObject getVariable ['fnf_previouslyHackingSide', sideUnknown];

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

_desc = taskDescription _task;
_splitString = (_desc select 1) splitString " ";
_objNumWithColon = _splitString select 0;
_objNum = (_objNumWithColon splitString "") select 0;

if (_timeOfCompletion == -1) then
{
  _result = false;
  _marker setMarkerTextLocal "Terminal " + _objNum + " [Idle]";
};

if (_result) then
{
  ["<t size='1.5' align='center'>Objective " + _objNum + " Complete</t><br/><br/><t align='center'>The Terminal has been hacked and is rigged to explode in 12 seconds</t>", "success", 10, 20] call FNF_ClientSide_fnc_notificationSystem;
  deleteMarkerLocal _marker;
} else {
  //OBJ has not been completed
  if (_timeOfCompletion != -1) then
  {
    _resultTime = objNull;
    if (isServer and hasInterface) then
    {
      _resultTime = _timeOfCompletion - time;
    } else {
      _resultTime = _timeOfCompletion - (serverTime - _timeServerStarted);
    };
    _timeText = [_resultTime, "MM:SS"] call BIS_fnc_secondsToString;
    _marker setMarkerTextLocal "Terminal " + _objNum + " [" + _timeText + "]";
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
