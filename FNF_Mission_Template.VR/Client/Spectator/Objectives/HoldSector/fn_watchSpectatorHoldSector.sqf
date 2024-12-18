/*
	Author: Mallen

	Description:
		watch a hold sector objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		1: INTEGER -	The index of the objective to watch

	Returns:
		Boolean
*/

params ["_objectiveIndex"];

_objEntry = fnf_objectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_serverState = _module getVariable ["fnf_objServerState", 3];

_params params ["_zonePrefix", "_centerObject", "_markerArray", "_statusSlotID", "_activeSides"];
_isSecondaryObj = [_zonePrefix, _module] call FNF_ClientSide_fnc_checkSecondaryObjective;

_maxValue = _module getVariable ['fnf_PointsForCompletion', 1000];

//get server controlled values
if (not _isSecondaryObj) then {
	_sectorPercentage = _module getVariable ["fnf_sector_percentage", 0];
	_sectorOwner = _module getVariable ["fnf_sector_owner", sideUnknown];
	_sectorEstablishValues = _module getVariable ["fnf_sector_establish_values", [0,0,0]];

	_text = format ["<t align='center' size='1.25' font='PuristaBold' color='#FFFFFF' shadow='2'>%1</t>", _objectiveIndex + 1];
	_colour = [_sectorOwner, false] call BIS_fnc_sideColor;

	_taskPos = [_zonePrefix] call FNF_ClientSide_fnc_getVisualCenter;

	_taskType = taskType _task;

	_texture = "\A3\ui_f\data\map\markers\nato\u_installation.paa";
	_shownPercent = _sectorPercentage;

	//if the sector is fully captured, show the percentage as 1
	if (_sectorPercentage > 1) then
	{
		_shownPercent = 1;
	};

	//update the status slots
	_statusSlotID = [_statusSlotID, _text, _texture, _colour, 1, _taskPos, _shownPercent] call BIS_fnc_setMissionStatusSlot;

	//update zone colour
	if (_sectorOwner isNotEqualTo sideUnknown) then
	{
		_colour = [_sectorOwner, true] call BIS_fnc_sideColor;
		[_zonePrefix, _colour] call FNF_ClientSide_fnc_setZoneColour;
	};

	//update marker values
	_markerArray params ["_markerBase", "_markerBlufor", "_markerOpfor", "_markerIndfor"];
	if (ace_spectator_isset) then
	{
		_markerBase setMarkerTextLocal format["Sector %1", _objectiveIndex + 1];
	} else {
		_markerBase setMarkerTextLocal "";
	};

	_markerHashMap = createHashMapFromArray [[west, _markerBlufor], [east, _markerOpfor], [independent, _markerIndfor]];
	_markerPrevHashMap = createHashMapFromArray [[west, _markerBase], [east, _markerBlufor], [independent, _markerOpfor]];

	{
		_marker = _markerHashMap get _x;
		_prevMarker = _markerPrevHashMap get _x;
		_prevMarkerText = markerText _prevMarker;
		_currentValue = _sectorEstablishValues select _forEachIndex;
		_marker setMarkerTextLocal format["%1 [%2/%3]", _prevMarkerText, _currentValue, _maxValue];
	} forEach _activeSides;
};

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
	//_markerBase setMarkerTextLocal format["(Complete) Sector %1", (_objectiveIndex + 1)];
};
if (_serverState isEqualTo 5) then
{
	_task setTaskState "Failed";
	_stringArray pushBack "Failed";
	_notificationType = "failure";
	//_markerBase setMarkerTextLocal format["(Failed) Sector %1", (_objectiveIndex + 1)];
};

if (_alliedTask) then
{
	_stringArray pushBack "<br/>(Ally Objective)";
};

_stringArray pushBack "</t><br/><br/><t align='center'>Sector has ";

//this is irrespective of obj outcome and therefor is based on status of vic
_sideIndex = _activeSides find playerSide;
if ((_sectorEstablishValues select _sideIndex) >= _maxValue) then
{
	_stringArray pushBack "been captured and established</t><br/><br/>";
} else {
	_sectorEstablished = false;

	{
		if (_x >= _maxValue) then
		{
			_sectorEstablished = true;
			_stringArray pushBack "been captured and established by the enemy</t><br/><br/>";
			break;
		}
	} foreach _sectorEstablishValues;

	if (not _sectorEstablished) then
	{
		_stringArray pushBack "not been captured and established in time</t><br/><br/>";
	};
};

_string = _stringArray joinString "";

[_string, _notificationType, 10, 20] call FNF_ClientSide_fnc_notificationSystem;

fnf_objectives set [_objectiveIndex, [_serverState, _module, _task, _alliedTask, _codeOnCompletion, _params]];

call _codeOnCompletion;
