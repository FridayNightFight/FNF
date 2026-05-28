/*
	Author: Mallen

	Description:
		Used to actually rearm the personal

	Parameter(s):
		0: OBJECT -	The personal rearm module being used to rearm
		1: OBJECT -	The box the rearm should go in

	Returns:
		None
*/

params ["_rearmModule", "_outputBox"];

_currentTimer = _rearmModule getVariable ["fnf_RearmTime", 0];

_timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];
_result = objNull;
if (isServer and hasInterface) then
{
	_result = time > _currentTimer;
} else {
	_result = (serverTime - _timeServerStarted) > _currentTimer;
};
if (time < 1) then
{
	_result = false;
};

if (not _result) exitWith {};

_syncedObjects = synchronizedObjects _rearmModule;

_rearmBoxs = [];

{
	_objectType = typeOf _x;
	if ((not isPlayer _x) and (not (_objectType isEqualTo "Logic"))) then
	{
		//rearm outputs are not hidden, so any boxs hidden are automatically included
		if (isObjectHidden _x) then
		{
			_rearmBoxs pushBack _x;
		};
	};
} forEach _syncedObjects;

if (count _rearmBoxs < 1) exitwith {["<t size='1.5' align='center'>Failed to get rearm items, no source boxs, please let admin know so this can be fixed</t>", "error"] call FNF_ClientSide_fnc_notificationSystem;};

_modules = call FNF_ClientSide_fnc_findFNFModules;

//check if init module is found
_selectorModules = [_modules, "selectorOption"] call FNF_ClientSide_fnc_findSpecificModules;

_selectorDependent = false;
_foundOption = objNull;
{
	_syncedObjects = synchronizedObjects _x;
	_selectorModule = _x;
	{
		if (_x in _rearmBoxs) then
		{
			_foundOption = _selectorModule;
			_selectorDependent = true;
		};
	} forEach _syncedObjects;

	if (_selectorDependent) then {break;};
} forEach _selectorModules;

_errorGiven = false;

_itemsToAdd = "";
if (_selectorDependent) then
{
	//get host Module
	_syncedObjects = synchronizedObjects _foundOption;
	_hostModule = objNull;
	{
		_objectType = typeOf _x;
		if (_objectType isEqualTo "fnf_module_selectorHost") then
		{
			_hostModule = _x;
			break;
		};
	} forEach _syncedObjects;

	//get all players on the server synced to the rearm module
	_rearmSyncedObjects = synchronizedObjects _rearmModule;
	_hostSyncedObjects = synchronizedObjects _hostModule;
	_combinedSync = _rearmSyncedObjects arrayIntersect _hostSyncedObjects;

	_validPlayer = objNull;
	{
		if (isPlayer _x) then
		{
			_validPlayer = _x;
		};
	} forEach _combinedSync;

	if (isNull _validPlayer) exitWith
	{
		_selectorName = _hostModule getVariable ["fnf_selectorName", "Default Name"];
		_errorGiven = true;
		["<t size='1.5' align='center'>Failed to get rearm items, no in-game player has been assigned to selector " + _selectorName + "</t>", "error"] call FNF_ClientSide_fnc_notificationSystem;
	};

	_currentSelectionModule = _hostModule getVariable ["fnf_selection_" + (getPlayerUID _validPlayer), "NONE"];

	if (_currentSelectionModule isEqualTo "NONE") exitWith
	{
		_selectorName = _hostModule getVariable ["fnf_selectorName", "Default Name"];
		_errorGiven = true;
		["<t size='1.5' align='center'>Failed to get rearm items, " + (name _validPlayer) + " has not made a selection for selector " + _selectorName + "</t>", "error"] call FNF_ClientSide_fnc_notificationSystem;
	};

	_optionSyncedObjects = synchronizedObjects _currentSelectionModule;
	_combinedSync = _rearmSyncedObjects arrayIntersect _optionSyncedObjects;
	_verifiedSync = _combinedSync arrayIntersect _rearmBoxs;
	_currentRearmBox = _verifiedSync select 0;

	_items = itemCargo _currentRearmBox;
	_magazines = magazineCargo _currentRearmBox;
	_weapons = weaponCargo _currentRearmBox;
	_backpacks = backpackCargo _currentRearmBox;
	_selectionItems = _items;
	_selectionItems append _magazines;
	_selectionItems append _weapons;
	_selectionItems append _backpacks;

	if (_selectionItems isNotEqualTo []) then
	{
		_itemsToAdd = _selectionItems;
	};
} else {
	//incase rearm is not selector dependent simply AND all items
	{
		_items = itemCargo _x;
		_magazines = magazineCargo _x;
		_weapons = weaponCargo _x;
		_backpacks = backpackCargo _x;
		_selectionItems = _items;
		_selectionItems append _magazines;
		_selectionItems append _weapons;
		_selectionItems append _backpacks;

		if (_selectionItems isEqualTo []) then {continue;};

		if (_itemsToAdd isEqualTo "") then
		{
			_itemsToAdd = _selectionItems;
		} else {
			_itemsToAdd append _selectionItems;
		};
	} forEach _rearmBoxs;
};

if (_itemsToAdd isEqualTo "") exitWith
{
	if (not _errorGiven) then
	{
		["<t size='1.5' align='center'>Failed to get rearm items, one or more source boxs are empty, please let admin know so this can be fixed</t>", "error"] call FNF_ClientSide_fnc_notificationSystem;
	};
};

{
	_outputBox addItemCargoGlobal [_x, 1];
	_outputBox addBackpackCargoGlobal [_x, 1];
} forEach _itemsToAdd;

_timeBetweenRearms = _rearmModule getVariable ["fnf_timeBetweenRearms", 3600];

_result = 0;
if (isServer and hasInterface) then
{
	_result = time + _timeBetweenRearms;
} else {
	_result = (serverTime - _timeServerStarted) + _timeBetweenRearms;
};

_rearmModule setVariable ["fnf_RearmTime", _result, true];
["<t size='1.5' align='center'>Re-arm items in container</t><br/>", "info"] call FNF_ClientSide_fnc_notificationSystem;
