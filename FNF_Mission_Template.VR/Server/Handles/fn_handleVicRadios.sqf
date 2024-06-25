/*
	Author: Indigo / Mallen

	Description:
		Sets the vehicle radios to the sides they are assigned to via breifing assets modules

	Parameter(s):
		None

	Returns:
		None
*/

params["_assetModules"];

if (!isServer) exitWith {};

//for each breifing asset modules
{
	_syncedObjects = synchronizedObjects _x;
	_objectsToCheckRadios = [];

	_moduleSide = sideEmpty;

	{
		_objectType = typeOf _x;
		switch (_objectType) do
		{
			case "SideBLUFOR_F": {_moduleSide = west;};
			case "SideOPFOR_F": {_moduleSide = east;};
			case "SideResistance_F": {_moduleSide = independent;};
			default
			{
				_objectsToCheckRadios pushBack _x;
			};
		};
	} forEach _syncedObjects;

	_encryptionCode = "fnf_default_code";

	switch (_moduleSide) do {
		case west: {_encryptionCode = "fnf_blufor_code";};
		case east:
		{
			if ([east, west] call BIS_fnc_sideIsFriendly) then
			{
				_moduleSide = west;
				_encryptionCode = "fnf_blufor_code";
			} else {
				_encryptionCode = "fnf_opfor_code";
			};
		};
		case independent:
		{
			_encryptionCode = "fnf_indfor_code";
			if ([independent, west] call BIS_fnc_sideIsFriendly) then
			{
				_moduleSide = west;
				_encryptionCode = "fnf_blufor_code";
			};
			if ([independent, east] call BIS_fnc_sideIsFriendly) then
			{
				_moduleSide = east;
				_encryptionCode = "fnf_opfor_code";
			};
			if ([east, west] call BIS_fnc_sideIsFriendly) then
			{
				_encryptionCode = "fnf_indfor_code";
			};
		};
		default { };
	};

	{
		_x setVariable ["tf_side", str(_moduleSide), true];
  	[{call TFAR_fnc_hasVehicleRadio}, {
    	params ["_vehicle", "_encryptionCode"];
    	_radios = _vehicle call TFAR_fnc_getVehicleRadios;
    	{
      	[_x, _encryptionCode] call TFAR_fnc_setLrRadioCode;
    	} forEach _radios;
  	}, [_x, _encryptionCode], 30, {}] call CBA_fnc_waitUntilAndExecute;
	} forEach _objectsToCheckRadios;
} forEach _assetModules;
