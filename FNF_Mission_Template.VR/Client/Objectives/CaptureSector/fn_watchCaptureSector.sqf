/*
	Author: Mallen

	Description:
    watch a capture sector objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		1: ARRAY - Array that objective is stored in

	Returns:
		Boolean
*/

params["_objEntry"];

_objEntry params["_objType","_objectiveModule","_task","_forPlayer","_statusSlotID"];

_zonePrefix = _objectiveModule getVariable ["fnf_prefix", "FAILED"];

if (_zonePrefix == "FAILED") exitWith {true;};

_displayName = [_zonePrefix] call FNF_ClientSide_fnc_getDisplayName;
_displayNameArray = _displayName splitString " ";
_secNum = _displayNameArray select 1;

//get server controlled values
_sectorPercentage = _objectiveModule getVariable ["fnf_sector_percentage", 0];
_sectorOwner = _objectiveModule getVariable ["fnf_sector_owner", sideUnknown];

_text = format ["<t align='center' size='1.25' font='PuristaBold' color='#FFFFFF' shadow='2'>%1</t>", _secNum];
_colour = [_sectorOwner, false] call BIS_fnc_sideColor;

_taskPos = [_zonePrefix] call FNF_ClientSide_fnc_getVisualCenter;

_taskType = taskType _task;

_texture = "\A3\ui_f\data\map\markers\nato\n_installation.paa";
_shownPercent = _sectorPercentage;

//if the sector is fully captured, show the percentage as 0
if (_sectorPercentage == 1) then
{
  _shownPercent = 0;
};

//update the status slots
_statusSlotID = [_statusSlotID, _text, _texture, _colour, 1, _taskPos, _shownPercent] call BIS_fnc_setMissionStatusSlot;

_output = false;

//if percentage is 1 (ie captured by someone)
if (_sectorPercentage == 1) then
{
  _output = true;

  _desc = taskDescription _task;
  _splitString = (_desc select 1) splitString " ";
  _objNumWithColon = _splitString select 0;
  _objNum = (_objNumWithColon splitString "") select 0;

  //remove the sector zone
  [_zonePrefix] call FNF_ClientSide_fnc_removeZone;

  //if task is to attack the objective
  if (_taskType == "meet") then
  {
    //pick relevent notification depending on whether the player has captured, ally has, or enemy has
    if (_sectorOwner == playerSide and _forPlayer) then
    {
      _task setTaskState "Succeeded";
      ["<t size='1.5' align='center'>Objective " + _objNum + " Complete</t><br/><br/><t align='center'>Sector " + _secNum + " has been taken by your team</t>", "success"] call FNF_ClientSide_fnc_notificationSystem;
    };
    if ([playerSide, _sectorOwner] call BIS_fnc_sideIsFriendly and _forPlayer) then
    {
      _task setTaskState "Succeeded";
      ["<t size='1.5' align='center'>Objective " + _objNum + " Complete</t><br/><br/><t align='center'>Sector " + _secNum + " has been taken by your allies</t>", "success"] call FNF_ClientSide_fnc_notificationSystem;
    } else {
      if (_sectorOwner != playerSide and _forPlayer) then
      {
        _task setTaskState "Failed";
        ["<t size='1.5' align='center'>Objective " + _objNum + " Failed</t><br/><br/><t align='center'>Sector " + _secNum + " has been taken by the enemy</t>", "failure"] call FNF_ClientSide_fnc_notificationSystem;
      };
    };
    if ([playerSide, _sectorOwner] call BIS_fnc_sideIsFriendly and not _forPlayer) then
    {
      _task setTaskState "Succeeded";
      ["<t size='1.5' align='center'>Objective " + _objNum + " Complete<br/>(Ally Objective)</t><br/><br/><t align='center'>Sector " + _secNum + " has been taken by your allies</t>", "success"] call FNF_ClientSide_fnc_notificationSystem;
    };
    if (_sectorOwner == playerSide and not _forPlayer) then
    {
      _task setTaskState "Succeeded";
      ["<t size='1.5' align='center'>Objective " + _objNum + " Complete<br/>(Ally Objective)</t><br/><br/><t align='center'>Sector " + _secNum + " has been taken by your team</t>", "success"] call FNF_ClientSide_fnc_notificationSystem;
    } else {
      if (not ([playerSide, _sectorOwner] call BIS_fnc_sideIsFriendly) and not _forPlayer) then
      {
        _task setTaskState "Failed";
        ["<t size='1.5' align='center'>Objective " + _objNum + " Failed<br/>(Ally Objective)</t><br/><br/><t align='center'>Sector " + _secNum + " has been taken by the enemy</t>", "failure"] call FNF_ClientSide_fnc_notificationSystem;
      };
    };
  };

  //if defending the sector
  if (_taskType == "defend") then
  {
    //check whether objective is for player or for ally and show notification
    _task setTaskState "Failed";
    if (_forPlayer) then
    {
      ["<t size='1.5' align='center'>Objective " + _objNum + " Failed</t><br/><br/><t align='center'>Sector " + _secNum + " has been taken by the enemy</t>", "failure"] call FNF_ClientSide_fnc_notificationSystem;
    } else {
      ["<t size='1.5' align='center'>Objective " + _objNum + " Failed<br/>(Ally Objective)</t><br/><br/><t align='center'>Sector " + _secNum + " has been taken by the enemy</t>", "failure"] call FNF_ClientSide_fnc_notificationSystem;
    };
  };
};

_output;
