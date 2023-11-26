/*
	Author: Mallen

	Description:
    watch a capture sector objective for spectators

	Parameter(s):
		1: ARRAY - Array that objective is stored in

	Returns:
		Boolean
*/

params["_objEntry"];

_objEntry params["_objType","_objectiveModule","_statusSlotID","_objNum","_task"];

_zonePrefix = _objectiveModule getVariable ["fnf_prefix", "FAILED"];

if (_zonePrefix isEqualTo "FAILED") exitWith {true;};

_displayName = [_zonePrefix] call FNF_ClientSide_fnc_getDisplayName;
_displayNameArray = _displayName splitString " ";
_secNum = _displayNameArray select 1;

//get server controlled values
_sectorPercentage = _objectiveModule getVariable ["fnf_sector_percentage", 0];
_sectorOwner = _objectiveModule getVariable ["fnf_sector_owner", sideUnknown];

_text = format ["<t align='center' size='1.25' font='PuristaBold' color='#FFFFFF' shadow='2'>%1</t>", _secNum];
_colour = [_sectorOwner, false] call BIS_fnc_sideColor;

_taskPos = [_zonePrefix] call FNF_ClientSide_fnc_getVisualCenter;

_texture = "\A3\ui_f\data\map\markers\nato\n_installation.paa";
_shownPercent = _sectorPercentage;

//if the sector is fully captured, show the percentage as 0
if (_sectorPercentage isEqualTo 1) then
{
  _shownPercent = 0;
};

//update the status slots
_statusSlotID = [_statusSlotID, _text, _texture, _colour, 1, _taskPos, _shownPercent] call BIS_fnc_setMissionStatusSlot;

_output = false;

//if percentage is 1 (ie captured by someone)
if (_sectorPercentage isEqualTo 1) then
{
  _output = true;

  //remove the sector zone
  [_zonePrefix] call FNF_ClientSide_fnc_removeZone;

  ["<t size='1.5' align='center'>Objective " + _objNum + " Complete</t><br/><br/><t align='center'>Sector " + _secNum + " has been taken by " + _sectorOwner + "</t>", "success"] call FNF_ClientSide_fnc_notificationSystem;
};

_output;
