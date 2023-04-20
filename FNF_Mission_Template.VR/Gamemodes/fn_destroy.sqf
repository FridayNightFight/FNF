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

//TODO: add system to notify mission maker if in Order is used incorrectly with conflicting starting things or players as destroy items




//************************************************************************
//SERVER FUNCTIONS
//************************************************************************

if (!isServer) exitWith {};

//TODO: create timer system for startzones and mission timeout
//TODO: add system to obtain win if side is killed

_targetsToWatch = [];

//create tasks
//for targets
{
	_isDuplicate = false;
	_duplicateIndex = 0;
	_toCompareAgainst = _x;
  //check if object is already being watched
	{
		if ((_x select 0) isEqualTo _toCompareAgainst) then
		{
			_isDuplicate = true;
			_duplicateIndex = _forEachIndex;
		};
	} forEach _targetsToWatch;

  //if it is add the task created to the watched object
	if (_isDuplicate) then
	{
		((_targetsToWatch select _duplicateIndex) select 1) pushBack "bluforDestroyTask" + str _forEachIndex;
	} else
  //if not add object to be watched
	{
		_targetsToWatch pushBack [_x, ["bluforDestroyTask" + str _forEachIndex]];
	};

  //get object name and picture
  private _targetConfig = _x call CBA_fnc_getObjectConfig;
  private _targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;
  private _targetName = getText (_targetConfig >> "DisplayName");

  //add task to destroy object
	[west, "bluforDestroyTask" + str _forEachIndex, [format["<img image='%1' width='300'>", _targetPic], "Destroy the " + _targetName], objNull, "CREATED", 0, false, "Attack"] call BIS_fnc_taskCreate;
} forEach _bluforTargets;

{
	_isDuplicate = false;
	_duplicateIndex = 0;
	_toCompareAgainst = _x;
	{
		if ((_x select 0) isEqualTo _toCompareAgainst) then
		{
			_isDuplicate = true;
			_duplicateIndex = _forEachIndex;
		};
	} forEach _targetsToWatch;

	if (_isDuplicate) then
	{
		((_targetsToWatch select _duplicateIndex) select 1) pushBack "opforDestroyTask" + str _forEachIndex;
	} else
	{
		_targetsToWatch pushBack [_x, ["opforDestroyTask" + str _forEachIndex]];
	};

  private _targetConfig = _x call CBA_fnc_getObjectConfig;
  private _targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;
  private _targetName = getText (_targetConfig >> "DisplayName");

	[east, "opforDestroyTask" + str _forEachIndex, [format["<img image='%1' width='300'>", _targetPic], "Destroy the " + _targetName], objNull, "CREATED", 0, false, "Attack"] call BIS_fnc_taskCreate;
} forEach _opforTargets;

{
	_isDuplicate = false;
	_duplicateIndex = 0;
	_toCompareAgainst = _x;
	{
		if ((_x select 0) isEqualTo _toCompareAgainst) then
		{
			_isDuplicate = true;
			_duplicateIndex = _forEachIndex;
		};
	} forEach _targetsToWatch;

	if (_isDuplicate) then
	{
		((_targetsToWatch select _duplicateIndex) select 1) pushBack "independentDestroyTask" + str _forEachIndex;
	} else
	{
		_targetsToWatch pushBack [_x, ["independentDestroyTask" + str _forEachIndex]];
	};

  private _targetConfig = _x call CBA_fnc_getObjectConfig;
  private _targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;
  private _targetName = getText (_targetConfig >> "DisplayName");

	[independent, "independentDestroyTask" + str _forEachIndex, [format["<img image='%1' width='300'>", _targetPic], "Destroy the " + _targetName], objNull, "CREATED", 0, false, "Attack"] call BIS_fnc_taskCreate;
} forEach _independentTargets;

//for protects
{
	_isDuplicate = false;
	_duplicateIndex = 0;
	_toCompareAgainst = _x;
	{
		if ((_x select 0) isEqualTo _toCompareAgainst) then
		{
			_isDuplicate = true;
			_duplicateIndex = _forEachIndex;
		};
	} forEach _targetsToWatch;

	if (_isDuplicate) then
	{
		((_targetsToWatch select _duplicateIndex) select 1) pushBack "bluforProtectTask" + str _forEachIndex;
	} else
	{
		_targetsToWatch pushBack [_x, ["bluforProtectTask" + str _forEachIndex]];
	};

  private _targetConfig = _x call CBA_fnc_getObjectConfig;
  private _targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;
  private _targetName = getText (_targetConfig >> "DisplayName");

	[west, "bluforProtectTask" + str _forEachIndex, [format["<img image='%1' width='300'>", _targetPic], "Protect the " + _targetName],_x, "CREATED", 0, false, "Defend"] call BIS_fnc_taskCreate;
} forEach _bluforItemsToProtect;

{
	_isDuplicate = false;
	_duplicateIndex = 0;
	_toCompareAgainst = _x;
	{
		if ((_x select 0) isEqualTo _toCompareAgainst) then
		{
			_isDuplicate = true;
			_duplicateIndex = _forEachIndex;
		};
	} forEach _targetsToWatch;

	if (_isDuplicate) then
	{
		((_targetsToWatch select _duplicateIndex) select 1) pushBack "opforProtectTask" + str _forEachIndex;
	} else
	{
		_targetsToWatch pushBack [_x, ["opforProtectTask" + str _forEachIndex]];
	};

	private _targetConfig = _x call CBA_fnc_getObjectConfig;
  private _targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;
  private _targetName = getText (_targetConfig >> "DisplayName");

	[east, "opforProtectTask" + str _forEachIndex, [format["<img image='%1' width='300'>", _targetPic], "Protect the " + _targetName],_x, "CREATED", 0, false, "Defend"] call BIS_fnc_taskCreate;
} forEach _opforItemsToProtect;

{
	_isDuplicate = false;
	_duplicateIndex = 0;
	_toCompareAgainst = _x;
	{
		if ((_x select 0) isEqualTo _toCompareAgainst) then
		{
			_isDuplicate = true;
			_duplicateIndex = _forEachIndex;
		};
	} forEach _targetsToWatch;

	if (_isDuplicate) then
	{
		((_targetsToWatch select _duplicateIndex) select 1) pushBack "independentProtectTask" + str _forEachIndex;
	} else
	{
		_targetsToWatch pushBack [_x, ["independentProtectTask" + str _forEachIndex]];
	};

	private _targetConfig = _x call CBA_fnc_getObjectConfig;
  private _targetPic = [_targetConfig >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;
  private _targetName = getText (_targetConfig >> "DisplayName");

	[independent, "independentProtectTask" + str _forEachIndex, [format["<img image='%1' width='300'>", _targetPic], "Protect the " + _targetName],_x, "CREATED", 0, false, "Defend"] call BIS_fnc_taskCreate;
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

      //updates tasks' states
      _tasksToUpdate = _x select 1;
      {
        if (["destroy",_x] call BIS_fnc_inString) then
        {
          [_x, "SUCCEEDED"] call BIS_fnc_taskSetState;
        };
        if (["protect",_x] call BIS_fnc_inString) then
        {
          [_x, "FAILED"] call BIS_fnc_taskSetState;
        };
      } forEach _tasksToUpdate;

      //checks if side has any alive objectives to destroy left
			_objectFoundStillAliveBlufor = false;
			{
				if (alive _x) then
				{
					_objectFoundStillAliveBlufor = true;
					break;
				};
			} forEach (fnf_bluforTargets);
      //if no objects found and side has targets to destroy add to winning side
			if (!_objectFoundStillAliveBlufor and count fnf_bluforTargets > 0) then
			{
				_winningTeams pushBack west;
			};

      //if blufor must destroy their targets in order
			if (fnf_bluforDestroyTargetsInOrder) then
			{
				_objectKilled = (_x select 0);
				_objectIndex = -1;
        //check which object was destroyed
				{
					if (_x isEqualTo _objectKilled) then
					{
						_objectIndex = _forEachIndex;
					};
				} forEach (fnf_bluforTargets);
        //get next object to destroy and allow its damage
				_nextObject = (fnf_bluforTargets) select (_objectIndex + 1);
        if (not local _nextObject) then
        {
          [_nextObject, true] remoteExec ["allowDamage", _nextObject];
        } else {
          _nextObject allowDamage true;
        };
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
				if (not local _nextObject) then
        {
          [_nextObject, true] remoteExec ["allowDamage", _nextObject];
        } else {
          _nextObject allowDamage true;
        };
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
				if (not local _nextObject) then
        {
          [_nextObject, true] remoteExec ["allowDamage", _nextObject];
        } else {
          _nextObject allowDamage true;
        };
			};
		};
		if (count _winningTeams != 0) then
		{
			[_winningTeams] call FNF_ServerSide_fnc_endGame;
		};
	} forEach fnf_targetsToWatch;
}, 1] call CBA_fnc_addPerFrameHandler;

//make objects that are considered in order invincible apart from first one
if (fnf_bluforDestroyTargetsInOrder) then
{
  {
    if (_forEachIndex == 0) then
    {
      continue;
    };
    if (not local _x) then
    {
      [_x, false] remoteExec ["allowDamage", _x];
    } else {
      _x allowDamage false;
    };
  } forEach fnf_bluforTargets;
};

if (fnf_opforDestroyTargetsInOrder) then
{
  {
    if (_forEachIndex == 0) then
    {
      continue;
    };
    if (not local _x) then
    {
      [_x, false] remoteExec ["allowDamage", _x];
    } else {
      _x allowDamage false;
    };
  } forEach fnf_opforTargets;
};

if (fnf_independentDestroyTargetsInOrder) then
{
  {
    if (_forEachIndex == 0) then
    {
      continue;
    };
    if (not local _x) then
    {
      [_x, false] remoteExec ["allowDamage", _x];
    } else {
      _x allowDamage false;
    };
  } forEach fnf_independentTargets;
};
