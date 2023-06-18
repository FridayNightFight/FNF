if !(isDedicated) exitWith {diag_log text "Not running on FNF Dedicated -- skipping RoundStart Discord post"};
if (count allPlayers < 14) exitWith {diag_log text "Less than 14 players connected -- skipping RoundStart Discord post"};

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
	if ([_x, west] call fnf_fnc_inSafeZone) then {
		if ((_threat # 0) < 0.1) then {
			_transportsPresentBLU = _transportsPresentBLU + 1;
		} else {
			[_x, "BLU", _vehiclesToProcessBLUFOR] call _getVic;
		};
	};
	if ([_x, east] call fnf_fnc_inSafeZone) then {
		if ((_threat # 0) < 0.1) then {
			_transportsPresentOPF = _transportsPresentOPF + 1;
		} else {
			[_x, "OPF", _vehiclesToProcessOPFOR] call _getVic;
		};
	};
	if ([_x, independent] call fnf_fnc_inSafeZone) then {
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

_bluAssets = (_bluArr joinString "");
_opfAssets = (_opfarr joinString "");
_indAssets = (_indArr joinString "");


private ["_gameMode"];
if (isNil "fnf_gameMode") then {_gameMode = "unknown"} else {_gameMode = fnf_gameMode};


_info = missionNamespace getVariable ["fnf_staffInfo", []];
_staffPlayers = allPlayers select {(getPlayerUID _x) in _info};
_staffCount = str(count _staffPlayers);
_spectatorCount = str(count (call ace_spectator_fnc_players));

_fnc_doCount = {
  params [
    ["_unit", objNull],
    ["_side", sideEmpty]
  ];
  if (isNull _unit || _side isEqualTo sideEmpty || !(_unit isKindOf "CAManBase")) exitWith {false};

  (
    side (group _unit) isEqualTo _side &&
    alive _unit &&
    !(isObjectHidden _unit) &&
    [_x] call ace_common_fnc_isAwake
  )
};

private ["_bluPlayers", "_opfPlayers", "_indPlayers"];
if (playableSlotsNumber west == 0) then {
  _bluPlayers = 0;
} else {
  _bluPlayers = count(allPlayers select {[_x, west] call _fnc_doCount});
};
if (playableSlotsNumber east == 0) then {
  _opfPlayers = 0;
} else {
  _opfPlayers = count(allPlayers select {[_x, east] call _fnc_doCount});
};
if (playableSlotsNumber independent == 0) then {
  _indPlayers = 0;
} else {
  _indPlayers = count(allPlayers select {[_x, independent] call _fnc_doCount});
};
_playingPlayerCount = _bluPlayers + _opfPlayers + _indPlayers;


_url = ["fnf.grabURL.getRoundURL", []] call py3_fnc_callExtension;


["fnf.roundStart", [
  missionName,
  _gameMode,
  _staffCount,
  str(_bluPlayers),
  str(_opfPlayers),
  str(_indPlayers),
  _spectatorCount,
  _url
]] call py3_fnc_callExtension;
