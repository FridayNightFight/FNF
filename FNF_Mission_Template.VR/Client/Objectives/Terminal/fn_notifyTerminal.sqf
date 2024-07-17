/*
	Author: Mallen

	Description:
		Notify the player when a terminal has been hacked

	Parameter(s):
		0: OBJECT -	The terminal objective module to be processed
		1: INTEGER -	The time it takes to completely hack the terminal
		2: SIDE -	The side to switch the terminal to
		3: BOOLEAN -	Whether to set the terminal to idle

	Returns:
		None
*/

params["_targetObject", "_hackingTime", "_side", "_resetTimer"];

_objectiveIndex = -1;

//find objective
{
	if ((_x select 5 select 0) isEqualTo _targetObject) then
	{
		_objectiveIndex = _forEachIndex;
	}
} forEach fnf_objectives;

//if obj not found not for us, pass on
if (_objectiveIndex isEqualTo -1) exitWith {};

//notify player
if (_resetTimer) then
{
	[format["<t size='1.5' align='center'>Objective %1 Hack Cancelled</t><br/><br/><t align='center'>Terminal %1 hack has been cancelled</t>", (_objectiveIndex + 1)], "info"] call FNF_ClientSide_fnc_notificationSystem;
} else {
	_sideText = [_side] call BIS_fnc_sideName;
	_timeText = [_hackingTime, "MM:SS"] call BIS_fnc_secondsToString;
	[["<t size='1.5' align='center'>Objective %1 Hack Started</t><br/><br/><t align='center'>Terminal %1 hack has been started by %2, the hack will take: %3 Seconds</t>", (_objectiveIndex + 1), _sideText, _timeText], "info"] call FNF_ClientSide_fnc_notificationSystem;
};

//if terminal is a data terminal, set its colours
_objectType = typeOf _targetObject;
if (_objectType isEqualTo "Land_DataTerminal_01_F") then
{
	switch (_side) do {
		case west:
		{
			[_targetObject, "blue", "blue", "blue"] call BIS_fnc_dataTerminalColor;
		};
		case east:
		{
			[_targetObject, "red", "red", "red"] call BIS_fnc_dataTerminalColor;
		};
		case independent:
		{
			[_targetObject, "green", "green", "green"] call BIS_fnc_dataTerminalColor;
		};
		default {};
	};
};

if (_resetTimer) then
{
	//animate Terminal closing
	switch (_objectType) do {
		case "Land_DataTerminal_01_F":
		{
			[_targetObject,0] call BIS_fnc_DataTerminalAnimate;
		};
		case "RuggedTerminal_01_F":
		{
			_targetObject animateSource ["Progress_source", 0, true];
			[_targetObject, ['Terminal_source','Terminal_source_sound'], 0, 1] call bis_fnc_LinkTerminal_Animations;
		};
		case "RuggedTerminal_01_communications_F":
		{
			_targetObject animateSource ["Progress_source", 0, true];
			[_targetObject, ['Terminal_source','Terminal_source_sound'], 0, 1] call bis_fnc_LinkTerminal_Animations;
		};
		case "RuggedTerminal_02_communications_F":
		{
			_targetObject animateSource ["Progress_source", 0, true];
			[_targetObject, ['Terminal_source','Terminal_source_sound'], 0, 1] call bis_fnc_LinkTerminal_Animations;
		};
		case "RuggedTerminal_01_communications_hub_F":
		{
			_targetObject animateSource ["Progress_source", 0, true];
			[_targetObject, ['Terminal_source','Terminal_source_sound','Terminal_source_sound_case_01','Terminal_source_sound_case_02'], 0, 1] call bis_fnc_LinkTerminal_Animations;
		};
		default {};
	};
} else {
	//animate terminal hacking
	_hackingMultiplyer = 10 / _hackingTime;

	switch (_objectType) do {
		case "Land_DataTerminal_01_F":
		{
			[_targetObject,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
		};
		case "RuggedTerminal_01_F":
		{
			_targetObject animateSource ["Progress_source", 0, true];
			_targetObject animateSource ["Progress_source", 100, _hackingMultiplyer];
			[_targetObject, ['Terminal_source','Terminal_source_sound'], 40, 1] call bis_fnc_LinkTerminal_Animations;
		};
		case "RuggedTerminal_01_communications_F":
		{
			_targetObject animateSource ["Progress_source", 0, true];
			_targetObject animateSource ["Progress_source", 100, _hackingMultiplyer];
			[_targetObject, ['Terminal_source','Terminal_source_sound'], 40, 1] call bis_fnc_LinkTerminal_Animations;
		};
		case "RuggedTerminal_02_communications_F":
		{
			_targetObject animateSource ["Progress_source", 0, true];
			_targetObject animateSource ["Progress_source", 100, _hackingMultiplyer];
			[_targetObject, ['Terminal_source','Terminal_source_sound'], 100, 1] call bis_fnc_LinkTerminal_Animations;
		};
		case "RuggedTerminal_01_communications_hub_F":
		{
			_targetObject animateSource ["Progress_source", 0, true];
			_targetObject animateSource ["Progress_source", 100, _hackingMultiplyer];
			[_targetObject, ['Terminal_source','Terminal_source_sound','Terminal_source_sound_case_01','Terminal_source_sound_case_02'], 40, 1] call bis_fnc_LinkTerminal_Animations;
		};
		default {};
	};
};
