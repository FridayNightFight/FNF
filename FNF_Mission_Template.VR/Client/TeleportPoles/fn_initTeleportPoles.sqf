/*
	Author: Mallen

	Description:
		Sets up the required teleport poles specified by modules

	Parameter(s):
		0: ARRAY -	An array of all teleport poles modules

	Returns:
		None
*/

params ["_modules"];

//sort by X,Y and Z, leading zeros added for expected behaviour near 0,0 coords
//could concievabley be an issue if map is more than 999999 meters wide (unlikely)
_modules = [_modules] call FNF_ClientSide_fnc_sortByLocation;

_tpCounter = 1;

{
	_syncedObjects = synchronizedObjects _x;
	_timePolesAreDeleted = _x getVariable ["fnf_timePolesAreDeleted", 15];
	_visibleToOthers = _x getVariable ["fnf_visibleToOthers", false];
	//get side TP poles are wanted for
	_forPlayer = false;
	_tpObjects = [];

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
					_tpObjects pushBack _x;
				};
			};
		};

		if (_objSide isEqualTo playerSide) then
		{
			_forPlayer = true;
		};
	} forEach _syncedObjects;

	if (not _visibleToOthers and not _forPlayer) then
	{
		{
			hideObject _x;
		} forEach _tpObjects;
	};

	//if side is not player side then pass, not our problem
	if (not _forPlayer) then {continue;};

	//[position, action]
	_positionsAndActions = [];
	//sort by X,Y and Z, leading zeros added for expected behaviour near 0,0 coords
	//could concievabley be an issue if map is more than 999999 meters wide (unlikely)
	_syncedObjects = [_syncedObjects] call FNF_ClientSide_fnc_sortByLocation;

	{
		_pos = getPos _x;

		//statement to tp player
		_statement = {
			params ["_target", "_player", "_params"];

			//_posToTPTo = [_params, 0, 5] call BIS_fnc_findSafePos;
			//this function was not working as intended for my functionailty

			_posToTPTo = getPos _params;
			player setPos _posToTPTo;
		};

		//create ace action and marker for tp pole
		_action = ["teleportTo" + str(_pos),"Teleport to pole " + str(_tpCounter),"",_statement,{true},{},_x] call ace_interact_menu_fnc_createAction;
		_markerstr = createMarkerLocal ["fnf_tpPoleMarker_" + str(_tpCounter),_pos];
		_markerstr setMarkerShapeLocal "ICON";
		_markerstr setMarkerTextLocal "Teleport " + str(_tpCounter);
		_markerstr setMarkerTypeLocal "mil_dot";

		_tpCounter = _tpCounter + 1;

		_positionsAndActions pushBack [_pos, _action, _markerstr];
	} forEach _tpObjects;

	if (count _positionsAndActions isEqualTo 0) then
	{
		if (fnf_debug) then
		{
			systemChat "DANGER: Teleport pole module has no objects to teleport to synced to it, teleport poles will NOT function";
		};
		continue;
	};

	if (count _positionsAndActions isEqualTo 1) then
	{
		if (fnf_debug) then
		{
			systemChat "WARNING: Teleport pole module has only one object to teleport to synced to it";
		};
	};

	{
		_pos = getPos _x;
		_object = _x;
		_markerstr = "";

		//add the TP action per pole
		{
			if ((_x select 0) isNotEqualTo _pos) then
			{
				[_object, 0, ["ACE_MainActions"], (_x select 1)] call ace_interact_menu_fnc_addActionToObject;
			} else {
				_markerstr = _x select 2;
			};
		} forEach _positionsAndActions;

		//add timer to delete when poles say they should
		[{
			params["_timePolesAreDeleted", "_object", "_markerstr"];
			_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
			_result = objNull;
			if (isServer and hasInterface) then
			{
				_result = time > (_timePolesAreDeleted * 60);
			} else {
				_result = (serverTime - _timeServerStarted) > (_timePolesAreDeleted * 60);
			};
			if (_timeServerStarted isEqualTo -1) then
			{
				_result = false;
			};
			_result;
		},{
			params["_timePolesAreDeleted", "_object", "_markerstr"];
			hideObject _object;
			deleteMarkerLocal _markerstr;
		}, [_timePolesAreDeleted, _object, _markerstr]] call CBA_fnc_waitUntilAndExecute;

	} forEach _tpObjects;

} forEach _modules;
