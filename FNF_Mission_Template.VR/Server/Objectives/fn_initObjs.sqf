/*
	Author: Mallen

	Description:
		Sets up the required objectives specified by modules server side

	Parameter(s):
		0: ARRAY -	An array of all obj modules

	Returns:
		None
*/
if (!isServer) exitWith {};

params ["_modules"];

_modules = [_modules] call FNF_ClientSide_fnc_sortByLocation;

//[ObjState, ObjModule, Task, AlliedTask, CodeOnCompletion, params];
/*Obj state:
0 - Not Created
1 - Not Tracking, Not Known
2 - Not Tracking, Known
3 - Active
4 - Completed
5 - Failed
*/
if (isNil "fnf_serverObjectives") then
{
	fnf_serverObjectives = [];
};

call FNF_ClientSide_fnc_initZones;

call FNF_ClientSide_fnc_initGPSUnitMarkers;

{
	_moduleType = typeOf _x;
	_newTaskIndex = fnf_serverObjectives pushBack [0, _x, taskNull, false, {}, []];

	switch (_moduleType) do
	{
		case "fnf_module_destroyObj":
		{
			[_newTaskIndex] call FNF_ServerSide_fnc_initDestroy;
		};

		case "fnf_module_sectorCaptureObj":
		{
			[_newTaskIndex] call FNF_ServerSide_fnc_initCaptureSector;
		};

		case "fnf_module_sectorHoldObj":
		{
			[_newTaskIndex] call FNF_ServerSide_fnc_initHoldSector;
		};

		case "fnf_module_terminalObj":
		{
			[_newTaskIndex] call FNF_ServerSide_fnc_initTerminal;
		};

		case "fnf_module_assassinObj":
		{
			[_newTaskIndex] call FNF_ServerSide_fnc_initAssassin;
		};
	};
} forEach _modules;
