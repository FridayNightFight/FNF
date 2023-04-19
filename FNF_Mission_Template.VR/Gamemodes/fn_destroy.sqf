params[
	"_bluforTargets",
	"_opforTargets",
	"_independentTargets",
	"_bluforItemsToProtect",
	"_opforItemsToProtect",
	"_independentItemsToProtect",
	"_hidingZonePrefixes",
	"_seeWhichTargetIsInWhichHidingZone",
	"_bluforStartZonePrefixs",
	"_opforStartZonePrefixs",
	"_independentStartZonePrefixs",
	"_bluforDestroyTargetsInOrder",
	"_opforDestroyTargetsInOrder",
	"_independentDestroyTargetsInOrder"
];

//set up restriction zones
call FNF_ClientSide_fnc_initZones;
["playzone_"] call FNF_ClientSide_fnc_addZone;
["playzoneGroup", false, true] call FNF_ClientSide_fnc_addRestrictionGroup;
["playzoneGroup", "playzone_"] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;

if (count _bluforStartZonePrefixs > 0) then
{
	fnf_bluforInUse = true;
	["bluforStartzoneGroup", true, true] call FNF_ClientSide_fnc_addRestrictionGroup;
	{
		[_x] call FNF_ClientSide_fnc_addZone;
		["bluforStartzoneGroup", _x] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
	} forEach _bluforStartZonePrefixs
} else
{
	fnf_bluforInUse = false;
};

if (count _opforStartZonePrefixs > 0) then
{
	fnf_bluforInUse = true;
	["opforStartzoneGroup", true, true] call FNF_ClientSide_fnc_addRestrictionGroup;
	{
		[_x] call FNF_ClientSide_fnc_addZone;
		["opforStartzoneGroup", _x] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
	} forEach _opforStartZonePrefixs
} else
{
	fnf_opforInUse = false;
};

if (count _independentStartZonePrefixs > 0) then
{
	fnf_independentInUse = true;
	["independentStartzoneGroup", true, true] call FNF_ClientSide_fnc_addRestrictionGroup;
	{
		[_x] call FNF_ClientSide_fnc_addZone;
		["independentStartzoneGroup", _x] call FNF_ClientSide_fnc_addZoneToRestrictionGroup;
	} forEach _independentStartZonePrefixs
} else
{
	fnf_independentInUse = false;
};

//set up hiding zones
{
	[_x] call FNF_ClientSide_fnc_addZone;
} forEach _hidingZonePrefixes;






//************************************************************************
//SERVER FUNCTIONS
//************************************************************************

if (!isServer) exitWith {};

//TODO: create timer system for startzones and mission timeout

//TODO: set targets to invincible if in order is used

_targetsToWatch = [];

//create tasks
{
	_isDuplicate = false;
	_duplicateIndex = 0;
	_toCompareAgainst = _x;
	{
		if (_x isEqualTo _toCompareAgainst) then
		{
			_isDuplicate = true;
			_duplicateIndex = _forEachIndex;
		};
	} forEach _targetsToWatch;

	if (_isDuplicate) then
	{
		_targetsToWatch select _duplicateIndex pushBack "bluforDestroyTask" + str _forEachIndex;
	} else
	{
		_targetsToWatch pushBack [_x, ["bluforDestroyTask" + str _forEachIndex]];
	};

	[west, "bluforDestroyTask" + str _forEachIndex, ["Destroy the " + name _x, "Destroy", "destroy"]] call BIS_fnc_taskCreate;
} forEach _bluforTargets;

{
	_isDuplicate = false;
	_duplicateIndex = 0;
	_toCompareAgainst = _x;
	{
		if (_x isEqualTo _toCompareAgainst) then
		{
			_isDuplicate = true;
			_duplicateIndex = _forEachIndex;
		};
	} forEach _targetsToWatch;

	if (_isDuplicate) then
	{
		_targetsToWatch select _duplicateIndex pushBack "opforDestroyTask" + str _forEachIndex;
	} else
	{
		_targetsToWatch pushBack [_x, ["opforDestroyTask" + str _forEachIndex]];
	};

	[east, "opforDestroyTask" + str _forEachIndex, ["Destroy the " + name _x, "Destroy", "destroy"]] call BIS_fnc_taskCreate;
} forEach _opforTargets;

{
	_isDuplicate = false;
	_duplicateIndex = 0;
	_toCompareAgainst = _x;
	{
		if (_x isEqualTo _toCompareAgainst) then
		{
			_isDuplicate = true;
			_duplicateIndex = _forEachIndex;
		};
	} forEach _targetsToWatch;

	if (_isDuplicate) then
	{
		_targetsToWatch select _duplicateIndex pushBack "independentDestroyTask" + str _forEachIndex;
	} else
	{
		_targetsToWatch pushBack [_x, ["independentDestroyTask" + str _forEachIndex]];
	};

	[independent, "independentDestroyTask" + str _forEachIndex, ["Destroy the " + name _x, "Destroy", "destroy"]] call BIS_fnc_taskCreate;
} forEach _independentTargets;


{
	_isDuplicate = false;
	_duplicateIndex = 0;
	_toCompareAgainst = _x;
	{
		if (_x isEqualTo _toCompareAgainst) then
		{
			_isDuplicate = true;
			_duplicateIndex = _forEachIndex;
		};
	} forEach _targetsToWatch;

	if (_isDuplicate) then
	{
		_targetsToWatch select _duplicateIndex pushBack "bluforProtectTask" + str _forEachIndex;
	} else
	{
		_targetsToWatch pushBack [_x, ["bluforProtectTask" + str _forEachIndex]];
	};

	[west, "bluforProtectTask" + str _forEachIndex, ["Protect the " + name _x, "Protect", "defend"],_x] call BIS_fnc_taskCreate;
} forEach _bluforItemsToProtect;

{
	_isDuplicate = false;
	_duplicateIndex = 0;
	_toCompareAgainst = _x;
	{
		if (_x isEqualTo _toCompareAgainst) then
		{
			_isDuplicate = true;
			_duplicateIndex = _forEachIndex;
		};
	} forEach _targetsToWatch;

	if (_isDuplicate) then
	{
		_targetsToWatch select _duplicateIndex pushBack "opforProtectTask" + str _forEachIndex;
	} else
	{
		_targetsToWatch pushBack [_x, ["opforProtectTask" + str _forEachIndex]];
	};

	[east, "opforProtectTask" + str _forEachIndex, ["Protect the " + name _x, "Protect", "defend"],_x] call BIS_fnc_taskCreate;
} forEach _opforItemsToProtect;

{
	_isDuplicate = false;
	_duplicateIndex = 0;
	_toCompareAgainst = _x;
	{
		if (_x isEqualTo _toCompareAgainst) then
		{
			_isDuplicate = true;
			_duplicateIndex = _forEachIndex;
		};
	} forEach _targetsToWatch;

	if (_isDuplicate) then
	{
		_targetsToWatch select _duplicateIndex pushBack "independentProtectTask" + str _forEachIndex;
	} else
	{
		_targetsToWatch pushBack [_x, ["independentProtectTask" + str _forEachIndex]];
	};

	[independent, "independentProtectTask" + str _forEachIndex, ["Protect the " + name _x, "Protect", "defend"],_x] call BIS_fnc_taskCreate;
} forEach _independentItemsToProtect;

fnf_targetsToWatch = _targetsToWatch;
fnf_hidingZonePrefixes = _hidingZonePrefixes;
fnf_seeWhichTargetIsInWhichHidingZone = _seeWhichTargetIsInWhichHidingZone;
//watch items to see if they are in a hidden zone
[{
	{
		_hidingZone = "";
		_inHidingZone = false;
		_object = _x select 0;
		{
			if ([_object, _x] call FNF_ClientSide_fnc_isObjectInZone) then
			{
				_inHidingZone = true;
				_hidingZone = _x;
				break;
			};
		} forEach fnf_hidingZonePrefixes;
		if (_inHidingZone) then
		{
			{
				if (["destroy",_x] call BIS_fnc_inString) then
				{
					if (fnf_seeWhichTargetIsInWhichHidingZone) then
					{
						_point = _hidingZone call FNF_ClientSide_fnc_findValidPointWithinZone;
						[_x, _point] call BIS_fnc_taskSetDestination;
					} else
					{
						[_x, objNull] call BIS_fnc_taskSetDestination;
					};
				}
			} forEach (_x select 1);
		} else {
			{
				if (["destroy",_x] call BIS_fnc_inString) then
				{
					[_x, _object] call BIS_fnc_taskSetDestination;
				}
			} forEach (_x select 1);
		};
	} forEach fnf_targetsToWatch;
}, 1] call CBA_fnc_addPerFrameHandler;

//watch items to see if they get destroyed
//TODO: add task control if item is destroyed etc
fnf_bluforTargets = _bluforTargets;
fnf_opforTargets = _opforTargets;
fnf_independentTargets = _independentTargets;
fnf_bluforDestroyTargetsInOrder = _bluforDestroyTargetsInOrder;
fnf_opforDestroyTargetsInOrder = _opforDestroyTargetsInOrder;
fnf_independentDestroyTargetsInOrder = _independentDestroyTargetsInOrder;
[{
	{
		_winningTeams = [];
		_deathProcessed = (_x select 0) getVariable ["deathProcessed", false];
		if (!alive (_x select 0) and !_deathProcessed) then
		{
			(_x select 0) setVariable ["deathProcessed", true, false];
			_objectFoundStillAliveBlufor = false;
			{
				if (alive _x) then
				{
					_objectFoundStillAliveBlufor = true;
					break;
				};
			} forEach (fnf_bluforTargets);
			if (!_objectFoundStillAliveBlufor and count fnf_bluforTargets > 0) then
			{
				_winningTeams pushBack west;
			};

			if (fnf_bluforDestroyTargetsInOrder) then
			{
				_objectKilled = (_x select 0);
				_objectIndex = -1;
				{
					if (_x isEqualTo _objectKilled) then
					{
						_objectIndex = _forEachIndex;
					};
				} forEach (fnf_bluforTargets);
				_nextObject = (fnf_bluforTargets) select (_objectIndex + 1);
				_nextObject allowDamage true;
			};

			_objectFoundStillAliveOpfor = false;
			{
				if (alive _x) then
				{
					_objectFoundStillAliveOpfor = true;
					break;
				};
			} forEach (fnf_opforTargets);
			if (!_objectFoundStillAliveOpfor and count fnf_opforTargets > 0) then
			{
				_winningTeams pushBack east;
			};

			if (fnf_opforDestroyTargetsInOrder) then
			{
				_objectKilled = (_x select 0);
				_objectIndex = -1;
				{
					if (_x isEqualTo _objectKilled) then
					{
						_objectIndex = _forEachIndex;
					};
				} forEach (fnf_opforTargets);
				_nextObject = (fnf_opforTargets) select (_objectIndex + 1);
				_nextObject allowDamage true;
			};

			_objectFoundStillAliveIndependent = false;
			{
				if (alive _x) then
				{
					_objectFoundStillAliveIndependent = true;
					break;
				};
			} forEach (fnf_independentTargets);
			if (!_objectFoundStillAliveIndependent and count fnf_independentTargets > 0) then
			{
				_winningTeams pushBack independent;
			};

			if (fnf_independentDestroyTargetsInOrder) then
			{
				_objectKilled = (_x select 0);
				_objectIndex = -1;
				{
					if (_x isEqualTo _objectKilled) then
					{
						_objectIndex = _forEachIndex;
					};
				} forEach (fnf_independentTargets);
				_nextObject = (fnf_independentTargets) select (_objectIndex + 1);
				_nextObject allowDamage true;
			};
		};
		if (count _winningTeams != 0) then
		{
			[_winningTeams] call FNF_ServerSide_fnc_endGame;
		};
	} forEach fnf_targetsToWatch;
}, 1] call CBA_fnc_addPerFrameHandler;
