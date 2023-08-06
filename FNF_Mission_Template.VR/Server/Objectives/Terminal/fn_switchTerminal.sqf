/*
	Author: Mallen

	Description:
    Switch a terminals side and set when it will be completed

	Parameter(s):
		0: OBJECT -  The terminal objective module to be processed
    1: INTEGER -  The time it takes to completely hack the terminal
    2: SIDE -  The side to switch the terminal to
    3: BOOLEAN -  Whether to set the terminal to idle

	Returns:
		None
*/

params["_objectiveObject", "_hackingTime", "_side", "_resetTimer"];

_objectiveObject setVariable ['fnf_currentlyHackingSide', _side, true];

if (_resetTimer) then
{
  _objectiveObject setVariable ['fnf_currentlyHackingCompletionTime', -1, true];

  [_objectiveObject,0] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
} else {

  _timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];
  _result = objNull;
  if (isServer and hasInterface) then
  {
    _result = time + _hackingTime;
  } else {
    _result = (serverTime - _timeServerStarted) + _hackingTime;
  };

  _objectiveObject setVariable ['fnf_currentlyHackingCompletionTime', _result, true];

  [_objectiveObject,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
};

[[_objectiveObject, _hackingTime, _side, _resetTimer], FNF_ClientSide_fnc_notifyTerminal] remoteExec ['call', 0, false];

switch (_side) do {
  case west:
  {
    [_objectiveObject, "blue", "blue", "blue"] remoteExec ["BIS_fnc_dataTerminalColor",0,true];
  };
  case east:
  {
    [_objectiveObject, "red", "red", "red"] remoteExec ["BIS_fnc_dataTerminalColor",0,true];
  };
  case independent:
  {
    [_objectiveObject, "green", "green", "green"] remoteExec ["BIS_fnc_dataTerminalColor",0,true];
  };
  default {};
};
