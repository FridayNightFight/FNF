/*
	Author: Mallen

	Description:
		Sets up the required objectives specified by modules

	Parameter(s):
		0: ARRAY -	An array of all obj modules

	Returns:
		None
*/

params ["_modules"];

//sort by X,Y and Z, leading zeros added for expected behaviour near 0,0 coords
//could concievabley be an issue if map is more than 999999 meters wide (unlikely)
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
	_syncedObjects = synchronizedObjects _x;
	_visibleToAllies = _x getVariable ["fnf_visibleToAllies", true];

	//check if objective module is for player or player's allys
	_showObj = false;
	_alliedTask = true;

	_sideCounter = 0;
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

		_sideCounter = _sideCounter + 1;

		if (_objSide isEqualTo playerSide) then
		{
			_showObj = true;
			_alliedTask = false;
		};

		if ([playerSide, _objSide] call BIS_fnc_sideIsFriendly) then
		{
			_showObj = true;
		};
	} forEach _syncedObjects;

	if (_sideCounter isEqualTo 0) then
	{
		if (fnf_debug) then
		{
			systemChat "DANGER: Objective has no valid side synced to it, objective will NOT function";
		};
		continue;
	};
	if (_sideCounter > 1) then
	{
		if (fnf_debug) then
		{
			systemChat "DANGER: Objective has more than one side synced to it, objective will NOT function";
		};
		continue;
	};

	//if it is check what kind of objective it is and run corresponding init script
	_moduleType = typeOf _x;
	if (_showObj) then
	{
		_newTaskIndex = fnf_objectives pushBack [0, _x, taskNull, _alliedTask, {}, []];

		switch (_moduleType) do
		{
			case "fnf_module_destroyObj":
			{
				[_newTaskIndex] call FNF_ClientSide_fnc_initDestroy;
			};

			case "fnf_module_sectorCaptureObj":
			{
				if (not _missionStatusSet) then
				{
					_missionStatusSet = true;
					addMissionEventHandler ["Map", {call BIS_fnc_showMissionStatus}];
					call BIS_fnc_showMissionStatus;
				};
				[_newTaskIndex] call FNF_ClientSide_fnc_initCaptureSector;
			};

			case "fnf_module_terminalObj":
			{
				[_newTaskIndex] call FNF_ClientSide_fnc_initTerminal;
			};

			case "fnf_module_assassinObj":
			{
				[_newTaskIndex] call FNF_ClientSide_fnc_initAssassin;
			};

			//if no type found then objective must be part of a new mod update that framework isnt equipped to handle
			default
			{
				if (fnf_debug) then
				{
					systemChat ("DANGER: FNF Obj module " + _moduleType + " is of unknown type, make sure template is up to date");
				};
			};
		};
	};
} forEach _modules;
