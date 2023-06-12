/*
	Author: Mallen

	Description:
    init a capture sector objective including setting up server watch

	Parameter(s):
		0: OBJECT -  The capture sector objective module to be processed
    1: SIDE -  The side that the objective is assigned to

	Returns:
		None
*/

params ["_objective", "_side"];

_zonePrefix = _objective getVariable ["fnf_prefix", "FAILED"];

//if no type found exit obj settup and inform mission maker
if (_zonePrefix == "FAILED") exitWith
{testing = true;};

_objectiveType = _objective getVariable ["fnf_objectiveType", "FAILED"];

//check if zone already exists, if not create it
_result = [_zonePrefix] call FNF_ClientSide_fnc_verifyZone;
if (not _result and isDedicated) then
{
  _resultAddZone = [_zonePrefix, "", false, false] call FNF_ClientSide_fnc_addZone;
  if (not _resultAddZone) exitWith
  {};
} else {};

if (_objectiveType == "cap") then
{
  if (_side == west) then
  {
    _objective setVariable ["fnf_sector_westAttack", true];
  };
  if (_side == east) then
  {
    _objective setVariable ["fnf_sector_eastAttack", true];
  };
  if (_side == independent) then
  {
    _objective setVariable ["fnf_sector_indiAttack", true];
  };
} else {
  if (_side == west) then
  {
    _objective setVariable ["fnf_sector_westDefend", true];
  };
  if (_side == east) then
  {
    _objective setVariable ["fnf_sector_eastDefend", true];
  };
  if (_side == independent) then
  {
    _objective setVariable ["fnf_sector_indiDefend", true];
  };
};

//add objective to objective stack
fnf_serverObjectives pushBack ["CAPTURESECTOR", _side, _objective];
