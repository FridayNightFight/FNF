_getWeaponry = {
	params ["_turretPaths", "_seatCategory", "_outArr"];
	{
		_path = _x;
		if (_path isEqualTo []) then {_path = [-1]};
		_weps = _vic weaponsTurret _path;
		private _thisArr = [];
		if (count _weps isNotEqualTo 0) then {
			_magsHere = _vic magazinesTurret _path call BIS_fnc_consolidateArray;

			private _wepMags = [];
			{
				_wepDet = [_vic, _path, _x, _magsHere, _pylons] call _getMagsForWep;
				if (!(_wepDet isEqualTo [[]])) then {
					_wepMags pushBack _wepDet;
				};
			} forEach _weps;

			if (count _wepMags > 0) then {
				// "debug_console" callExtension (format["_wepMags Driver = %1", [_wepMags] call CBA_fnc_encodeJSON] + "#1100");
				{
					_thisArr pushBack _x # 0;
					if (count _x > 1) then {
						{
							_thisArr pushBack _x;
						} forEach (_x # 1);
					}
				} forEach _wepMags;
			};
		};// else {
			// "debug_console" callExtension (format["Running Mags Only."] + "#1100");
			// "debug_console" callExtension (format["Vic: %1",_vic] + "#1100");
			// "debug_console" callExtension (format["Path: %1", _path] + "#1100");
		// 	_mags = ([_vic, _path] call _getMags);

		// 	if (count _mags > 0) then {
		// 		{
		// 			_thisArr pushBack _x;
		// 		} forEach _mags;
		// 	};
		// };

		if (count _thisArr > 0) then {
			private _turretConfig = [_vic, _x] call BIS_fnc_turretConfig;
			private _turretDisplayName = [_turretConfig] call BIS_fnc_displayName;
			if (_turretDisplayName != "") then {
				_outArr pushBack format["    <font color='#f6dcbf' face='PuristaSemiBold'>%1 (""%2"")</font>", _seatCategory, _turretDisplayName];
			} else {
				_outArr pushBack format["    <font color='#f6dcbf' face='PuristaSemiBold'>%1</font>", _seatCategory];
			};

			{
				_outArr pushBack _x;
			} forEach _thisArr;
		}
	} forEach _turretPaths;
};



_getMagsForWep = {
	params ["_vic", "_path", "_wep", "_magsHere", "_pylons"];

	if (_path isEqualTo []) then {_path = [-1]};
	// "debug_console" callExtension (_wep + "#0100");
	if (_wep in [
		"rhs_weap_MASTERSAFE",
		"rhs_weap_fcs_ammo",
		"rhs_weap_laserDesignator_AI",
		"rhs_weap_fcs_ah64",
		"rhs_weap_DummyLauncher",
		"rhs_weap_fcs_nolrf_ammo",
		"rhsusf_weap_duke",
		"TruckHorn",
		"TruckHorn2",
		"TruckHorn3"
	]) exitWith {};

	private _thisArr = [];
	_wepConfig = (configFile >> "CfgWeapons" >> _wep);
	_wepDisp = [(_wepConfig >> "displayName"), "STRING", "Weapon"] call CBA_fnc_getConfigEntry;
	if (_wep == "rhs_weap_smokegen") then {_wepDisp = "Smoke Generator"};
	if (_wepDisp isEqualTo "") exitWith {};

	// "debug_console" callExtension (_wepDisp + "#0100");
	_magsToCheck = (_vic magazinesTurret _path);


	// See if the first default magazine in the config of this weapon is meant to be used on a pylon. If so, process differently
	// _mag1pylonWeapon = "";
	// _magsConfigArr = [(_wepConfig >> "magazines"), "ARRAY", []] call CBA_fnc_getConfigEntry;
	// if (_magsConfigArr isEqualTo []) then {
	// 	_mag1pylonWeapon = "";
	// } else {
	// 	_mag1Name = _magsConfigArr # 0;
	// 	_mag1pylonWeapon = [(configFile >> "CfgMagazines" >> _mag1Name >> "pylonWeapon"), "STRING", ""] call CBA_fnc_getConfigEntry;
	// };

	_pylonMagNames = _pylons apply {_x # 3};

	_compatMagsRef = [_wepConfig, true] call CBA_fnc_compatibleMagazines;
	_magsFound = _compatMagsRef select {_magsToCheck find _x  != -1};

	private _magsArr = [];

	if (!((_magsFound # 0) in _pylonMagNames)) then {
		// Not a pylon weapon, so check mags in turret storage
		_thisArr pushBack format["        <font color='#87ffbb' face='PuristaSemiBold'>%1</font>", _wepDisp];
		{
			_thisMag = _x;
			_magAmmo = _vic magazineTurretAmmo [_x, _path];
			_magCount = (_magsHere select {_x # 0== _thisMag} apply {_x # 1}) # 0;

			private _magConfig = (configFile >> "CfgMagazines" >> _thisMag);
			private _magName = [(_magConfig >> "displayName"), "STRING", "Magazine"] call CBA_fnc_getConfigEntry;
			if (_magName isEqualTo "") then {_magName = "Magazine"};



			_magsArr pushBack format[
				"            + <font color='#4de4ff' size='12' face='PuristaMedium'><font color='#ffffff'>%1</font> <font color='#c2c2c2'>|</font> %2 <font color='#c2c2c2'>rounds</font> <font color='#c2c2c2'>|</font> %3 <font color='#c2c2c2'>mags</font></font>",
				_magName,
				_magAmmo,
				_magCount
			];
		} forEach _magsFound;
	} else {
		// This is a pylon weapon, so make a unique entry and directly check ammo on pylon
		_thisArr pushBack format["        <font color='#87ffbb' face='PuristaSemiBold'>%1</font> <font face='PuristaMedium'>[Pylon]</font>", _wepDisp];
	};

	_thisArr pushBack _magsArr;
	// "debug_console" callExtension (str _magsArr + "#0100");
	_thisArr;
	// _thisArr;
	// "debug_console" callExtension (format[
	// 	"    %1 | %2 rounds | %3 mags#0110",
	// 	getText(configFile >> "CfgMagazines" >> _thisMag >> "displayName"),
	// 	_magAmmo,
	// 	_magCount
	// ]);
};

_getMags = {
	params ["_vic", "_path"];
	if (_path isEqualTo []) then {_path = [-1]};

	private _thisArr = [];
	_magsHere = _vic magazinesTurret _path call BIS_fnc_consolidateArray;
	{
		_thisMag = _x;
		_magAmmo = _vic magazineTurretAmmo [_x, _path];
		_magCount = (_magsHere select {_x # 0== _thisMag} apply {_x # 1}) # 0;

		private _magConfig = (configFile >> "CfgMagazines" >> _thisMag);
		private _magName = [(_magConfig >> "displayName"), "STRING", "Magazine"] call CBA_fnc_getConfigEntry;
		if (_magName isEqualTo "") then {_magName = "Magazine"};

		if (!(_magAmmo == 1 && _magCount == 1)) then {
			_thisArr pushBack format[
				"        <font color='#4de4ff' size='12' face='PuristaMedium'><font color='#ffffff'>%1</font> <font color='#c2c2c2'>|</font> %2 <font color='#c2c2c2'>rounds</font> <font color='#c2c2c2'>|</font> %3 <font color='#c2c2c2'>mags</font></font>",
				_magName,
				_magAmmo,
				_magCount
			];
			// "debug_console" callExtension (format[
			// 	"    %1 | %2 rounds | %3 mags#0110",
			// 	getText(configFile >> "CfgMagazines" >> _thisMag >> "displayName"),
			// 	_magAmmo,
			// 	_magCount
			// ]);
		};
	} forEach (_vic magazinesTurret _path);
	_thisArr;
};


_getInventory = {
	params ["_vic"];


	_vicDispName = configOf _vic call BIS_fnc_displayName;
	private _thisArr = [];

	// _thisArr pushBack getItemCargo _vic;
	// _thisArr pushBack getBackpackCargo _vic;
	// _thisArr pushBack getMagazineCargo _vic;
	// _thisArr pushBack getWeaponCargo _vic;

	private _ItemCargo = [];
	private _MagazineCargo = [];
	private _WeaponCargo = [];
	private _BackpackCargo = [];

	{
		private _config = _x call CBA_fnc_getItemConfig;
		_ItemCargo pushBack [
			getText (_config >> "displayName"),
			getText (_config >> "picture")
		];
	} forEach ItemCargo _vic;
	{
		private _config = _x call CBA_fnc_getItemConfig;
		_MagazineCargo pushBack [
			getText (_config >> "displayName"),
			getText (_config >> "picture")
		];
	} forEach MagazineCargo _vic;
	{
		// private _config = _x call CBA_fnc_getObjectConfig;
		_WeaponCargo pushBack [
			getText (configFile >> "CfgWeapons" >> _x >> "displayName"),
			getText (configFile >> "CfgWeapons" >> _x >> "picture")
		];
	} forEach WeaponCargo _vic;
	{
		private _config = _x call CBA_fnc_getObjectConfig;
		_BackpackCargo pushBack [
			getText (_config >> "displayName"),
			getText (_config >> "picture")
		];
	} forEach BackpackCargo _vic;

	private _sortedItemCargo = ([_ItemCargo call BIS_fnc_consolidateArray, [], {_x # 0 # 0}] call BIS_fnc_sortBy) select {!(_x # 0 # 0 isEqualTo "")};
	private _sortedMagazineCargo = ([_MagazineCargo call BIS_fnc_consolidateArray, [], {_x # 0 # 0}] call BIS_fnc_sortBy) select {!(_x # 0 # 0 isEqualTo "")};
	private _sortedWeaponCargo = ([_WeaponCargo call BIS_fnc_consolidateArray, [], {_x # 0 # 0}] call BIS_fnc_sortBy) select {!(_x # 0 # 0 isEqualTo "")};
	private _sortedBackpackCargo = ([_BackpackCargo call BIS_fnc_consolidateArray, [], {_x # 0 # 0}] call BIS_fnc_sortBy) select {!(_x # 0 # 0 isEqualTo "")};

	// "debug_console" callExtension(str _sortedItemCargo + "~0100");
	// "debug_console" callExtension(str _sortedMagazineCargo + "~0100");
	// "debug_console" callExtension(str _sortedWeaponCargo + "~0100");
	// "debug_console" callExtension(str _sortedBackpackCargo + "~0100");

	if (count _sortedItemCargo > 0) then {
		_thisArr pushBack format["<font color='#ffffff' size='12' face='PuristaMedium'>Items:</font>"];
		private _itemCargoOut = [];
		{
			private _name = _x # 0 # 0;
			private _pic = _x # 0 # 1;
			private _count = _x # 1;
			if (_pic == "") then {
				_itemCargoOut pushBack format["<font color='#ffffff' size='12' face='EtelkaMonospacePro'><execute expression='systemChat ""%3"";'>%3 x%2</execute></font>", _pic, _count, _name];
			} else {
				_itemCargoOut pushBack format["<img height='30' image='%1'/><font color='#ffffff' size='10' face='EtelkaMonospacePro'><execute expression='systemChat ""%3"";'>x%2</execute></font>", _pic, _count, _name];
			};
			if ((_forEachIndex + 1) mod 6 == 0) then {_itemCargoOut pushBack "<br/>"};
		} forEach _sortedItemCargo;
		_thisArr pushBack (_itemCargoOut joinString "");
	};
	if (count _sortedMagazineCargo > 0) then {
		_thisArr pushBack format["<font color='#ffffff' size='12' face='PuristaMedium'>Magazines:</font>"];
		private _magCargoOut = [];
		{
			private _name = _x # 0 # 0;
			private _pic = _x # 0 # 1;
			private _count = _x # 1;
			if (_pic == "") then {
				_magCargoOut pushBack format["<font color='#ffffff' size='12' face='EtelkaMonospacePro'><execute expression='systemChat ""%3"";'>%3 x%2</execute></font>", _pic, _count, _name];
			} else {
				_magCargoOut pushBack format["<img height='30' image='%1'/><font color='#ffffff' size='10' face='EtelkaMonospacePro'><execute expression='systemChat ""%3"";'>x%2</execute></font>", _pic, _count, _name];
			};
			if ((_forEachIndex + 1) mod 6 == 0) then {_magCargoOut pushBack "<br/>"};
		} forEach _sortedMagazineCargo;
		_thisArr pushBack (_magCargoOut joinString "");
	};
	if (count _sortedWeaponCargo > 0) then {
		_thisArr pushBack format["<font color='#ffffff' size='12' face='PuristaMedium'>Weapons:</font>"];
		private _weaponCargoOut = [];
		{
			private _name = _x # 0 # 0;
			private _pic = _x # 0 # 1;
			private _count = _x # 1;
			if (_pic == "") then {
				_weaponCargoOut pushBack format["<font color='#ffffff' size='12' face='EtelkaMonospacePro'><execute expression='systemChat ""%3"";'>%3 x%2</execute></font>", _pic, _count, _name];
			} else {
				_weaponCargoOut pushBack format["<img height='50' image='%1'/><font color='#ffffff' size='10' face='EtelkaMonospacePro'><execute expression='systemChat ""%3"";'>x%2</execute></font>", _pic, _count, _name];
			};
			if ((_forEachIndex + 1) mod 3 == 0) then {_weaponCargoOut pushBack "<br/>"};
		} forEach _sortedWeaponCargo;
		_thisArr pushBack (_weaponCargoOut joinString "");
	};
	if (count _sortedBackpackCargo > 0) then {
		_thisArr pushBack format["<font color='#ffffff' size='12' face='PuristaMedium'>Backpacks:</font>"];
		private _backpackCargoOut = [];
		{
			private _name = _x # 0 # 0;
			private _pic = _x # 0 # 1;
			private _count = _x # 1;
			if (_pic == "") then {
				_backpackCargoOut pushBack format["<font color='#ffffff' size='12' face='EtelkaMonospacePro'><execute expression='systemChat ""%3"";'>%3 x%2</execute></font>", _pic, _count, _name];
			} else {
				_backpackCargoOut pushBack format["<img height='50' image='%1'/><font color='#ffffff' size='10' face='EtelkaMonospacePro'><execute expression='systemChat ""%3"";'>x%2</execute></font>", _pic, _count, _name];
			};
			if ((_forEachIndex + 1) mod 4 == 0) then {_backpackCargoOut pushBack "<br/>"};
		} forEach _sortedBackpackCargo;
		_thisArr pushBack (_backpackCargoOut joinString "");
		// "debug_console" callExtension(str _backpackCargoOut + "~0100");
	};

	// "debug_console" callExtension(str _thisArr + "~1100");
	_thisArr;
};



_getVehicleData = {
	params ["_vic", "_typeCount"];

	private _outArr = [];

	_configName = configOf _vic;
	_class = configName _configName;
	_objType = (_vic call BIS_fnc_objectType) select 1;
	_dispName = getText(_configName >> 'displayName');

	// "debug_console" callExtension (format["VehicleName = %1", _dispName] + "#0110");

	_cat = getText(_configName >> 'category');
	_fac = getText(_configName >> 'faction');
	_side = [getNumber(_configName >> 'side')] call BIS_fnc_sideName;
	_canFloat = (_configName >> "canFloat") call BIS_fnc_getCfgDataBool;

	_totalSeats = [_class, true] call BIS_fnc_crewCount; // Number of total seats: crew + non-FFV cargo/passengers + FFV cargo/passengers
	_crewSeats = [_class, false] call BIS_fnc_crewCount; // Number of crew seats only
	_driverSeats = fullcrew [_vic, "driver", true];
	_gunnerSeats = fullCrew [_vic, "gunner", true];
	_commanderSeats = fullCrew [_vic, "commander", true];
	// _cargoSeats = fullCrew [_vic, "cargo", true];
	_cargoSeats = _totalSeats - _crewSeats; // Number of total cargo/passenger seats: non-FFV + FFV
	_turretSeatsRaw = fullCrew [_vic, "turret", true];
	_turretSeats = _turretSeatsRaw select {(_x # 4) isEqualTo false};
	_ffvSeats = _turretSeatsRaw select {(_x # 4) isEqualTo true};

	_pylons = getAllPylonsInfo _vic;


	_outArr pushBack format["<font size='24' shadow='1' color='#e1701a' face='PuristaBold'>%1</font>", _dispName];
	_outArr pushBack linebreak;
	// "debug_console" callExtension (_dispName + "#0110");


	_outArr pushBack format["<img width='200' height='100' image='%1'/>", getText(_configName >> 'editorPreview')];
	_outArr pushBack linebreak;
	_outArr pushBack format["<img width='128' height='64' image='%1'/>", getText(_configName >> 'picture')];
	_outArr pushBack linebreak;

	_outArr pushBack format["<font size='14' color='#e1701a' face='PuristaBold'>INFO</font>"];
	_outArr pushBack format["<font face='PuristaMedium'>  Side: %1", _side];
	_outArr pushBack format["  Category: %1", _objType];
	_outArr pushBack format["  Faction: %1", _fac];
	_outArr pushBack format["  Can Float: %1", _canFloat];

	_outArr pushBack linebreak;

	_outArr pushBack format["<font size='14' color='#e1701a' face='PuristaBold'>CAPACITY: %1</font>", _totalSeats];
	_outArr pushBack format["<font face='PuristaMedium'>  Driver Seats: %1", count _driverSeats];
	_outArr pushBack format["  Gunner Seats: %1", count _gunnerSeats];
	_outArr pushBack format["  Commander Seats: %1", count _commanderSeats];
	_outArr pushBack format["  Turret Seats: %1", count _turretSeats];
	_outArr pushBack format["  Cargo Seats: %1", _cargoSeats];
	_outArr pushBack format["  FFV Seats: %1</font>", count _ffvSeats];
	_outArr pushBack linebreak;

	_outArr pushBack format["<font size='14' color='#e1701a' face='PuristaBold'>WEAPONS</font>"];

	// DRIVER
	// "debug_console" callExtension ("DRIVER" + "#1100");
	[_driverSeats apply {_x # 3}, "DRIVER/PILOT", _outArr] call _getWeaponry;

	//GUNNER
	// "debug_console" callExtension ("GUNNER" + "#1100");
	[_gunnerSeats apply {_x # 3}, "GUNNER/COPILOT", _outArr] call _getWeaponry;

	// COMMANDER
	// "debug_console" callExtension ("COMMANDER" + "#1100");
	[_commanderSeats apply {_x # 3}, "COMMANDER", _outArr] call _getWeaponry;

	// TURRETS
	// "debug_console" callExtension ("TURRET" + "#1100");
	[_turretSeats apply {_x # 3}, "TURRET", _outArr] call _getWeaponry;


	_outArr pushBack lineBreak;

	_pilotWeps = [];
	_otherWeps = [];

	_parsePylons = {
		params ["_input"];
		_input params ["_index", "_name", "_turretPath", "_magazine","_ammoCount","_id"];
		// "debug_console" callExtension (str _turretPath + "~0000");

		_magName = getText(configFile >> "CfgMagazines" >> _magazine >> "displayName");
		if (_magName isEqualTo "") exitWith {};

		if (_turretPath isEqualTo [-1]) then {
			_pilotWeps pushBack format[
				"        <font color='#87ffbb' face='PuristaSemiBold'>%1</font> <font face='PuristaMedium'><font color='#c2c2c2'>|</font> <font color='#4de4ff'>%2</font> <font color='#c2c2c2'>rounds</font></font>",
				_magName,
				_ammoCount
			];
		} else {
			_otherWeps pushBack format[
				"        <font color='#87ffbb' face='PuristaSemiBold'>%1</font> <font face='PuristaMedium'><font color='#c2c2c2'>|</font> <font color='#4de4ff'>%2</font> <font color='#c2c2c2'>rounds</font></font>",
				_magName,
				_ammoCount
			];
		};
		// "debug_console" callExtension (str _pilotWeps + "~0000");
		// "debug_console" callExtension (str _otherWeps + "~0000");
	};



	// "debug_console" callExtension (str (getAllPylonsInfo _vic) + "~0000");

	if (count _pylons > 0) then {
		_outArr pushBack format["<font size='14' color='#e1701a' face='PuristaBold'>PYLON WEAPONS</font>"];
		{
			[_x] call _parsePylons;
		} forEach _pylons;
		_outArr pushBack format["    <font color='#f6dcbf' face='PuristaSemiBold'>PILOT</font>"];
		{
			_outArr pushBack _x;
			// "debug_console" callExtension (format["Pilot %1",_x] + "~0000");
		} forEach _pilotWeps;
		_outArr pushBack format["    <font color='#f6dcbf' face='PuristaSemiBold'>GUNNER</font>"];
		{
			_outArr pushBack _x;
			// "debug_console" callExtension (format["Other %1",_x]+ "~0000");
		} forEach _otherWeps;
	};


	_invLines = [_x] call _getInventory;

	if (count _invLines > 0) then {
		_outArr pushBack format["<font size='14' color='#e1701a' face='PuristaBold'>INVENTORY</font>"];
		_outArr append _invLines;
	};

	// add vehicle to admin-only section if has inventory for vetting purposes
	_vetterIds = [
		"76561198095073674", // Ghoster
		"76561198049218642" // Bae
	];

  if (count _invLines > 0 && (((getPlayerUID player) in (missionNamespace getVariable ["fnf_staffInfo",[]])) || ((getPlayerUID player) in _vetterIds))) then {
		player createDiarySubject ["VicHasInv", "VicsWithInventory", "\A3\ui_f\data\igui\cfg\simpleTasks\types\danger_ca.paa"];
		_marker = createMarkerLocal [format["VicWithInvMark_%1", round (random 2000)], getPos _x];
		_invOutArr = +_outArr;
		_invOutArr pushBack format["<marker name='%1'>Go to vehicle</marker>", _marker];

		player createDiaryRecord [
			"VicHasInv",
			[
				format["%1", _dispName],
				_invOutArr joinString "<br/>"
			],
			taskNull,
			"?",
			false
		];
	};

	// "debug_console" callExtension (str _invLines + "~0000");

	_outArr pushBack lineBreak;
	_outArr pushBack "-------------------------------------------------------------";



	if (_x inArea "bluforSafeMarker") then {
		player createDiaryRecord [
			"BLUAssets",
			[
				format["%1x %2",_typeCount, _dispName],
				_outArr joinString "<br/>"
			],
			taskNull,
			"?",
			false
		];
	};
	if (_x inArea "opforSafeMarker") then {
		player createDiaryRecord [
			"OPFAssets",
			[
				format["%1x %2",_typeCount, _dispName],
				_outArr joinString "<br/>"
			],
			taskNull,
			"?",
			false
		];
	};
	if (_x inArea "indforSafeMarker") then {
		player createDiaryRecord [
			"INDAssets",
			[
				format["%1x %2",_typeCount, _dispName],
				_outArr joinString "<br/>"
			],
			taskNull,
			"?",
			false
		];
	};
};





phx_assetDiaryBLU = player createDiarySubject ["BLUAssets", "BLU Assets", "\A3\ui_f\data\igui\cfg\simpleTasks\types\car_ca.paa"];
phx_assetDiaryOPF = player createDiarySubject ["OPFAssets", "OPF Assets", "\A3\ui_f\data\igui\cfg\simpleTasks\types\car_ca.paa"];
phx_assetDiaryIND = player createDiarySubject ["INDAssets", "IND Assets", "\A3\ui_f\data\igui\cfg\simpleTasks\types\car_ca.paa"];


_vehiclesToProcess = createHashMap;
{
	_typeCount = _vehiclesToProcess getOrDefault [(typeOf _x), 0];
	_vehiclesToProcess set [(typeOf _x), _typeCount + 1];

} forEach (entities[["Air", "Truck", "Car", "Motorcycle", "Tank", "StaticWeapon", "Ship"], [], false, true] select {(_x call BIS_fnc_objectType select 0) == "Vehicle"});


{
	if (!((configOf _x) call BIS_fnc_displayName in ["Helicopter"])) then {
		[_x, _vehiclesToProcess get (typeOf _x)] call _getVehicleData;
	};

} forEach ([entities[["Air", "Truck", "Car", "Motorcycle", "Tank", "StaticWeapon", "Ship"], [], false, true] select {(_x call BIS_fnc_objectType select 0) == "Vehicle" && (locked _x) in [0,1]}, [], {(configOf _x) call BIS_fnc_displayName}, "DESCEND"] call BIS_fnc_sortBy);

// cleanup sections that weren't used
_diarySubjectsToCheck = ["BLUAssets","OPFAssets","INDAssets"];
{
  _x params ["_name","_displayName","_picture","_countRecords"];
  if (_name in _diarySubjectsToCheck && _countRecords == 0) then {
    player removeDiarySubject _name;
  };
} forEach (allDiarySubjects player);
