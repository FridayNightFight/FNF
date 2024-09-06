/*
	Author: Mallen

	Description:
		Sets up the required objectives specified by modules server side

	Parameter(s):
		0: ARRAY -	An array of all obj modules

	Returns:
		None
*/
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
if (isNil "fnf_objectives") then
{
	fnf_objectives = [];
};

call FNF_ClientSide_fnc_initMarkerFollow;

_missionStatusSet = false;

{
	_moduleType = typeOf _x;
	_newTaskIndex = fnf_objectives pushBack [0, _x, taskNull, false, {}, []];

	switch (_moduleType) do
	{
		case "fnf_module_destroyObj":
		{
			[_newTaskIndex] call FNF_ClientSide_fnc_initSpectatorDestroy;
		};

		case "fnf_module_sectorCaptureObj":
		{
			if (not _missionStatusSet) then
			{
				_missionStatusSet = true;
				addMissionEventHandler ["Map", {call BIS_fnc_showMissionStatus}];
				call BIS_fnc_showMissionStatus;
			};
			[_newTaskIndex] call FNF_ClientSide_fnc_initSpectatorCaptureSector;
		};

		case "fnf_module_terminalObj":
		{
			[_newTaskIndex] call FNF_ClientSide_fnc_initSpectatorTerminal;
		};

		case "fnf_module_assassinObj":
		{
			[_newTaskIndex] call FNF_ClientSide_fnc_initSpectatorAssassin;
		};
	};
} forEach _modules;
