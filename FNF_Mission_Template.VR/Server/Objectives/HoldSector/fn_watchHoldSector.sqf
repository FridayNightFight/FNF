/*
	Author: Mallen

	Description:
		watch a hold sector objective including updating task, returns if objective has been completed (failed for protection objectives)

	Parameter(s):
		1: OBJECT -	The sector objective to be processed

	Returns:
		Boolean
*/

params ["_objectiveIndex"];

_objEntry = fnf_serverObjectives select _objectiveIndex;

_objEntry params ["_objState", "_module", "_task", "_alliedTask", "_codeOnCompletion", "_params"];

_params params ["_zonePrefix", "_sides", "_mainObjSide"];

_sectorEstablishValues = _module getVariable ["fnf_sector_establish_values", [0,0,0]];

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

	if (not ((side _x) in _sides)) then
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

_currentPercent = _module getVariable ["fnf_sector_percentage", 0];

_maxPoints = _module getVariable ["fnf_PointsForCompletion", 1000];

_notificationSent = _module getVariable ["fnf_notificationSent", false];

if (_currentPercent >= 1) then
{
	//add score for side that has sector
	_indexToLookAt = _sides find _currentOwner;
	_currentEstablishValue = _sectorEstablishValues select _indexToLookAt;

	_pointsToAdd = _module getVariable ["fnf_PointsPerSecond", 1];

	if (_currentEstablishValue < _maxPoints) then
	{
		_newEstablishValue = _currentEstablishValue + _pointsToAdd;
		_sectorEstablishValues set [_indexToLookAt, _newEstablishValue];
		_module setVariable ["fnf_sector_establish_values", _sectorEstablishValues, true];
	};

	if (not _notificationSent) then
	{
		[[_module, _currentOwner], FNF_ClientSide_fnc_notifyHoldSector] remoteExec ['call', 0, false];
		_module setVariable ["fnf_notificationSent", true];
	};
} else {
	_module setVariable ["fnf_notificationSent", false];
};

_completedEstablishIndex = _sectorEstablishValues find _maxPoints;
if (_completedEstablishIndex isNotEqualTo -1) then
{
	_newObjState = 5;
	if ((_sides select _completedEstablishIndex) isEqualTo _mainObjSide) then
	{
		_newObjState = 4;
	};

	_module setVariable ["fnf_objServerState", _newObjState, true];

	fnf_serverObjectives set [_objectiveIndex, [_newObjState, _module, _task, _alliedTask, _codeOnCompletion, _params]];

	call _codeOnCompletion;
};

//if no one in the sector dont do anything
if (_westCount isEqualTo 0 and _eastCount isEqualTo 0 and _indiCount isEqualTo 0) exitWith {};


//start making changes now data is gathered
_timeToCapture = _module getVariable ["fnf_TimeToCapture", 60];

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

//if theyy are attacking and there is still time left before full capture is acheived add a second

if (_newOwner isEqualTo _currentOwner and _currentTime < _timeToCapture) then
{
	_newTime = _currentTime + 1;
};
if ([_newOwner, _currentOwner] call BIS_fnc_sideIsFriendly and _currentTime < _timeToCapture) then
{
	_newTime = _currentTime + 1;
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

_newPercent = _newTime / _timeToCapture;
if (_newPercent isNotEqualTo _currentPercent) then
{
	_module setVariable ["fnf_sector_percentage", _newPercent, true];
};
