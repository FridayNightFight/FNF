/*
	Author: Mallen

	Description:
		Checks what side the obj module is for, then returns the parent spectator task for that side

	Parameter(s):
		0: OBJECT -	Module of objective to get parent task for

	Returns:
		Task
*/

params ["_module"];

if (isNil "fnf_spectatorTasksParentTask") then
{
	fnf_spectatorTasksParentTask = createHashMap;
};

_syncedObjects = synchronizedObjects _x;

_objSide = sideUnknown;

{
	_objectType = typeOf _x;
	_objSide = sideEmpty;

	switch (_objectType) do
	{
		case "SideBLUFOR_F":
		{
			_objSide = west;
		};
		case "SideOPFOR_F":
		{
			_objSide = east;
		};
		case "SideResistance_F":
		{
			_objSide = independent;
		};
		default
		{
			continue;
		};
	};
} forEach _syncedObjects;

_result = taskNull;

switch (_objSide) do {
	case west:
	{
		_result = (fnf_spectatorTasksParentTask getOrDefault [west, "PROBLEM", true]);
		if (_result isEqualTo "PROBLEM") then
		{
			_result = player createSimpleTask ["Blufor Tasks"];
			fnf_spectatorTasksParentTask set [west, _result];
		};
	};
	case east:
	{
		_result = (fnf_spectatorTasksParentTask getOrDefault [east, "PROBLEM", true]);
		if (_result isEqualTo "PROBLEM") then
		{
			_result = player createSimpleTask ["Opfor Tasks"];
			fnf_spectatorTasksParentTask set [east, _result];
		};
	};
	case independent:
	{
		_result = (fnf_spectatorTasksParentTask getOrDefault [independent, "PROBLEM", true]);
		if (_result isEqualTo "PROBLEM") then
		{
			_result = player createSimpleTask ["Indfor Tasks"];
			fnf_spectatorTasksParentTask set [independent, _result];
		};
	};
	default { };
};

_result;
