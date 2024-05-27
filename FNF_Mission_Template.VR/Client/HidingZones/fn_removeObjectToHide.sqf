/*
	Author: Mallen

	Description:
		remove an object from the hiding zone system

	Parameter(s):
		0: TASK -	The task connected to the object to be hidden in the zones

	Returns:
		None
*/

params["_task"];

if (isNil "fnf_objectsToHide") exitWith {};

_indexToRemove = -1;

{
	if ((_x select 1) isEqualTo _task) then
	{
		_indexToRemove = _forEachIndex;
	};
} forEach fnf_objectsToHide;

if (_indexToRemove isNotEqualTo -1) then
{
	fnf_objectsToHide deleteAt _indexToRemove;
};
