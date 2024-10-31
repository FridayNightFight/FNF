/*
	Author: Mallen

	Description:
		Used to re-arm a vic with loadout set on vic

	Parameter(s):
		None

	Returns:
		None
*/

(_this select 0) params ["_truck", "_vehicle"];
_currentLoadout = magazinesAllTurrets _vehicle;

_vicLoadout = _vehicle getVariable ["fnf_vehicleCustomLoadout", _currentLoadout];

_pylonLoadout = _vehicle getVariable ["fnf_vehicleCustomPylons", []];
_magsToIgnore = [];

{
	[_vehicle, [_x select 0, _x select 1]] remoteExec ["setAmmoOnPylon", 0];
	_magsToIgnore pushBack (_x select 2);
} forEach _pylonLoadout;

_magsToRemove = [];
{
	if (not ((_x select 0) in _magsToIgnore)) then
	{
		_magsToRemove pushBackUnique [(_x select 0), (_x select 1)];
	};
} forEach _currentLoadout;

{
	_owner = _vehicle turretOwner (_x select 1);
	[_vehicle, [(_x select 0), (_x select 1)]] remoteExec ["removeMagazinesTurret", _owner, false];
} forEach _magsToRemove;

{
	_owner = _vehicle turretOwner (_x select 1);
	[_vehicle, [(_x select 0), (_x select 1), (_x select 2)]] remoteExec ["addMagazineTurret", _owner, false];
} forEach _vicLoadout;
