/*
	Author: Mallen

	Description:
    init a capture sector objective for spectator

	Parameter(s):
		0: OBJECT -  The capture sector objective module to be processed

	Returns:
		None
*/

params ["_objective"];

//get the objective type
_objectiveType = _objective getVariable ["fnf_objectiveType", "FAILED"];

//if no type found exit obj settup and inform mission maker
if (_objectiveType == "FAILED") exitWith
{
  if (fnf_debug) then
  {
    systemChat "DANGER: Capture Sector objective does not have objective type set, objective will NOT function";
  };
};

_zonePrefix = _objective getVariable ["fnf_prefix", "FAILED"];

//if no type found exit obj settup and inform mission maker
if (_zonePrefix == "FAILED") exitWith
{
  if (fnf_debug) then
  {
    systemChat "DANGER: Capture Sector objective does not have marker prefix set, objective will NOT function";
  };
};

//get objective number
_objNum = str((count fnf_objectives) + 1);

//get sector number
_secNum = _objNum;

//check if zone already exists, if not create it
_result = [_zonePrefix] call FNF_ClientSide_fnc_verifyZone;
if (not _result) then
{
  _resultAddZone = [_zonePrefix, "Sector " + _secNum, true, false] call FNF_ClientSide_fnc_addZone;
  if (not _resultAddZone) exitWith
  {
    if (fnf_debug) then
    {
      systemChat "DANGER: Capture Sector objective zone failed to be initialised, objective will NOT function";
    };
  };

  _taskPos = [_zonePrefix] call FNF_ClientSide_fnc_getVisualCenter;

  _colour = [playerSide, false] call BIS_fnc_sideColor;

  _text = format ["<t align='center' size='1.25' font='PuristaBold' color='#FFFFFF' shadow='2'>%1</t>", _secNum];

  _texture = "\A3\ui_f\data\map\markers\nato\n_installation.paa";

  _statusSlotID = [-1, _text, _texture, _colour, 1, _taskPos, 0] call BIS_fnc_setMissionStatusSlot;

  //add objective to objective stack
  fnf_objectives pushBack ["CAPTURESECTOR", _objective, _statusSlotID, _objNum];
} else {
  _displayName = [_zonePrefix] call FNF_ClientSide_fnc_getDisplayName;
  _displayNameArray = _displayName splitString " ";
  _secNum = _displayNameArray select 1;
};
