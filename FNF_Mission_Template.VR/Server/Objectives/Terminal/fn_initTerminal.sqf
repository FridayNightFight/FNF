/*
	Author: Mallen

	Description:
    init a terminal objective including setting up server watch

	Parameter(s):
		0: OBJECT -  The terminal objective module to be processed
    1: SIDE -  The side that the objective is assigned to

	Returns:
		None
*/

params ["_objective", "_side"];

_syncedObjects = synchronizedObjects _objective;

//find the object thats supposed to be hacked
_objectiveObject = "";
{
  _typeOfObject = typeOf _x;
  if (_typeOfObject == "SideBLUFOR_F" or _typeOfObject == "SideOPFOR_F" or _typeOfObject == "SideResistance_F" or _typeOfObject == "fnf_module_hidingZone") then
  {
    continue;
  };

  if (_objectiveObject isEqualTo "") then
  {
    _objectiveObject = _x;
  };
} forEach _syncedObjects;

//check if there is an object to do anything with
if (_objectiveObject isEqualTo "") exitWith {};

//add objective to objective stack
// [type, objective, task]
fnf_serverObjectives pushBack [false, "TERMINAL", _side, _objective, _objectiveObject];
