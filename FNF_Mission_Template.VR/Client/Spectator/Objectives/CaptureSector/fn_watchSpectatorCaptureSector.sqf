/*
	Author: Mallen

	Description:
		watch a Sector objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		0: INTEGER -	The index of the objective to watch

	Returns:
		Boolean
*/

params ["_objectiveIndex"];

_objEntry = fnf_objectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_serverState = _module getVariable ["fnf_objServerState", 3];

_params params ["_zonePrefix", "_centerObject", "_marker", "_statusSlotID"];
_isSecondaryObj = [_zonePrefix, _module] call FNF_ClientSide_fnc_checkSecondaryObjective;

_sectorPercentage = _module getVariable ["fnf_sector_percentage", 0];

//get server controlled values
if (not _isSecondaryObj) then {
	_sectorOwner = _module getVariable ["fnf_sector_owner", sideUnknown];

	_text = format ["<t align='center' size='1.25' font='PuristaBold' color='#FFFFFF' shadow='2'>%1</t>", _objectiveIndex + 1];
	_colour = [_sectorOwner, false] call BIS_fnc_sideColor;

	_taskPos = [_zonePrefix] call FNF_ClientSide_fnc_getVisualCenter;

	_texture = "\A3\ui_f\data\map\markers\nato\n_installation.paa";
	_shownPercent = _sectorPercentage;

	//if the sector is fully captured, show the percentage as 1
	if (_sectorPercentage > 1) then
	{
		_shownPercent = 1;
	};

	//update the status slots
	_statusSlotID = [_statusSlotID, _text, _texture, _colour, 1, _taskPos, _shownPercent] call BIS_fnc_setMissionStatusSlot;
};

if (_serverState isEqualTo 3) exitWith {};

//remove capture zone
[_zonePrefix] call FNF_ClientSide_fnc_removeZone;

_stringArray = [(format["<t size='1.5' align='center'>Objective %1 Complete", (_objectiveIndex + 1)])];

_notificationType = "info";
_marker setMarkerTextLocal "(Complete) Sector OBJ";

if (_serverState isEqualTo 4) then
{
	_task setTaskState "Succeeded";
};
if (_serverState isEqualTo 5) then
{
	_task setTaskState "Failed";
};

_stringArray pushBack "</t><br/><br/><t align='center'>Sector has ";

if (_sectorPercentage >= 1) then
{
	_stringArray pushBack "not been captured in time</t><br/><br/>";
} else {
	_stringArray pushBack "been captured</t><br/><br/>";
};

_string = _stringArray joinString "";
if (not _isSecondaryObj) then
{
	[_string, _notificationType, 10, 20] call FNF_ClientSide_fnc_notificationSystem;
};

fnf_objectives set [_objectiveIndex, [_serverState, _module, _task, _alliedTask, _codeOnCompletion, _params]];

call _codeOnCompletion;
