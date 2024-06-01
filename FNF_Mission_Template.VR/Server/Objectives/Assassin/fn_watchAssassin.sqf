/*
	Author: Mallen

	Description:
		watch a destroy objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		1: OBJECT -	The destroy objective object to be processed

	Returns:
		Boolean
*/

params["_objectiveModule"];

_notifSent = _objectiveModule getVariable ["fnf_notifSent", false];

_result = _objectiveModule getVariable ["fnf_objComplete", false];

if (_notifSent) exitWith {_result;};

_objectiveModule setVariable ["fnf_notifSent", true, false];

[{
	params["_objectiveModule"];
	_objectiveModule setVariable ["fnf_notifSent", false, false];
},[_objectiveModule],5] call CBA_fnc_waitAndExecute;

_syncedObjects = synchronizedObjects _objectiveModule;

//find the target thats supposed to be killed or protected
_playerObject = objNull;
{
	if (isPlayer _x) then
	{
		_playerObject = _x;
	};
} forEach _syncedObjects;

if (not isNull _playerObject) then
{
	if (not alive _playerObject or isObjectHidden _playerObject) then
	{
		_name = name _playerObject;
		[[true, _name], FNF_ClientSide_fnc_notifyAdminAssassin] remoteExec ['call', -2];
	};
} else {
	[[false, ""], FNF_ClientSide_fnc_notifyAdminAssassin] remoteExec ['call', -2];
};

_result;
