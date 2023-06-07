/*
	Author: Mallen

	Description:
    watch a capture sector objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		1: OBJECT -  The sector objective to be processed

	Returns:
		Boolean
*/

params["_objective", "_side"];

_zonePrefix = _objective getVariable ["fnf_prefix", "FAILED"];

_westCount = 0;
_eastCount = 0;
_indiCount = 0;

{
  if (not alive _x) then
  {
    continue;
  };

  if ([_x, _zonePrefix] call FNF_ClientSide_fnc_isObjectInZone) then
  {
    _side = side _x;
    if (_side == west) then
    {
      _westCount = _westCount + 1;
    };
    if (_side == independent) then
    {
      _indiCount = _indiCount + 1;
    };
    if (_side == east) then
    {
      _eastCount = _eastCount + 1;
    };
  };
} forEach allPlayers;

if (not (_objective getVariable ["fnf_sector_westAttack",false]) and not (_objective getVariable ["fnf_sector_westDefend",false])) then
{
  _westCount = 0;
};
if (not (_objective getVariable ["fnf_sector_eastAttack",false]) and not (_objective getVariable ["fnf_sector_eastDefend",false])) then
{
  _eastCount = 0;
};
if (not (_objective getVariable ["fnf_sector_indiAttack",false]) and not (_objective getVariable ["fnf_sector_indiDefend",false])) then
{
  _indiCount = 0;
};

if (_westCount == 0 and _eastCount == 0 and _indiCount == 0) exitWith {false};


//start making changes now data is gathered
_timeToCapture = _objective getVariable ["fnf_TimeToCapture", 60];

_currentPercent = _objective getVariable ["fnf_sector_percentage", 0];

_currentTime = _timeToCapture * _currentPercent;

_currentOwner = _objective getVariable ["fnf_sector_owner", sideUnknown];

_objectiveType = _objective getVariable ["fnf_objectiveType", "FAILED"];

if (_objectiveType == "def") then
{
  if (_currentOwner == sideUnknown) then
  {
    _objective setVariable ["fnf_sector_owner", _side, true];
    _currentOwner = _side;
  };
};

_newOwner = sideUnknown;

if (_westCount > _eastCount and _westCount > _indiCount) then
{
  _newOwner = west;
};
if (_eastCount > _westCount and _eastCount > _indiCount) then
{
  _newOwner = east;
};
if (_indiCount > _eastCount and _indiCount > _westCount) then
{
  _newOwner = independent;
};

_newTime = _currentTime;

_attacking = false;
if (_newOwner == west) then
{
  if (_objective getVariable ["fnf_sector_westAttack",false]) then
  {
    _attacking = true;
  };
};
if (_newOwner == east) then
{
  if (_objective getVariable ["fnf_sector_eastAttack",false]) then
  {
    _attacking = true;
  };
};
if (_newOwner == independent) then
{
  if (_objective getVariable ["fnf_sector_indiAttack",false]) then
  {
    _attacking = true;
  };
};

if (_attacking) then
{
  if (_newOwner == _currentOwner and _currentTime != _timeToCapture) then
  {
    _newTime = _currentTime + 1;
  };
  if ([_newOwner, _currentOwner] call BIS_fnc_sideIsFriendly and _currentTime != _timeToCapture) then
  {
    _newTime = _currentTime + 1;
  };
};

if (_newOwner != sideUnknown and _newOwner != _currentOwner and _currentTime != 0) then
{
  _newTime = _currentTime - 1;
  _newOwner = _currentOwner;
};

if (_newOwner == sideUnknown) then
{
  _newOwner = _currentOwner;
};

if (_newOwner != _currentOwner) then
{
  _objective setVariable ["fnf_sector_owner", _newOwner, true];
};

if (_newTime == _timeToCapture) exitWith
{
  _objective setVariable ["fnf_sector_percentage", 1, true];
  true;
};

_newPercent = _newTime / _timeToCapture;
if (_newPercent != _currentPercent) then
{
  _objective setVariable ["fnf_sector_percentage", _newPercent, true];
};


false;
