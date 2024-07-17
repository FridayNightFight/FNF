/*
	Author: Mallen

	Description:
		watch a destroy objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		1: INTEGER -	The index of the objective to watch

	Returns:
		Boolean
*/

params ["_objectiveIndex"];

_objEntry = fnf_objectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_serverState = _module getVariable ["fnf_objServerState", 3];

_params params ["_targetObject", "_hidingZonesAssigned", "_marker"];

if (_serverState isEqualTo 3) exitWith {};

[_task] call FNF_ClientSide_fnc_removeTaskfromTaskControl;

//get objects name and picture
_targetConfig = _targetObject call CBA_fnc_getObjectConfig;
_targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;
_targetName = getText (_targetConfig >> "DisplayName");

_stringArray = [(format["<t size='1.5' align='center'>Objective %1 ", (_objectiveIndex + 1)])];

_notificationType = "info";

if (_serverState isEqualTo 4) then
{
	_task setTaskState "Succeeded";
	_stringArray pushBack "Complete";
	_notificationType = "success";
	_marker setMarkerTextLocal format["(Complete) Destroy %1", (_objectiveIndex + 1)];
};
if (_serverState isEqualTo 5) then
{
	_task setTaskState "Failed";
	_stringArray pushBack "Failed";
	_notificationType = "failure";
	_marker setMarkerTextLocal format["(Failed) Destroy %1", (_objectiveIndex + 1)];
};

if (_alliedTask) then
{
	_stringArray pushBack "<br/>(Ally Objective)";
};

_stringArray pushBack format["</t><br/><br/><t align='center'>%1 has ", _targetName];

if (alive _targetObject) then
{
	_stringArray pushBack "not been destroyed in time</t><br/><br/>";
} else {
	_stringArray pushBack "been destroyed</t><br/><br/>";
};

_stringArray pushBack format["<img size='6' align='center' image='%1'/>", _targetPic];

_string = _stringArray joinString "";

[_string, _notificationType, 10, 20] call FNF_ClientSide_fnc_notificationSystem;

fnf_objectives set [_objectiveIndex, [_serverState, _module, _task, _alliedTask, _codeOnCompletion, _params]];

call _codeOnCompletion;
