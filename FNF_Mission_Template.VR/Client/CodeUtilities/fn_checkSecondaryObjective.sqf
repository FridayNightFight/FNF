/*
	Author: Mallen

	Description:
		Determine whether the objective module is considered secondary

	Parameter(s):
		0: OBJECT - Common object or zone that both objectives are a part of
		1: OBJECT - objective to determine is secondary or not

	Returns:
		boolean
*/

params["_target", "_module"];

_isSecondaryObj = false;

if (typeName _target isEqualTo "OBJECT") then
{
	_targetObjectSyncedObjects = synchronizedObjects _target;
	_targetObjectSyncedObjects = [_targetObjectSyncedObjects] call FNF_ClientSide_fnc_sortByLocation;
	_indexOfThisObj = _targetObjectSyncedObjects find _module;
	_objType = typeOf _module;
	_indexOfFirstObj = _targetObjectSyncedObjects findIf {typeOf _x isEqualTo _objType};
	if (_indexOfFirstObj isNotEqualTo _indexOfThisObj) then
	{
		_isSecondaryObj = true;
	};
} else {
	_modules = call FNF_ClientSide_fnc_findFNFModules;
	_objModules = [_modules, "sectorCaptureObj"] call FNF_ClientSide_fnc_findSpecificModules;
	_targetObjectSyncedObjects = [];

	{
		_checkingPrefix = _x getVariable ["fnf_prefix", "FAILED"];
		if (_target isEqualTo _checkingPrefix) then
		{
			_targetObjectSyncedObjects pushBack _x;
		};
	} forEach _objModules;

	_targetObjectSyncedObjects = [_targetObjectSyncedObjects] call FNF_ClientSide_fnc_sortByLocation;
	_indexOfThisObj = _targetObjectSyncedObjects find _module;
	_objType = typeOf _module;
	_indexOfFirstObj = _targetObjectSyncedObjects findIf {typeOf _x isEqualTo _objType};
	if (_indexOfFirstObj isNotEqualTo _indexOfThisObj) then
	{
		_isSecondaryObj = true;
	};
};

_isSecondaryObj;
