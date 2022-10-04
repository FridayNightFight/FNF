_vehiclesToProcessBLUFOR = [];
_vehiclesToProcessOPFOR = [];
_vehiclesToProcessINDFOR = [];
outArr = [];
_transportsPresentBLU = 0;
_transportsPresentOPF = 0;
_transportsPresentIND = 0;

_fnc_getMAT = {
	params ["_gearset","_bravo"];
	private _CFGGEAR = missionConfigFile >> "CfgFNFLoadouts" >> "GEAR" >> _gearset;
	private _cfgDefaultMATBravo = (_CFGGEAR >> "MAT1" >> "defaultMAT") call BIS_fnc_getCfgDataArray;
	private _selectedMAT = [];
	{
		_x params ["_configured",["_config",[]]];
		if ((_configured # 0) isEqualTo "GEARDEFAULT") then {
			// We're using the gear set -- validate it
			if (_config isEqualTo []) exitWith {
				["No default MAT configured for " + fnf_bluforGear, "error", 10] call fnf_ui_fnc_notify;
			};
			// Save valid info
			_selectedMAT pushBack selectRandom(_config);
		} else {
		// We're using the config.sqf setting
			_selectedMAT pushBack _configured;
		};
	} forEach [
		[_bravo,_cfgDefaultMATBravo]
	];
	_selectedMAT params ["_bravo"];
	_bravo params ["_bclassname","_bmagazines","_boptics","_breloadable","_bshortname"];
	_bmagazines = _bmagazines apply {_x splitString ':' select 1};
	_strStart = ", ";
	_lastElement = outArr select (count outArr - 1);

	//This changes the start of the MAT string depending on the last character in the current output array
	//To get rid of the starting comma if the side has no other assets besides MAT
	if (_lastElement select [count _lastElement - 1] == " ") then {_strStart = ""};

	if (true) then {
		outArr pushBack format["%3MAT:2x%1[%2]",
			_bShortName,
			_bMagazines joinString ",",
			_strStart
		];
	} else {
		outArr pushBack format["%5MAT:%1[%2]+%3[%4]",
			_bShortName,
			_bMagazines joinString ",",
			_strStart
		];
	};
};

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
  if (!isNull _x) then {
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
  };
} forEach (entities[["Air", "Truck", "Car", "Motorcycle", "Tank", "StaticWeapon", "Ship"], [], false, true] select {(_x call BIS_fnc_objectType select 0) == "Vehicle" && (locked _x) in [0,1]});



_gameMode = toUpper(fnf_gameMode select [0,4]);
if (_gameMode == "") then {_gameMode = "CUST"};
outArr pushBack format["(%1) // ",_gameMode];

if (fnf_attackingSide == sideEmpty && fnf_defendingSide == sideEmpty) then {
	outArr pushBack "NEUTRAL";
} else {
	outArr pushBack format["ATK: %1 x%2 adv - DEF: %3", fnf_attackingSide call BIS_fnc_sideName, "%", fnf_defendingSide call BIS_fnc_sideName];
};

// BLUFOR VEHICLES
_prepArrBLU = [];
{
	if (!((_x # 0) in ["ACE_friesAnchorBar", "Helicopter"])) then {
		_prepArrBLU pushBack format["%1x%2",_x # 1, _x # 0];
	};
} forEach ([_vehiclesToProcessBLUFOR, [], {_x # 0}] call BIS_fnc_sortBy);

if (playableSlotsNumber west > 0) then {
	outArr pushBack " /" + "/ BLU: ";

	if (count _prepArrBLU > 0) then {
		outArr pushBack (_prepArrBLU joinString ", ");
	};

	if (_transportsPresentBLU > 0) then {
		outArr pushBack format[" + %1 transports", _transportsPresentBLU];
	};

	[fnf_bluforGear, fnf_bluAT] call _fnc_getMAT;
};

// OPFOR VEHICLES
_prepArrOPF = [];
{
	if (!((_x # 0) in ["ACE_friesAnchorBar", "Helicopter"])) then {
		_prepArrOPF pushBack format["%1x%2",_x # 1, _x # 0];
	};
} forEach ([_vehiclesToProcessOPFOR, [], {_x # 0}] call BIS_fnc_sortBy);


if (playableSlotsNumber east > 0) then {
	outArr pushBack " /" + "/ OPF: ";

	if (count _prepArrOPF > 0) then {
		outArr pushBack (_prepArrOPF joinString ", ");
	};

	if (_transportsPresentOPF > 0) then {
		outArr pushBack format[" + %1 transports", _transportsPresentOPF];
	};

	[fnf_opforGear, fnf_redAT] call _fnc_getMAT;
};

// INDFOR VEHICLES
_prepArrIND = [];
{
	if (!((_x # 0) in ["ACE_friesAnchorBar", "Helicopter"])) then {
		_prepArrIND pushBack format["%1x%2",_x # 1, _x # 0];
	};
} forEach ([_vehiclesToProcessINDFOR, [], {_x # 0}] call BIS_fnc_sortBy);

if (playableSlotsNumber independent > 0) then {
	outArr pushBack " /" + "/ IND: ";

	if (count _prepArrIND > 0) then {
		outArr pushBack (_prepArrIND joinString ", ");
	};

	if (_transportsPresentIND > 0) then {
		outArr pushBack format[" + %1 transports", _transportsPresentIND];
	};

	[fnf_indforGear, fnf_grnAT] call _fnc_getMAT;
};

_out = (outArr joinString "");
outArr = nil;
copyToClipboard _out;
format["Copied to clipboard | %1", _out];
