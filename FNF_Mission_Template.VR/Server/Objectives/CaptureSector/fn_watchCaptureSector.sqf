/*
	Author: Mallen

	Description:
		watch a capture sector objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		1: OBJECT -	The sector objective to be processed

	Returns:
		Boolean
*/

params ["_objectiveIndex"];

_objEntry = fnf_serverObjectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_objType = _module getVariable ["fnf_objectiveType", "cap"];

_params params ["_zonePrefix", "_offendingSides"];

_validSides = [];

_westAttack = false;
_eastAttack = false;
_indiAttack = false;

_westDefend = false;
_eastDefend = false;
_indiDefend = false;

//figure out what sides are supposed to be attacking and defending the zone
{
	_x params ["_side", "_attacking"];
	_validSides pushBackUnique _side;

	if (_attacking) then
	{
		if (_side isEqualTo west) then
		{
			_westAttack = true;
		};
		if (_side isEqualTo east) then
		{
			_eastAttack = true;
		};
		if (_side isEqualTo independent) then
		{
			_indiAttack = true;
		};
	} else {
		if (_side isEqualTo west) then
		{
			_westDefend = true;
		};
		if (_side isEqualTo east) then
		{
			_eastDefend = true;
		};
		if (_side isEqualTo independent) then
		{
			_indiDefend = true;
		};
	};

} foreach _offendingSides;

_westCount = 0;
_eastCount = 0;
_indiCount = 0;

//get which players are in the zone and what side they are on
{
	if (not alive _x) then
	{
		continue;
	};

	if (isObjectHidden  _x) then
	{
		continue;
	};

	if (_x getVariable ["ACE_isUnconscious", false]) then
	{
		continue;
	};

	if (not ((side _x) in _validSides)) then
	{
		continue;
	};

	if ([_x, _zonePrefix] call FNF_ClientSide_fnc_isObjectInZone) then
	{
		_testSide = side _x;
		if (_testSide isEqualTo west) then
		{
			_westCount = _westCount + 1;
		};
		if (_testSide isEqualTo independent) then
		{
			_indiCount = _indiCount + 1;
		};
		if (_testSide isEqualTo east) then
		{
			_eastCount = _eastCount + 1;
		};
	};
} forEach allPlayers;

_currentOwner = _module getVariable ["fnf_sector_owner", sideUnknown];

_objectiveType = _module getVariable ["fnf_objectiveType", "FAILED"];

//if no one in the sector dont do anything
if (_westCount isEqualTo 0 and _eastCount isEqualTo 0 and _indiCount isEqualTo 0) exitWith {};


//start making changes now data is gathered
_timeToCapture = _module getVariable ["fnf_TimeToCapture", 60];

_currentPercent = _module getVariable ["fnf_sector_percentage", 0];

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
if (_newOwner isEqualTo west) then
{
	if (_westAttack) then
	{
		_attacking = true;
	};
};
if (_newOwner isEqualTo east) then
{
	if (_eastAttack) then
	{
		_attacking = true;
	};
};
if (_newOwner isEqualTo independent) then
{
	if (_indiAttack) then
	{
		_attacking = true;
	};
};

//if theyy are attacking and there is still time left before full capture is acheived add a second
if (_attacking) then
{
	if (_newOwner isEqualTo _currentOwner and _currentTime < _timeToCapture) then
	{
		_newTime = _currentTime + 1;
	};
	if ([_newOwner, _currentOwner] call BIS_fnc_sideIsFriendly and _currentTime < _timeToCapture) then
	{
		_newTime = _currentTime + 1;
	};
};

//if new owner is not the same as previous owner and the time isnt 0 detract time and keep owner
if (_newOwner isNotEqualTo sideUnknown and _newOwner isNotEqualTo _currentOwner and _currentTime > 0) then
{
	_newTime = _currentTime - 1;
	_newOwner = _currentOwner;
};

if (_newOwner isEqualTo sideUnknown) then
{
	_newOwner = _currentOwner;
};

if (_newOwner isNotEqualTo _currentOwner) then
{
	_module setVariable ["fnf_sector_owner", _newOwner, true];
};

if (_newTime >= _timeToCapture) then
{
	_module setVariable ["fnf_sector_percentage", 1, true];
	_newObjState = 5;
	if (_objType isEqualTo "cap") then
	{
		_newObjState = 4;
	};

	_module setVariable ["fnf_objServerState", _newObjState, true];

	fnf_serverObjectives set [_objectiveIndex, [_newObjState, _module, _task, _alliedTask, _codeOnCompletion, _params]];

	call _codeOnCompletion;
};

_newPercent = _newTime / _timeToCapture;
if (_newPercent isNotEqualTo _currentPercent) then
{
	_module setVariable ["fnf_sector_percentage", _newPercent, true];
};
