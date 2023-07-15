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

//get which players are in the zone and what side they are on
{
  if (not alive _x) then
  {
    continue;
  };

  if ([_x, _zonePrefix] call FNF_ClientSide_fnc_isObjectInZone) then
  {
    _testSide = side _x;
    if (_testSide == west) then
    {
      _westCount = _westCount + 1;
    };
    if (_testSide == independent) then
    {
      _indiCount = _indiCount + 1;
    };
    if (_testSide == east) then
    {
      _eastCount = _eastCount + 1;
    };
  };
} forEach allPlayers;

_westAttack = false;
_eastAttack = false;
_indiAttack = false;

_westDefend = false;
_eastDefend = false;
_indiDefend = false;

//figure out what sides are supposed to be attacking and defending the zone
{
  if ((_x select 1) isNotEqualTo "CAPTURESECTOR") then {continue;};

  _checkingZonePrefix = (_x select 3) getVariable ["fnf_prefix", "FAILED"];
  if (_checkingZonePrefix != _zonePrefix) then {continue;};

  _objSide = (_x select 2);

  _objectiveType = (_x select 3) getVariable ["fnf_objectiveType", "FAILED"];

  if (_objectiveType == "cap") then
  {
    if (_objSide == west) then
    {
      _westAttack = true;
    };
    if (_objSide == east) then
    {
      _eastAttack = true;
    };
    if (_objSide == independent) then
    {
      _indiAttack = true;
    };
  } else {
    if (_objSide == west) then
    {
      _westDefend = true;
    };
    if (_objSide == east) then
    {
      _eastDefend = true;
    };
    if (_objSide == independent) then
    {
      _indiDefend = true;
    };
  };

} foreach fnf_serverObjectives;

//zero out sides who do not have a stake in the objective
if (not _westAttack and not _westDefend) then
{
  _westCount = 0;
};
if (not _eastAttack and not _eastDefend) then
{
  _eastCount = 0;
};
if (not _indiAttack and not _indiDefend) then
{
  _indiCount = 0;
};

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

//if no one in the sector dont do anything
if (_westCount == 0 and _eastCount == 0 and _indiCount == 0) exitWith {false};


//start making changes now data is gathered
_timeToCapture = _objective getVariable ["fnf_TimeToCapture", 60];

_currentPercent = _objective getVariable ["fnf_sector_percentage", 0];

_currentTime = _timeToCapture * _currentPercent;

_newOwner = sideUnknown;

//get new owner of sector
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

//check if the owner is attacking the objective
_attacking = false;
if (_newOwner == west) then
{
  if (_westAttack) then
  {
    _attacking = true;
  };
};
if (_newOwner == east) then
{
  if (_eastAttack) then
  {
    _attacking = true;
  };
};
if (_newOwner == independent) then
{
  if (_indiAttack) then
  {
    _attacking = true;
  };
};

//if theyy are attacking and there is still time left before full capture is acheived add a second
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

//if new owner is not the same as previous owner and the time isnt 0 detract time and keep owner
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
