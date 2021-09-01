if (isNil "DiscordEmbedBuilder_fnc_buildCfg") exitWith {diag_log text "Failed to send RoundStart webhook -- mod not loaded!"};

_vehiclesToProcessBLUFOR = [];
_vehiclesToProcessOPFOR = [];
_vehiclesToProcessINDFOR = [];
_outArr = [];
_transportsPresentBLU = 0;
_transportsPresentOPF = 0;
_transportsPresentIND = 0;

_getVic = {
	params ["_vic", "_thisSide", "_arr"];

	private _thisObj = _vic;
	private _thisObjConfig = (configFile >> "CfgVehicles" >> (typeOf _vic));
    private _displayName = _thisObjConfig call BIS_fnc_displayName;
	private _typeCount = 0;
	private _thisObjSide = sideLogic;
	private _objExists = [];

	// [dispName, count, side]

	private _objIndex = _arr findIf {(_x # 0) == _displayName && (_x # 2) == _thisSide};
	if (_objIndex == -1) then {
		_arr pushBack [
			_displayName,
			1,
			_thisSide
		];
	} else {
		_typeCount = _arr # _objIndex # 1;
		_arr # _objIndex set [1, (_typeCount + 1)];
	};
};



{
	private _thisConfig = (configFile >> "CfgVehicles" >> (typeOf _x));
	private _threat = [_thisConfig, "threat"] call BIS_fnc_returnConfigEntry;
	if (_x inArea "bluforSafeMarker") then {
		if ((_threat # 0) < 0.1) then {
			_transportsPresentBLU = _transportsPresentBLU + 1;
		} else {
			[_x, "BLU", _vehiclesToProcessBLUFOR] call _getVic;
		};
	};
	if (_x inArea "opforSafeMarker") then {
		if ((_threat # 0) < 0.1) then {
			_transportsPresentOPF = _transportsPresentOPF + 1;
		} else {
			[_x, "OPF", _vehiclesToProcessOPFOR] call _getVic;
		};
	};
	if (_x inArea "indforSafeMarker") then {
		if ((_threat # 0) < 0.1) then {
			_transportsPresentIND = _transportsPresentIND + 1;
		} else {
			[_x, "IND", _vehiclesToProcessINDFOR] call _getVic;
		};
	};

} forEach (entities[["Air", "Truck", "Car", "Motorcycle", "Tank", "StaticWeapon", "Ship"], [], false, true] select {(_x call BIS_fnc_objectType select 0) == "Vehicle" && (locked _x) in [0,1]});

_outArr = [];
_bluArr = [];
_opfArr = [];
_indArr = [];


_prepArrBLU = [];
{
	if (!((_x # 0) in ["ACE_friesAnchorBar", "Helicopter"])) then {
		_prepArrBLU pushBack ([_x # 0, _x # 1] joinString " x");
	};
} forEach ([_vehiclesToProcessBLUFOR, [], {_x # 0}] call BIS_fnc_sortBy);

if (count _prepArrBLU > 0) then {
	// _bluArr pushBack "**BLUFOR** -------------------------------------\n";
	_bluArr pushBack (_prepArrBLU joinString ", ");
};
if (_transportsPresentBLU > 0) then {_bluArr pushBack format[" + %1 transports", _transportsPresentBLU]};


_prepArrOPF = [];
{
	if (!((_x # 0) in ["ACE_friesAnchorBar", "Helicopter"])) then {
		_prepArrOPF pushBack ([_x # 0, _x # 1] joinString " x");
	};
} forEach ([_vehiclesToProcessOPFOR, [], {_x # 0}] call BIS_fnc_sortBy);

if (count _prepArrOPF > 0) then {
	// _opfArr pushBack "\n**OPFFOR** -------------------------------------\n";
	_opfArr pushBack (_prepArrOPF joinString ", ");
};
if (_transportsPresentOPF > 0) then {_opfArr pushBack format[" + %1 transports", _transportsPresentOPF]};


_prepArrIND = [];
{
	if (!((_x # 0) in ["ACE_friesAnchorBar", "Helicopter"])) then {
		_prepArrIND pushBack ([_x # 0, _x # 1] joinString " x");
	};
} forEach ([_vehiclesToProcessINDFOR, [], {_x # 0}] call BIS_fnc_sortBy);

if (count _prepArrIND > 0) then {
	// _indArr pushBack "\n**INDFOR** -------------------------------------\n";
	_indArr pushBack (_prepArrIND joinString ", ");
};
if (_transportsPresentIND > 0) then {_indArr pushBack format[" + %1 transports", _transportsPresentIND]};

// _assets = (_outArr joinString "");


private ["_gameMode"];
if (isNil "phx_gameMode") then {_gameMode = "unknown"} else {_gameMode = phx_gameMode};

_playingPlayerCount = str(count (playableUnits select {alive _x}));
_staffCount = if (isNil "staffPlayers") then {"0"} else {str(count staffPlayers)};
_spectatorCount = str(count (call ace_spectator_fnc_players));
_bluPlayers = if (playableSlotsNumber west == 0) then {""} else {str(count(allPlayers select {side _x == west && alive _x}))};
_opfPlayers = if (playableSlotsNumber east == 0) then {""} else {str(count(allPlayers select {side _x == east && alive _x}))};
_indPlayers = if (playableSlotsNumber independent == 0) then {""} else {str(count(allPlayers select {side _x == independent && alive _x}))};
_bluAssets = (_bluArr joinString "");
_opfAssets = (_opfarr joinString "");
_indAssets = (_indArr joinString "");


["RoundStart", [
    missionName,
    _gameMode,
    _playingPlayerCount,
    _spectatorCount,
    _staffCount,
    _bluPlayers,
    _opfPlayers,
    _indPlayers,
    _bluAssets,
    _opfAssets,
    _indAssets
]] call DiscordEmbedBuilder_fnc_buildCfg;