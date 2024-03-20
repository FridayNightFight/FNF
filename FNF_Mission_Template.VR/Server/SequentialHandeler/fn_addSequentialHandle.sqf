/*
	Author: Mallen

	Description:
		Adds an objective to the sequential handler

	Parameter(s):
		0: OBJECT -  The objective module
    0: BOOLEAN -  Whether the objective is for the player
    0: OBJECT -  The sequential objective planner module

	Returns:
		None
*/

params["_objective", "_side", "_sequentialModule"];

if (isNil "fnf_seqeuntialObjectiveItemsToCheckServer") then
{
  call FNF_ServerSide_fnc_initSequentialHandler;
};

//only happens for right side objectives right?
_prerequisiteList = [];

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
    if (true) exitWith {};
  };
} forEach _syncedObjects;

fnf_seqeuntialObjectiveItemsToCheckServer pushBack [_objective, _side, _sequentialModule, _prerequisiteList];
//[_objModule, _side, _seqPlanModule, [_modules that must be complete]]
