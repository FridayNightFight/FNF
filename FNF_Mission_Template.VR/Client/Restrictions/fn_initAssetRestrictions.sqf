/*
	Author: Mallen

	Description:
		Restricts players that are not synced from using golf or hotel assets

	Parameter(s):
		0: ARRAY - All asset restriction modules

	Returns:
		None
*/

params["_assetRestrictionModules"];

fnf_assetRestrictions = [];

{
	_syncedObjects = synchronizedObjects _x;
	//all(0), crew(1), driving(2)
	_levelOfRestriction = _x getVariable ["fnf_restrictionLevel", 1];
	//get side TP poles are wanted for
	_forPlayer = false;
	_vics = [];

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
					_vics pushBack _x;
				};
			};
		};

		if (_objSide isEqualTo playerSide) then
		{
			_forPlayer = true;
		};
	} forEach _syncedObjects;

	//if assets are for this player we do not need to restrict them
	if (_forPlayer) then {continue;};

	{
		fnf_assetRestrictions pushBackUnique [_x, _levelOfRestriction];
	} forEach _vics;

} forEach _assetRestrictionModules;


//set up vehicle restrictions
if (count fnf_assetRestrictions isNotEqualTo 0) then
{
	player addEventHandler ["GetInMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];

		//all(0), crew(1), driving(2)
		_levelOfRestriction = 3;

		{
			_vic = _x select 0;
			if (_vic isEqualTo _vehicle) then
			{
				_level = _x select 1;
				if (_level < _levelOfRestriction) then
				{
					_levelOfRestriction = _level;
				};
			};
		} forEach fnf_assetRestrictions;

		if (_levelOfRestriction isEqualTo 3) exitWith {};

		switch (_levelOfRestriction) do {
			case 0: {
				moveOut player;
			};
			case 1: {

				if (_role in ["driver", "gunner", "commander"]) then
				{
					moveOut player;
					player moveInCargo _vehicle;
					/*
					player moveInAny [_vehicle, ["TURRET", "CARGO"]];
					*/
				};
			};
			case 2: {
				if (_role isEqualTo "driver") then
				{
					moveOut player;
					player moveInGunner _vehicle;
					player moveInCommander _vehicle;
					player moveInCargo _vehicle;
					/*
					player moveInAny [_vehicle, ["GUNNER", "COMMANDER", "TURRET", "CARGO"]];
					*/
				};
			};
			default { };
		};
	}];
	player addEventHandler ["SeatSwitchedMan", {
		params ["_unit1", "_unit2", "_vehicle"];

		//all(0), crew(1), driving(2)
		_levelOfRestriction = 3;

		{
			_vic = _x select 0;
			if (_vic isEqualTo _vehicle) then
			{
				_level = _x select 1;
				if (_level < _levelOfRestriction) then
				{
					_levelOfRestriction = _level;
				};
			};
		} forEach fnf_assetRestrictions;

		if (_levelOfRestriction isEqualTo 3) exitWith {};

		switch (_levelOfRestriction) do {
			case 0: {
				moveOut player;
			};
			case 1: {
				if (player in [(driver _vehicle), (gunner _vehicle), (commander _vehicle)]) then
				{
					moveOut player;
					player moveInCargo _vehicle;
					/*
					player moveInAny [_vehicle, ["TURRET", "CARGO"]];
					*/
				};
			};
			case 2: {
				if (player isEqualTo (driver _vehicle)) then
				{
					moveOut player;
					player moveInGunner _vehicle;
					player moveInCommander _vehicle;
					player moveInCargo _vehicle;
					/*
					player moveInAny [_vehicle, ["GUNNER", "COMMANDER", "TURRET", "CARGO"]];
					*/
				};
			};
			default { };
		};
	}];
};
