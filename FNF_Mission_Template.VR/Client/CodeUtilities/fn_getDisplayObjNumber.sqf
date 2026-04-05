/*
	Author: Mallen

	Description:
		Get the display number for an objective

	Parameter(s):
		0: OBJECT - the module to get correct number for

	Returns:
		string
*/

params["_module"];

//if variable not created, create it
if (isNil "fnf_objectiveDisplayNumbers") then
{
	fnf_objectiveDisplayNumbers = createHashMap;
};

//check if this module has been checked before, if yes exit with result
_result = fnf_objectiveDisplayNumbers getOrDefault [(hashValue _module), "NOTFOUND"];
if (_result isNotEqualTo "NOTFOUND") exitWith { str(_result); };

//otherwise get common target
_target = _module getVariable ["fnf_prefix", "FAILED"];

if (_target isEqualTo "FAILED") then
{
	_syncedObjects = synchronizedObjects _module;
	{
		_typeOfObject = typeOf _x;
		if (_typeOfObject isEqualTo "SideBLUFOR_F" or _typeOfObject isEqualTo "SideOPFOR_F" or _typeOfObject isEqualTo "SideResistance_F" or _typeOfObject isEqualTo "fnf_module_hidingZone" or _typeOfObject isEqualTo "fnf_module_sequentialObjectivePlanner") then
		{
			continue;
		};

		_target = _x;
		break;

	} forEach _syncedObjects;
};

_commonModules = [];

if (typeName _target isEqualTo "OBJECT") then
{
	_modules = call FNF_ClientSide_fnc_findFNFModules;
	_objModules = [_modules, "Obj"] call FNF_ClientSide_fnc_findSpecificModules;
	_targetObjectSyncedObjects = [];

	{
		_syncedObjects = synchronizedObjects _x;
		if (_target in _syncedObjects) then
		{
			_targetObjectSyncedObjects pushBack _x;
		};
	} forEach _objModules;

	_targetObjectSyncedObjects = [_targetObjectSyncedObjects] call FNF_ClientSide_fnc_sortByLocation;
	_moduleType = typeOf _module;
	_commonModules = _targetObjectSyncedObjects select {typeOf _x isEqualTo _moduleType};
} else {
	_modules = call FNF_ClientSide_fnc_findFNFModules;
	_captureObjModules = [_modules, "sectorCaptureObj"] call FNF_ClientSide_fnc_findSpecificModules;
	_holdObjModules = [_modules, "sectorHoldObj"] call FNF_ClientSide_fnc_findSpecificModules;
	_stealObjModules = [_modules, "stealObj"] call FNF_ClientSide_fnc_findSpecificModules;
	_objModules = _captureObjModules + _holdObjModules + _stealObjModules;
	_targetObjectSyncedObjects = [];

	{
		_checkingPrefix = _x getVariable ["fnf_prefix", "FAILED"];
		if (_target isEqualTo _checkingPrefix) then
		{
			_targetObjectSyncedObjects pushBack _x;
		};
	} forEach _objModules;

	_targetObjectSyncedObjects = [_targetObjectSyncedObjects] call FNF_ClientSide_fnc_sortByLocation;
	_moduleType = typeOf _module;
	_commonModules = _targetObjectSyncedObjects select {typeOf _x isEqualTo _moduleType};
};

_highestNumber = fnf_objectiveDisplayNumbers getOrDefault ["HighestNumber", 0];
_highestNumber = _highestNumber + 1;
fnf_objectiveDisplayNumbers set ["HighestNumber", _highestNumber];

{
	fnf_objectiveDisplayNumbers set [(hashValue _x), _highestNumber, true];
} forEach _commonModules;

str(_highestNumber);
