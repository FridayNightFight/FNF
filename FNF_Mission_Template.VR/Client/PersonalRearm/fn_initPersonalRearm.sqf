/*
	Author: Mallen

	Description:
		Used to init personal rearm boxes for players

	Parameter(s):
		0: ARRAY -	An array of all personal rearm modules

	Returns:
		None
*/

params["_modules"];

_globalCounter = 0;

_boxsToHide = [];

{
	_rearmModule = _x;
	_syncedObjects = synchronizedObjects _rearmModule;
	_forPlayer = false;
	_boxs = [];

	{
		_objectType = typeOf _x;
		_objSide = sideUnknown;
		switch (_objectType) do
		{
			case "SideBLUFOR_F":
			{
				_objSide = west;
			};
			case "SideOPFOR_F":
			{
				_objSide = east;
			};
			case "SideResistance_F":
			{
				_objSide = independent;
			};
			default
			{
				if (_x isEqualTo player) then
				{
					_forPlayer = true;
					continue;
				};
				if ((not isPlayer _x) and (not (_objectType isEqualTo "Logic"))) then
				{
					_boxs pushBack _x;
				};
			};
		};

		if (_objSide isEqualTo playerSide) then
		{
			_forPlayer = true;
		};
	} forEach _syncedObjects;

	_rearmOptions = [];
	{
		//get the cargo etc in object and add it to the options player has for the rearm
		_items = itemCargo _x;
		_magazines = magazineCargo _x;
		_weapons = weaponCargo _x;
		_backpacks = backpackCargo _x;
		_selectionItems = _items;
		_selectionItems append _magazines;
		_selectionItems append _weapons;
		_selectionItems append _backpacks;
		if (_selectionItems isNotEqualTo []) then
		{
			_rearmOptions pushBack _x;
		};
	} forEach _boxs;

	//if no samplebox, nothing to rearm?
	if ((count _rearmOptions) isEqualTo 0) then {continue;};

	_boxs = _boxs - _rearmOptions;

	//if no box to rearm from then cannot rearm?
	if (count _boxs < 1) then {continue;};

	//check if boxes have selector options assigned to them, if none do treat them as an AND statement, otherwise ignore ones without and turn them to boxs
	_noSelectorOptionBoxs = [];
	_selectorOptionBoxs = [];
	{
		_syncedObjects = synchronizedObjects _x;
		{
			_objectType = typeOf _x;
			if (_objectType isEqualTo "") then
			{
				_selectorOptionBoxs pushBack _x;
			} else {
				_noSelectorOptionBoxs pushBack _x;
			};
		} forEach _syncedObjects;
	} forEach _rearmOptions

	if (count _selectorOptionBoxs > 0) then
	{
		{
			clearItemCargoGlobal _x;
			_boxs pushBack _x;
		} forEach _noSelectorOptionBoxs;
		_noSelectorOptionBoxs = [];
	};

	_rearmModule getVariable ["fnf_RearmTime", 0];

	{
		_boxsToHide pushBackUnique _x;
	} forEach (_noSelectorOptionBoxs + _selectorOptionBoxs);

	//if rearm is not for player continue
	if (not _forPlayer) then {continue;};

	{
		_action = ["reArmAction" + str(_globalCounter), "Re-Arm Items", "", {
			params ["_target", "_player", "_params"];
			(_params + [_target]) call FNF_ClientSide_fnc_doPersonalRearm;
		}, {
			true
		}, {}, [_rearmModule], [0, 0, 0], 5, [false,false,false,false,false], {
			params ["_target", "_player", "_params", "_actionData"];
			_params params ["_rearmModule"];

			_currentTimer = _rearmModule getVariable ["fnf_RearmTime", 0];

			_timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];
			_time = 0;
			if (isServer and hasInterface) then
			{
				_time = _currentTimer - time;
			} else {
				_time = _currentTimer - (serverTime - _timeServerStarted);
			};

			if (_time < 1) then
			{
				_actionData set [1, "Re-Arm Items: Ready to Re-Arm"];
			} else {
				_timeString = [_time, "MM:SS"] call BIS_fnc_secondsToString;
				_actionData set [1, format ["Re-Arm Items: %1", _timeString]];
			};
		}] call ace_interact_menu_fnc_createAction;

		_globalCounter = _globalCounter + 1;

		[_x, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToObject;
	} forEach _boxs;

} forEach _modules;

{
	hideObject _x;
} forEach _boxsToHide;
