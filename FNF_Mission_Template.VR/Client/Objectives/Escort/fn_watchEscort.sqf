/*
	Author: Mallen

	Description:
		watch a escort objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		1: INTEGER -	The index of the objective to watch

	Returns:
		Boolean
*/

params ["_objectiveIndex"];

_objEntry = fnf_objectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_serverState = _module getVariable ["fnf_objServerState", 3];

_params params ["_targetObject", "_hidingZonesAssigned", "_zonePrefix", "_childTasks"];
_childTasks params ["_childTaskTarget", "_childTaskDropOff"];

//if server does not say the obj is done, don't continue
if (_serverState isEqualTo 3) exitWith {};

[_task] call FNF_ClientSide_fnc_removeTaskfromTaskControl;
[_childTaskTarget] call FNF_ClientSide_fnc_removeTaskfromTaskControl;
[_childTaskDropOff] call FNF_ClientSide_fnc_removeTaskfromTaskControl;

//get objects name and picture
_targetConfig = _targetObject call CBA_fnc_getObjectConfig;
_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;
_targetName = getText (_targetConfig >> "DisplayName");

//start notification creation
_stringArray = [(format["<t size='1.5' align='center'>Objective %1 ", ([_module] call FNF_ClientSide_fnc_getDisplayObjNumber)])];

_notificationType = "info";

//set values based on a succed or fail
if (_serverState isEqualTo 4) then
{
	_task setTaskState "Succeeded";
	_childTaskTarget setTaskState "Succeeded";
	_childTaskDropOff setTaskState "Succeeded";
	_stringArray pushBack "Complete";
	_notificationType = "success";
};
if (_serverState isEqualTo 5) then
{
	_task setTaskState "Failed";
	_childTaskTarget setTaskState "Failed";
	_childTaskDropOff setTaskState "Failed";
	_stringArray pushBack "Failed";
	_notificationType = "failure";
};

if (fnf_SpectatorSlotUsed) then
{
	_notificationType = "info";
	_stringArray set [-1, "Complete"];
};

if (_alliedTask) then
{
	_stringArray pushBack "<br/>(Ally Objective)";
};
if (alive _targetObject) then
{
	_stringArray pushBack format["</t><br/><br/><t align='center'>%1 has been Escorted</t><br/><br/>", _targetName];
} else {
	_stringArray pushBack format["</t><br/><br/><t align='center'>%1 has been Destroyed</t><br/><br/>", _targetName];
};

_stringArray pushBack format["<img size='6' align='center' image='%1'/>", _targetPic];


_string = _stringArray joinString "";

if (fnf_SpectatorSlotUsed) then
{
	if (not ([_targetObject, _module] call FNF_ClientSide_fnc_checkSecondaryObjective)) then
	{
		[_string, _notificationType, 10, 20] call FNF_ClientSide_fnc_notificationSystem;
	};
} else {
	[_string, _notificationType, 10, 20] call FNF_ClientSide_fnc_notificationSystem;
};

fnf_objectives set [_objectiveIndex, [_serverState, _module, _task, _alliedTask, _codeOnCompletion, _params]];

call _codeOnCompletion;
