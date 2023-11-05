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

_terminalType = typeOf _objectiveObject;

if (_resetTimer) then
{
  _objectiveObject setVariable ['fnf_currentlyHackingCompletionTime', -1, true];

  switch (_terminalType) do {
    case "Land_DataTerminal_01_F":
    {
      [_objectiveObject,0] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    };
    case "RuggedTerminal_01_F":
    {
      [_objectiveObject, ["Progress_source", 0, true]] remoteExec ["animateSource",0,true];
      [_objectiveObject, ['Terminal_source','Terminal_source_sound'], 0, 1] remoteExec ["bis_fnc_LinkTerminal_Animations",0,true];
    };
    case "RuggedTerminal_01_communications_F":
    {
      [_objectiveObject, ["Progress_source", 0, true]] remoteExec ["animateSource",0,true];
      [_objectiveObject, ['Terminal_source','Terminal_source_sound'], 0, 1] remoteExec ["bis_fnc_LinkTerminal_Animations",0,true];
    };
    case "RuggedTerminal_02_communications_F":
    {
      [_objectiveObject, ["Progress_source", 0, true]] remoteExec ["animateSource",0,true];
      [_objectiveObject, ['Terminal_source','Terminal_source_sound'], 0, 1] remoteExec ["bis_fnc_LinkTerminal_Animations",0,true];
    };
    case "RuggedTerminal_01_communications_hub_F":
    {
      [_objectiveObject, ["Progress_source", 0, true]] remoteExec ["animateSource",0,true];
      [_objectiveObject, ['Terminal_source','Terminal_source_sound','Terminal_source_sound_case_01','Terminal_source_sound_case_02'], 0, 1] remoteExec ["bis_fnc_LinkTerminal_Animations",0,true];
    };
    default {};
  };
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

  _hackingMultiplyer = 10 / _hackingTime;

  switch (_terminalType) do {
    case "Land_DataTerminal_01_F":
    {
      [_objectiveObject,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    };
    case "RuggedTerminal_01_F":
    {
      [_objectiveObject, ["Progress_source", 0, true]] remoteExec ["animateSource",0,true];
      [_objectiveObject, ["Progress_source", 100, _hackingMultiplyer]] remoteExec ["animateSource",0,true];
      [_objectiveObject, ['Terminal_source','Terminal_source_sound'], 40, 1] remoteExec ["bis_fnc_LinkTerminal_Animations",0,true];
    };
    case "RuggedTerminal_01_communications_F":
    {
      [_objectiveObject, ["Progress_source", 0, true]] remoteExec ["animateSource",0,true];
      [_objectiveObject, ["Progress_source", 100, _hackingMultiplyer]] remoteExec ["animateSource",0,true];
      [_objectiveObject, ['Terminal_source','Terminal_source_sound'], 40, 1] remoteExec ["bis_fnc_LinkTerminal_Animations",0,true];
    };
    case "RuggedTerminal_02_communications_F":
    {
      [_objectiveObject, ["Progress_source", 0, true]] remoteExec ["animateSource",0,true];
      [_objectiveObject, ["Progress_source", 100, _hackingMultiplyer]] remoteExec ["animateSource",0,true];
      [_objectiveObject, ['Terminal_source','Terminal_source_sound'], 100, 1] remoteExec ["bis_fnc_LinkTerminal_Animations",0,true];
    };
    case "RuggedTerminal_01_communications_hub_F":
    {
      [_objectiveObject, ["Progress_source", 0, true]] remoteExec ["animateSource",0,true];
      [_objectiveObject, ["Progress_source", 100, _hackingMultiplyer]] remoteExec ["animateSource",0,true];
      [_objectiveObject, ['Terminal_source','Terminal_source_sound','Terminal_source_sound_case_01','Terminal_source_sound_case_02'], 40, 1] remoteExec ["bis_fnc_LinkTerminal_Animations",0,true];
    };
    default {};
  };
};

[[_objectiveObject, _hackingTime, _side, _resetTimer], FNF_ClientSide_fnc_notifyTerminal] remoteExec ['call', 0, false];

if (_terminalType == "Land_DataTerminal_01_F") then
{
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
};
