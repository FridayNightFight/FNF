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
    };

    if (count _thisArr > 0) then {
      private _turretConfig = [_vic, _x] call BIS_fnc_turretConfig;
      private _turretDisplayName = [_turretConfig] call BIS_fnc_displayName;
      if (_turretDisplayName != "") then {
        _outArr pushBack format["    <t color='#f6dcbf' face='PuristaSemiBold'>%1 (""%2"")</t>", _seatCategory, _turretDisplayName];
      } else {
        _outArr pushBack format["    <t color='#f6dcbf' face='PuristaSemiBold'>%1</t>", _seatCategory];
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
    _thisArr pushBack format["        <t color='#87ffbb' face='PuristaSemiBold'>%1</t>", _wepDisp];
    {
      _thisMag = _x;
      _magAmmo = _vic magazineTurretAmmo [_x, _path];
      _magCount = (_magsHere select {_x # 0== _thisMag} apply {_x # 1}) # 0;

      private _magConfig = (configFile >> "CfgMagazines" >> _thisMag);
      private _magName = [(_magConfig >> "displayName"), "STRING", "Magazine"] call CBA_fnc_getConfigEntry;
      if (_magName isEqualTo "") then {_magName = "Magazine"};



      _magsArr pushBack format[
        "            + <t color='#4de4ff' size='1' face='PuristaMedium'><t color='#ffffff'>%1</t> <t color='#c2c2c2'>|</t> %2 <t color='#c2c2c2'>rounds</t> <t color='#c2c2c2'>|</t> %3 <t color='#c2c2c2'>mags</t></t>",
        _magName,
        _magAmmo,
        _magCount
      ];
    } forEach _magsFound;
  } else {
    // This is a pylon weapon, so make a unique entry and directly check ammo on pylon
    _thisArr pushBack format["        <t color='#87ffbb' face='PuristaSemiBold'>%1</t> <t face='PuristaMedium'>[Pylon]</t>", _wepDisp];
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
        "        <t color='#4de4ff' size='1' face='PuristaMedium'><t color='#ffffff'>%1</t> <t color='#c2c2c2'>|</t> %2 <t color='#c2c2c2'>rounds</t> <t color='#c2c2c2'>|</t> %3 <t color='#c2c2c2'>mags</t></t>",
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
    _thisArr pushBack format["<t color='#ffffff' size='1' face='PuristaMedium'>Items:</t>"];
    private _itemCargoOut = [];
    {
      private _name = _x # 0 # 0;
      private _pic = _x # 0 # 1;
      private _count = _x # 1;
      if (_pic == "") then {
        _itemCargoOut pushBack format["<t color='#ffffff' size='1' face='EtelkaMonospacePro'><execute expression='systemChat ""%3"";'>%3 x%2</execute></t>", _pic, _count, _name];
      } else {
        _itemCargoOut pushBack format["<img size='1' image='%1'/><t color='#ffffff' size='0.8' face='EtelkaMonospacePro'><execute expression='systemChat ""%3"";'>x%2</execute></t>", _pic, _count, _name];
      };
      if ((_forEachIndex + 1) mod 6 == 0) then {_itemCargoOut pushBack "<br/>"};
    } forEach _sortedItemCargo;
    _thisArr pushBack (_itemCargoOut joinString "");
  };
  if (count _sortedMagazineCargo > 0) then {
    _thisArr pushBack format["<t color='#ffffff' size='1' face='PuristaMedium'>Magazines:</t>"];
    private _magCargoOut = [];
    {
      private _name = _x # 0 # 0;
      private _pic = _x # 0 # 1;
      private _count = _x # 1;
      if (_pic == "") then {
        _magCargoOut pushBack format["<t color='#ffffff' size='0.8' face='EtelkaMonospacePro'><execute expression='systemChat ""%3"";'>%3 x%2</execute></t>", _pic, _count, _name];
      } else {
        _magCargoOut pushBack format["<img size='1' image='%1'/><t color='#ffffff' size='0.8' face='EtelkaMonospacePro'><execute expression='systemChat ""%3"";'>x%2</execute></t>", _pic, _count, _name];
      };
      if ((_forEachIndex + 1) mod 6 == 0) then {_magCargoOut pushBack "<br/>"};
    } forEach _sortedMagazineCargo;
    _thisArr pushBack (_magCargoOut joinString "");
  };
  if (count _sortedWeaponCargo > 0) then {
    _thisArr pushBack format["<t color='#ffffff' size='1' face='PuristaMedium'>Weapons:</t>"];
    private _weaponCargoOut = [];
    {
      private _name = _x # 0 # 0;
      private _pic = _x # 0 # 1;
      private _count = _x # 1;
      if (_pic == "") then {
        _weaponCargoOut pushBack format["<t color='#ffffff' size='0.8' face='EtelkaMonospacePro'><execute expression='systemChat ""%3"";'>%3 x%2</execute></t>", _pic, _count, _name];
      } else {
        _weaponCargoOut pushBack format["<img height='50' image='%1'/><t color='#ffffff' size='0.8' face='EtelkaMonospacePro'><execute expression='systemChat ""%3"";'>x%2</execute></t>", _pic, _count, _name];
      };
      if ((_forEachIndex + 1) mod 3 == 0) then {_weaponCargoOut pushBack "<br/>"};
    } forEach _sortedWeaponCargo;
    _thisArr pushBack (_weaponCargoOut joinString "");
  };
  if (count _sortedBackpackCargo > 0) then {
    _thisArr pushBack format["<t color='#ffffff' size='1' face='PuristaMedium'>Backpacks:</t>"];
    private _backpackCargoOut = [];
    {
      private _name = _x # 0 # 0;
      private _pic = _x # 0 # 1;
      private _count = _x # 1;
      if (_pic == "") then {
        _backpackCargoOut pushBack format["<t color='#ffffff' size='1' face='EtelkaMonospacePro'><execute expression='systemChat ""%3"";'>%3 x%2</execute></t>", _pic, _count, _name];
      } else {
        _backpackCargoOut pushBack format["<img height='50' image='%1'/><t color='#ffffff' size='0.8' face='EtelkaMonospacePro'><execute expression='systemChat ""%3"";'>x%2</execute></t>", _pic, _count, _name];
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
  if (_canFloat) then {_canFloat = "Yes"} else {_canFLoat = "No"};
  private ["_locked", "_keySide"];
  switch (true) do {
    case (locked _vic > 2): {_locked = "Yes"};
    default {_locked = "No"};
  };
  _keySide = (_x getVariable ["ace_vehiclelock_lockSide", civilian]) call BIS_fnc_sideName;

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


  _outArr pushBack format["<t size='1.5' shadow='1' color='#e1701a' face='PuristaBold'>%1</t>", _dispName];
  _outArr pushBack linebreak;
  // "debug_console" callExtension (_dispName + "#0110");


  _outArr pushBack format["<img size='5' image='%1'/>", getText(_configName >> 'editorPreview')];
  _outArr pushBack linebreak;
  _outArr pushBack format["<img size='2' image='%1'/>", getText(_configName >> 'picture')];
  _outArr pushBack linebreak;

  _outArr pushBack format["<t size='1.2' color='#e1701a' face='PuristaBold'>INFO</t>"];
  _outArr pushBack format["<t face='PuristaMedium'>  Native Side: %1", _side];
  _outArr pushBack format["  Faction: %1", _fac];
  _outArr pushBack format["  Category: %1", _objType];
  _outArr pushBack format["  Can Float: %1", _canFloat];
  _outArr pushBack format["  Locked: %1", _locked];
  _outArr pushBack format["  Keyed for: %1", _keySide];

  _outArr pushBack linebreak;

  _outArr pushBack format["<t size='1.2' color='#e1701a' face='PuristaBold'>CAPACITY: %1</t>", _totalSeats];
  _outArr pushBack format["<t face='PuristaMedium'>  Driver Seats: %1", count _driverSeats];
  _outArr pushBack format["  Gunner Seats: %1", count _gunnerSeats];
  _outArr pushBack format["  Commander Seats: %1", count _commanderSeats];
  _outArr pushBack format["  Turret Seats: %1", count _turretSeats];
  _outArr pushBack format["  Cargo Seats: %1", _cargoSeats];
  _outArr pushBack format["  FFV Seats: %1</t>", count _ffvSeats];
  _outArr pushBack linebreak;

  _outArr pushBack format["<t size='1.2' color='#e1701a' face='PuristaBold'>WEAPONS</t>"];

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
        "        <t color='#87ffbb' face='PuristaSemiBold'>%1</t> <t face='PuristaMedium'><t color='#c2c2c2'>|</t> <t color='#4de4ff'>%2</t> <t color='#c2c2c2'>rounds</t></t>",
        _magName,
        _ammoCount
      ];
    } else {
      _otherWeps pushBack format[
        "        <t color='#87ffbb' face='PuristaSemiBold'>%1</t> <t face='PuristaMedium'><t color='#c2c2c2'>|</t> <t color='#4de4ff'>%2</t> <t color='#c2c2c2'>rounds</t></t>",
        _magName,
        _ammoCount
      ];
    };
    // "debug_console" callExtension (str _pilotWeps + "~0000");
    // "debug_console" callExtension (str _otherWeps + "~0000");
  };



  // "debug_console" callExtension (str (getAllPylonsInfo _vic) + "~0000");

  if (count _pylons > 0) then {
    _outArr pushBack format["<t size='1.2' color='#e1701a' face='PuristaBold'>PYLON WEAPONS</t>"];
    {
      [_x] call _parsePylons;
    } forEach _pylons;
    _outArr pushBack format["    <t color='#f6dcbf' face='PuristaSemiBold'>PILOT</t>"];
    {
      _outArr pushBack _x;
      // "debug_console" callExtension (format["Pilot %1",_x] + "~0000");
    } forEach _pilotWeps;
    _outArr pushBack format["    <t color='#f6dcbf' face='PuristaSemiBold'>GUNNER</t>"];
    {
      _outArr pushBack _x;
      // "debug_console" callExtension (format["Other %1",_x]+ "~0000");
    } forEach _otherWeps;
  };


  _invLines = [_vic] call _getInventory;

  if (count _invLines > 0) then {
    _outArr pushBack format["<t size='1.2' color='#e1701a' face='PuristaBold'>INVENTORY</t>"];
    _outArr append _invLines;
  };


  _outArr pushBack lineBreak;
  _outArr pushBack "-------------------------------------------------------------";

  [_dispName, _outArr joinString "<br/>"];
};

#define MISSIONVICS (entities[["Air", "Truck", "Car", "Motorcycle", "Tank", "StaticWeapon", "Ship"], [], false, true] select {(_x call BIS_fnc_objectType select 0) == "Vehicle"})
#define MISSIONVICS_SORTED ([entities[["Air", "Truck", "Car", "Motorcycle", "Tank", "StaticWeapon", "Ship"], [], false, true] select {(_x call BIS_fnc_objectType select 0) == "Vehicle"}, [], {(configOf _x) call BIS_fnc_displayName}, "DESCEND"] call BIS_fnc_sortBy)

// put vehicles into a hashmap based on who they belong to (if anyone)
phx_vehiclesToProcess = [["BLU",[]],["OPF",[]],["IND",[]],["OTHER",[]]];
switch (phx_gameMode == "sustainedAssault") do {
  case false: {
    {
      private _vehicle = _x;
      switch (true) do {
        case (_vehicle inArea "bluforSafeMarker"): {
          [phx_vehiclesToProcess, "BLU", _vehicle] call BIS_fnc_addToPairs;
        };
        case (_vehicle inArea "opforSafeMarker"): {
          [phx_vehiclesToProcess, "OPF", _vehicle] call BIS_fnc_addToPairs;
        };
        case (_vehicle inArea "indforSafeMarker"): {
          [phx_vehiclesToProcess, "IND", _vehicle] call BIS_fnc_addToPairs;
        };
        default {
          [phx_vehiclesToProcess, "OTHER", _vehicle] call BIS_fnc_addToPairs;
        };
      };
    } forEach MISSIONVICS;
  };
  case true: {
    {
      private _vehicle = _x;
      switch (true) do {
        case (_vehicle inArea safeZone_BLUFOR || _vehicle inArea "rally_west_marker"): {
          [phx_vehiclesToProcess, "BLU", _vehicle] call BIS_fnc_addToPairs;
        };
        case (_vehicle inArea safeZone_OPFOR || _vehicle inArea "rally_east_marker"): {
          [phx_vehiclesToProcess, "OPF", _vehicle] call BIS_fnc_addToPairs;
        };
        case (_vehicle inArea safeZone_Independent || _vehicle inArea "rally_independent_marker"): {
          [phx_vehiclesToProcess, "IND", _vehicle] call BIS_fnc_addToPairs;
        };
        default {
          [phx_vehiclesToProcess, "OTHER", _vehicle] call BIS_fnc_addToPairs;
        };
      };
    } forEach MISSIONVICS;
  };
};


// create diary records
{
  private _querySide = _x;
  private _objects = [phx_vehiclesToProcess, _querySide, []] call BIS_fnc_getFromPairs;
  if (count _objects > 0) then {
    {
      _x params ["_vehicle", "_count"];
      private _processedText = "";
      private _objectsToProcess = _objects select {typeOf _x == _vehicle};

      {
        private _processed = [];
        if (!((configOf _x) call BIS_fnc_displayName in ["Helicopter"])) then {
          _processed = [_x, _count] call _getVehicleData;
        };

        _processed params ["_dispName", "_diaryText"];
        _processedText = _processedText + "<br/>" + _diaryText;
      } forEach _objectsToProcess;

      [
        missionNamespace getVariable format["phx_ui_structTextRef_Assets%1", _querySide],
        format["%1x %2", _count, (configFile >> "CfgVehicles" >> _vehicle) call BIS_fnc_displayName],
        _processedText
      ] call BIS_fnc_setToPairs;

    } forEach ((_objects apply {typeOf _x}) call BIS_fnc_consolidateArray);
  };
} forEach ["BLU", "OPF", "IND", "OTHER"];

true
