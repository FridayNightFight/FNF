/*
	Author: Mallen

	Description:
		Sets up the required MSPs specified by modules

	Parameter(s):
		0: ARRAY -	An array of all MSP modules

	Returns:
		None
*/

params ["_modules"];

_globalCounter = 0;
{
	_syncedObjects = synchronizedObjects _x;
	_vics = [];
	_telePoles = [];
	_objSide = sideEmpty;
	_markerColor = "ColorUNKNOWN";

	{
		_objectType = typeOf _x;
		switch (_objectType) do
		{
			case "SideBLUFOR_F":
			{
				_objSide = west;
				_markerColor = "ColorBLUFOR";
			};
			case "SideOPFOR_F":
			{
				_objSide = east;
				_markerColor = "ColorOPFOR";
			};
			case "SideResistance_F":
			{
				_objSide = independent;
				_markerColor = "ColorIndependent";
			};
		};

		if (_x isKindOf "LandVehicle") then
		{
			_vics pushBack _x;
		} else {
			_telePoles pushBack _x;
		};
	} forEach _syncedObjects;

	if (playerSide isNotEqualTo _objSide) then {continue;};

	_sortedVics = [_vics] call FNF_ClientSide_fnc_sortByLocation;

	_preCalced = true;
	{
		_preCalcedOrder = _x getVariable ["fnf_mspPrecalculatedOrderNumber", -1];
		if (_preCalcedOrder isEqualTo -1) then
		{
			_preCalced = false;
			break;
		};
	} forEach _sortedVics;

	if (_preCalced) then
	{
		_sortedVics = [_sortedVics, [], {_x getVariable ["fnf_mspPrecalculatedOrderNumber", -1];}] call BIS_fnc_sortBy;
	};

	{
		_currentPole = _x;
		{
			_globalCounter = _globalCounter + 1;

			_markerstr = createMarkerLocal ["mspMarkerName" + str(_globalCounter),_x];
			_markerstr setMarkerShapeLocal "ICON";
			_markerstr setMarkerTypeLocal "respawn_inf";
			_markerstr setMarkerTextLocal ("MSP " + str(_forEachIndex + 1));
			_markerstr setMarkerColorLocal _markerColor;

			_preCalcedOrder = _x getVariable ["fnf_mspPrecalculatedOrderNumber", -1];
			if (_preCalcedOrder isEqualTo -1) then
			{
				_x setVariable ["fnf_mspPrecalculatedOrderNumber", _forEachIndex, true];
			};

			[{
				(_this select 0) params ["_marker", "_vic"];
				_marker setMarkerPosLocal _vic;
			},1,[_markerstr, _x]] call CBA_fnc_addPerFrameHandler;

			_action = ["teleAction" + str(_globalCounter), "Teleport to MSP " + str(_forEachIndex + 1), "", {
				params ["_target", "_player", "_params"];
				_vic = _params select 0;
				_tpPos = (getPos _vic) findEmptyPosition [2, 25, typeOf player];

				player setPos _tpPos;
			}, {
				params ["_target", "_player", "_params"];
				_vic = _params select 0;
				_result = true;
				if (speed _vic > 5) then
				{
					_result = false;
				};
				_closePlayers = allPlayers select {(_x distance2D _vic) < 250 and (side _x) isNotEqualTo playerSide};
				if ((count _closePlayers) isNotEqualTo 0) then
				{
					_result = false;
				};
				_result;
			}, {}, [_x]] call ace_interact_menu_fnc_createAction;
			[_currentPole, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToObject;
		} forEach _sortedVics;
	} forEach _telePoles;
} forEach _modules;
