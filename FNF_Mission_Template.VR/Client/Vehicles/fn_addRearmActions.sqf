/*
	Author: Mallen

	Description:
		Used to overide ace re-arm addAction function with fnf defined function

	Parameter(s):
		None

	Returns:
		None
*/

params ["_truck", "_player"];

private _vehicles = nearestObjects [_truck, ["AllVehicles"], ace_rearm_distance];
_vehicles = _vehicles select {
	_x != _truck
	&& {!(_x isKindOf "CAManBase")}
	&& {alive _x}
};

private _vehicleActions = [];
{
	private _vehicle = _x;
	private _displayName = getText (configOf _vehicle >> "displayName");
	private _distanceStr = (player distance _vehicle) toFixed 1;
	private _actionName = format ["%1 (%2m)", _displayName, _distanceStr];

	private _currentLoadout = magazinesAllTurrets _vehicle;
	{
		(_currentLoadout select _forEachIndex) deleteRange [3, 4];
	} forEach _currentLoadout;

	private _vicLoadout = _vehicle getVariable ["fnf_vehicleCustomLoadout", _currentLoadout];

	if (_vicLoadout isNotEqualTo _currentLoadout) then {
		private _icon = getText(configOf _vehicle >> "Icon");
		if !((_icon select [0, 1]) == "\") then {
			_icon = "";
		};
		private _action = [
			_vehicle,
			_actionName,
			_icon,
			{_this call FNF_ClientSide_fnc_rearmVic},
			{true},
			{},
			_vehicle
		] call ace_interact_menu_fnc_createAction;
		_vehicleActions pushBack [_action, [], _truck];
	};
} forEach _vehicles;

_vehicleActions;
