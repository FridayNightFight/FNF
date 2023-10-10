/*
	Author: Mallen

	Description:
    Notify the player when a terminal has been hacked

	Parameter(s):
		0: OBJECT -  The terminal objective module to be processed
    1: INTEGER -  The time it takes to completely hack the terminal
    2: SIDE -  The side to switch the terminal to
    3: BOOLEAN -  Whether to set the terminal to idle

	Returns:
		None
*/

params["_objectiveObject", "_hackingTime", "_side", "_resetTimer"];

_objective = objNull;

{
  if ((_x select 0) == "TERMINAL") then
  {
    if ((_x select 2) == _objectiveObject) then
    {
      _objective = _x;
    }
  }
} forEach fnf_objectives;

if (_objective isEqualTo objNull) exitWith {};

_objNum = -1;

if (ace_spectator_isset) then
{
  _objNum = _objective select 4;
} else {
  _desc = taskDescription (_objective select 3);
  _splitString = (_desc select 1) splitString " ";
  _objNumWithColon = _splitString select 0;
  _objNum = (_objNumWithColon splitString "") select 0;
};

_sideText = "Unknown";
switch (_side) do {
  case west:
  {
    _sideText = "Blufor";
  };
  case east:
  {
    _sideText = "Opfor";
  };
  case independent:
  {
    _sideText = "Independent";
  };
  default {};
};

if (_resetTimer) then
{
  ["<t size='1.5' align='center'>Objective " + _objNum + " Hack Cancelled</t><br/><br/><t align='center'>Terminal " + _objNum + " hack has been cancelled</t>", "info"] call FNF_ClientSide_fnc_notificationSystem;
} else {
  _timeText = [_hackingTime, "MM:SS"] call BIS_fnc_secondsToString;
  ["<t size='1.5' align='center'>Objective " + _objNum + " Hack Started</t><br/><br/><t align='center'>Terminal " + _objNum + " hack has been started by " + _sideText + ", the hack will take: " + _timeText + "</t>", "info"] call FNF_ClientSide_fnc_notificationSystem;
};
