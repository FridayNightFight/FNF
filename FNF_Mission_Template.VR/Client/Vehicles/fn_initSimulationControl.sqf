/*
	Author: Mallen

	Description:
		Used to overide ace re-arm functions with fnf defined functions

	Parameter(s):
		0: ARRAY -	An array of all breifing asset modules

	Returns:
		None
*/

params["_assetModules"];

_objectsToDisplay = [];

{
	_syncedObjects = synchronizedObjects _x;

	//for each object synced to the module
	{
		_objectType = typeOf _x;
		switch (_objectType) do
		{
			case "SideBLUFOR_F": {};
			case "SideOPFOR_F": {};
			case "SideResistance_F": {};
			default
			{
				_objectsToDisplay pushBackUnique _x;
			};
		};
	} forEach _syncedObjects;
} forEach _assetModules;

{
	_actionEnableSim = [
		"fnf_enableSim",
		"Enable Simulation",
		"",
		{
			params ["_truck", "_unit"];
			[_truck, true] remoteExec ["enableSimulationGlobal", 2, false];
			[{
				params ["_truck", "_unit"];
				if ((count (crew _truck)) isEqualTo 0) then
				{
					[_truck, false] remoteExec ["enableSimulationGlobal", 2, false];
				};
			}, [_truck, _unit], 60] call CBA_fnc_waitAndExecute;
		},
		{
			params ["_truck", "_unit"];
			(alive _unit)
			&& {alive _truck}
			&& {(_truck distance _unit) < 9}
			&& {not simulationEnabled _truck}
			&& {[_unit, _truck, ["IsNotInside"]] call ace_common_fnc_canInteractWith;}; // manually added actions need this
		}
	] call ace_interact_menu_fnc_createAction;

	[_x, 0, ["ACE_MainActions"], _actionEnableSim] call ace_interact_menu_fnc_addActionToObject;
} forEach _objectsToDisplay;
