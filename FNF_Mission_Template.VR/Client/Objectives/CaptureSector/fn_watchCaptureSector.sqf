/*
	Author: Mallen

	Description:
		watch a capture sector objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		1: INTEGER -	The index of the objective to watch

	Returns:
		Boolean
*/

params ["_objectiveIndex"];

_objEntry = fnf_objectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_serverState = _module getVariable ["fnf_objServerState", 3];

_params params ["_zonePrefix", "_centerObject", "_marker", "_statusSlotID"];

//get server controlled values
_sectorPercentage = _module getVariable ["fnf_sector_percentage", 0];
_sectorOwner = _module getVariable ["fnf_sector_owner", sideUnknown];

_text = format ["<t align='center' size='1.25' font='PuristaBold' color='#FFFFFF' shadow='2'>%1</t>", _objectiveIndex + 1];
_colour = [_sectorOwner, false] call BIS_fnc_sideColor;

_taskPos = [_zonePrefix] call FNF_ClientSide_fnc_getVisualCenter;

_taskType = taskType _task;

_texture = "\A3\ui_f\data\map\markers\nato\n_installation.paa";
_shownPercent = _sectorPercentage;

//if the sector is fully captured, show the percentage as 1
if (_sectorPercentage > 1) then
{
	_shownPercent = 1;
};

//update the status slots
_statusSlotID = [_statusSlotID, _text, _texture, _colour, 1, _taskPos, _shownPercent] call BIS_fnc_setMissionStatusSlot;

if (_serverState isEqualTo 3) exitWith {};

//remove capture zone
[_zonePrefix] call FNF_ClientSide_fnc_removeZone;

[_task] call FNF_ClientSide_fnc_removeTaskfromTaskControl;

//start notification creation
_stringArray = [(format["<t size='1.5' align='center'>Objective %1 ", (_objectiveIndex + 1)])];

_notificationType = "info";

//set values based on a succed or fail
if (_serverState isEqualTo 4) then
{
	_task setTaskState "Succeeded";
	_stringArray pushBack "Complete";
	_notificationType = "success";
	_marker setMarkerTextLocal format["(Complete) Sector %1", (_objectiveIndex + 1)];
};
if (_serverState isEqualTo 5) then
{
	_task setTaskState "Failed";
	_stringArray pushBack "Failed";
	_notificationType = "failure";
	_marker setMarkerTextLocal format["(Failed) Sector %1", (_objectiveIndex + 1)];
};

if (_alliedTask) then
{
	_stringArray pushBack "<br/>(Ally Objective)";
};

_stringArray pushBack "</t><br/><br/><t align='center'>Sector has ";

//this is irrespective of obj outcome and therefor is based on status of vic
if (_sectorPercentage >= 1) then
{
	_stringArray pushBack "been captured</t><br/><br/>";
} else {
	_stringArray pushBack "not been captured in time</t><br/><br/>";
};

_string = _stringArray joinString "";

[_string, _notificationType, 10, 20] call FNF_ClientSide_fnc_notificationSystem;

fnf_objectives set [_objectiveIndex, [_serverState, _module, _task, _alliedTask, _codeOnCompletion, _params]];

call _codeOnCompletion;
