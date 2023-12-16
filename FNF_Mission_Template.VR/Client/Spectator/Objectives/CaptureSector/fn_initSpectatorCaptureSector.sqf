/*
	Author: Mallen

	Description:
    init a capture sector objective for spectator

	Parameter(s):
		0: OBJECT -  The capture sector objective module to be processed

	Returns:
		None
*/

params ["_objective","_side"];

//get the objective type
_objectiveType = _objective getVariable ["fnf_objectiveType", "FAILED"];

//if no type found exit obj settup and inform mission maker
if (_objectiveType isEqualTo "FAILED") exitWith
{
  if (fnf_debug) then
  {
    systemChat "DANGER: Capture Sector objective does not have objective type set, objective will NOT function";
  };
};

_zonePrefix = _objective getVariable ["fnf_prefix", "FAILED"];

//if no type found exit obj settup and inform mission maker
if (_zonePrefix isEqualTo "FAILED") exitWith
{
  if (fnf_debug) then
  {
    systemChat "DANGER: Capture Sector objective does not have marker prefix set, objective will NOT function";
  };
};

//get objective number
_objNum = str(({_x select 0 isNotEqualTo "DESTROYDUPE" and _x select 0 isNotEqualTo "CAPTURESECTORDUPE" and _x select 0 isNotEqualTo "TERMINALDUPE" and _x select 0 isNotEqualTo "ASSASSINDUPE"} count fnf_objectives) + 1);


//get sector number
_secNum = _objNum;

_statusSlotID = "NOT SET";

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

} else {
  //if zone does exist update sec number and obj number
  _displayName = [_zonePrefix] call FNF_ClientSide_fnc_getDisplayName;
  _displayNameArray = _displayName splitString " ";
  _secNum = _displayNameArray select 1;
  _objNum = _secNum;
};

_task = "";

//create and setup objective task
if (_objectiveType isEqualTo "cap") then
{

  _task = player createSimpleTask [(_objNum + ": Capture Sector " + _secNum)];
  _task setSimpleTaskDescription ["To complete this objective " + ([_side] call BIS_fnc_sideName) + " must have more players on their side or their allies side than any enemies to capture the sector", _objNum + ": Capture sector " + _secNum, _objNum + ": Capture sector " + _secNum];

  _task setSimpleTaskType "meet";
} else {

  _task = player createSimpleTask [(_objNum + ": Defend Sector " + _secNum)];
  _task setSimpleTaskDescription ["To complete this objective " + ([_side] call BIS_fnc_sideName) + " must have more players on their side or their allies side than any enemies to defend the sector", _objNum + ": Defend sector " + _secNum, _objNum + ": Defend sector " + _secNum];

  _task setSimpleTaskType "defend";
};

if (_statusSlotID isEqualTo "NOT SET") then
{
  fnf_objectives pushBack ["CAPTURESECTORDUPE", _objective, _task];
} else {
  fnf_objectives pushBack ["CAPTURESECTOR", _objective, _statusSlotID, _objNum, _task];
};

