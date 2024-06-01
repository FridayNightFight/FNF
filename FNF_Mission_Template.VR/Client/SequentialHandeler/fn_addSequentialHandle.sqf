/*
	Author: Mallen

	Description:
		Adds an objective to the sequential handler

	Parameter(s):
		0: OBJECT -	The objective module
		0: BOOLEAN -	Whether the objective is for the player
		0: OBJECT -	The sequential objective planner module

	Returns:
		None
*/

params["_objective", "_forPlayer", "_sequentialModule"];

if (isNil "fnf_seqeuntialObjectiveItemsToCheck") then
{
	call FNF_ClientSide_fnc_initSequentialHandler;
};

//only happens for right side objectives right?
_prerequisiteList = [];
_objKnown = _sequentialModule getVariable ["fnf_nextObjectiveKnown", false];

_syncedObjects = synchronizedObjects _sequentialModule;

{
	_typeOfObject = typeOf _x;
	if (_typeOfObject isEqualTo "fnf_module_destroyObj" or _typeOfObject isEqualTo "fnf_module_sectorCaptureObj" or _typeOfObject isEqualTo "fnf_module_terminalObj" or _typeOfObject isEqualTo "fnf_module_assassinObj") then
	{
		_result = [_x, _sequentialModule] call FNF_ClientSide_fnc_getBottomLeft;
		if (_result) then
		{
			_prerequisiteList pushBack _x;
		};
	} else {
		if (true) exitWith
		{
			if (fnf_debug) then
			{
				systemChat "DANGER: Sequential Objective Planner has item that is not an objective synced to it, planner and associated objectives will NOT function";
			};
		};
	};
} forEach _syncedObjects;

fnf_seqeuntialObjectiveItemsToCheck pushBack [_objective, _forPlayer, _sequentialModule, _prerequisiteList, _objKnown];
//[_objModule, _forPlayer, _seqPlanModule, [_modules that must be complete], _objKnown]
