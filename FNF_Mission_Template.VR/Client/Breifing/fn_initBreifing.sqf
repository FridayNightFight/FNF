/*
	Author: Mallen

	Description:
		Sets up the breifing for the mission

	Parameter(s):
		0: ARRAY -	An array of all breifing asset modules
		1: MODULE -	The init module for use with breifing notes etc

	Returns:
		None
*/

params["_assetModules", "_kitInfoModules", "_initModule", "_assetSelectorModules"];

_bluforPresent = false;
_opforPresent = false;
_indforPresent = false;

_objectsToAddToDiary = [];

//for each breifing asset modules
{
	_syncedObjects = synchronizedObjects _x;
	_objectsToDisplay = [];

	_moduleSide = sideEmpty;

	//for each object synced to the module
	{
		//check if object is a side object, if it is set the module's side
		//TODO: add check for multiple side objects per module
		_objectType = typeOf _x;
		switch (_objectType) do
		{
			case "SideBLUFOR_F":
			{
				_moduleSide = west;
			};
			case "SideOPFOR_F":
			{
				_moduleSide = east;
			};
			case "SideResistance_F":
			{
				_moduleSide = independent;
			};
			default
			{
				//if not a side object its hopefully an object to show in the breifing assets
				//TODO: check if object is a vehicle and should be shown or if its just a random object
				_objectsToDisplay pushBack _x;
			};
		};
	} forEach _syncedObjects;

	//TODO: comment rest of this / redo it as some things not working
	_alreadyAdding = -1;
	{
		if (_x select 0 isEqualTo _moduleSide) then
		{
			_alreadyAdding = _forEachIndex;
		}
	} forEach _objectsToAddToDiary;

	if (_alreadyAdding isEqualTo -1) then
	{
		_toAdd = [_moduleSide, []];
		{
			(_toAdd select 1) pushBack _x;
		} forEach _objectsToDisplay;
		_objectsToAddToDiary pushBack _toAdd;
	} else {
		{
			(_objectsToAddToDiary select _alreadyAdding select 1) pushBack _x;
		} forEach _objectsToDisplay;
	};
} forEach _assetModules;

_selectorsToAddToDiary = [];

{
  _syncedObjects = synchronizedObjects _x;
  _selectorOptions = [];

  _moduleSide = sideEmpty;

  {
    _objectType = typeOf _x;
    switch (_objectType) do
    {
      case "SideBLUFOR_F":
      {
        _moduleSide = west;
      };
      case "SideOPFOR_F":
      {
        _moduleSide = east;
      };
      case "SideResistance_F":
      {
        _moduleSide = independent;
      };
      case "fnf_module_selectorOption":
      {
        _selectorOptions pushBack _x;
      };
      default {};
    };
  } forEach _syncedObjects;
  _optionAssetPucks = [];

  {
    _syncedObjectsOption = synchronizedObjects _x;
    _optionAssets = [];
    {
      _objectType = typeOf _x;
      if (_objectType isEqualTo "fnf_module_selectorAssetHost") then
      {
        continue;
      };
      _optionAssets pushBack _x;
    } forEach _syncedObjectsOption;
    _optionAssetPucks pushBack _optionAssets;
  } forEach _selectorOptions;

  _selectorName = _x getVariable ["fnf_selectorName", "Default Name"];

  //sel Name, options[[optionAmounts],[],[]]
  _selectorsToAddToDiary pushBack [_moduleSide, _selectorName, _optionAssetPucks];
} forEach _assetSelectorModules;

_loadoutCreation = {
	params["_side", "_kitInfoModules"];
	_helmets = [];
	_uniforms = [];
	_vests = [];
	_kitName = "Unknown Kit";
	_kitAuthor = "Unknown Author";

	{
		_module = _x;
		_syncedObjects = synchronizedObjects _x;
		_modSide = sideEmpty;
		_sideCounter = 0;
		{
			_objectType = typeOf _x;
			_modSide = sideEmpty;

			switch (_objectType) do
			{
				case "SideBLUFOR_F":
				{
					_modSide = west;
				};
				case "SideOPFOR_F":
				{
					_modSide = east;
				};
				case "SideResistance_F":
				{
					_modSide = independent;
				};
				default
				{
					continue;
				};
			};

			_sideCounter = _sideCounter + 1;

			if (_modSide isEqualTo _side) then
			{
				_kitName = _module getVariable ["fnf_kitName", "Unknown Kit"];
				_kitAuthor = _module getVariable ["fnf_kitAuthor", "Unknown Author"];
			};
		} forEach _syncedObjects;

		if (_sideCounter isEqualTo 0) then
		{
			if (fnf_debug) then
			{
				systemChat "WARNING: Kit information has no valid side synced to it, Kit information will not be displayed";
			};
			continue;
		};
		if (_sideCounter > 1) then
		{
			if (fnf_debug) then
			{
				systemChat "WARNING: Kit information has more than one side synced to it, Kit information may be inaccurate on all kits";
			};
			continue;
		};

	} forEach _kitInfoModules;

	_playersToRead = [];

	_sidePlayerCount = _side countSide (call BIS_fnc_listPlayers);

	if (_sidePlayerCount > 2) then
	{
		_ran1 = round (random (_sidePlayerCount - 1));
		_ran2 = round (random (_sidePlayerCount - 1));
		_ran3 = round (random (_sidePlayerCount - 1));
		_playersToRead pushBack (((call BIS_fnc_listPlayers) select {(side _x isEqualTo _side)}) select _ran1);
		_playersToRead pushBack (((call BIS_fnc_listPlayers) select {(side _x isEqualTo _side)}) select _ran2);
		_playersToRead pushBack (((call BIS_fnc_listPlayers) select {(side _x isEqualTo _side)}) select _ran3);
	} else {
		_ran1 = round (random (_sidePlayerCount - 1));
		_playersToRead pushBack (((call BIS_fnc_listPlayers) select {(side _x isEqualTo _side)}) select _ran1);
	};

	{
		if (headgear _x isNotEqualTo "") then
		{
			_helmetCfg = (headgear _x) call CBA_fnc_getItemConfig;
			_helmetpic = (_helmetCfg >> "picture") call BIS_fnc_getCfgData;
			_helmets pushBack _helmetpic;
		} else {
			_helmets pushBack "";
		};

		if (uniform _x isNotEqualTo "") then
		{
			_uniformCfg = (uniform _x) call CBA_fnc_getItemConfig;
			_uniformpic = (_uniformCfg >> "picture") call BIS_fnc_getCfgData;
			_uniforms pushBack _uniformpic;
		} else {
			_uniforms pushBack "";
		};

		if (vest _x isNotEqualTo "") then
		{
			_vestCfg = (vest _x) call CBA_fnc_getItemConfig;
			_vestpic = (_vestCfg >> "picture") call BIS_fnc_getCfgData;
			_vests pushBack _vestpic;
		} else {
			_vests pushBack "";
		};
	} forEach _playersToRead;

	_weaponsFound = [];
	{
		_primary = primaryWeapon _x;
		_launcher = secondaryWeapon _x;
		_primaryWeaponFound = false;
		_launcherWeaponFound = false;
		{
			if (_x isEqualTo _primary) then
			{
				_primaryWeaponFound = true;
				continue;
			};
			if (_x isEqualTo _launcher) then
			{
				_launcherWeaponFound = true;
			};
		} foreach _weaponsFound;

		if (not _primaryWeaponFound) then
		{
			_weaponsFound pushBack _primary;
		};
		if (not _launcherWeaponFound) then
		{
			_weaponsFound pushBack _launcher;
		};
	} forEach ((call BIS_fnc_listPlayers) select {(side _x isEqualTo _side)});

	_weaponPics = [];
	{
		_weaponCfg = _x call CBA_fnc_getItemConfig;
		_weaponPic = (_weaponCfg >> "picture") call BIS_fnc_getCfgData;
		_weaponPics pushBack _weaponPic
	} forEach _weaponsFound;

	_string = "<font size='20' shadow='1' face='PuristaBold'>" + _kitName + "</font><br/><font size='18' shadow='1' face='PuristaBold'>" + _kitAuthor + "</font><br/><font size='18' shadow='1' color='#FF8E38' face='PuristaBold'>Uniform:</font><br/>";
	{
		_string = _string + "<img width='110' image='" + _x + "'/>"
	} forEach _helmets;
	_string = _string + "<br/>";
	{
		_string = _string + "<img width='110' image='" + _x + "'/>"
	} forEach _vests;
	_string = _string + "<br/>";
	{
		_string = _string + "<img width='110' image='" + _x + "'/>"
	} forEach _uniforms;
	_string = _string + "<br/>";

	_string = _string + "<font size='18' shadow='1' color='#FF8E38' face='PuristaBold'>Weapons:</font><br/>";
	{
		_string = _string + "<img width='220' image='" + _x + "'/><br/>"
	} forEach _weaponPics;

	switch (_side) do {
		case west:
		{
			player createDiaryRecord ["blufor", ["Loadout",_string], taskNull, "", True];
		};
		case east:
		{
			player createDiaryRecord ["opfor", ["Loadout",_string], taskNull, "", True];
		};
		case independent:
		{
			player createDiaryRecord ["indfor", ["Loadout",_string], taskNull, "", True];
		};
		default { };
	};
};

_assetString = {
	//amount, object type, object itself
	params["_objectToBaseOffOf"];
	_objType = typeOf _objectToBaseOffOf;

	_thisCfg = _objType call CBA_fnc_getObjectConfig;
	_dispName = [_thisCfg] call BIS_fnc_displayName;
	_desc = getText(_thisCfg >> "descriptionShort");
	_pic = [_thisCfg >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;

	_string = "<font size='20' shadow='1' color='#FF8E38' face='PuristaBold'>" + _dispName + "</font><br/><img width='330' image='" + _pic + "'/><br/><br/>";

	_totalSeats = [_objType, true] call BIS_fnc_crewCount; // Number of total seats: crew + non-FFV cargo/passengers + FFV cargo/passengers
	_crewSeats = [_objType, false] call BIS_fnc_crewCount; // Number of crew seats only
	_canFloat = (_thisCfg >> "canFloat") call BIS_fnc_getCfgDataBool;
	if (_totalSeats isNotEqualTo 0) then
	{
		_string = _string + "<font size='18' shadow='1' color='#FF8E38' face='PuristaBold'>Stats</font><br/>";
		_string = _string + "	Capacity: " + str(_totalSeats) + "<br/>";
		_string = _string + "	Crew: " + str(_crewSeats) + "<br/>";
		_string = _string + "	Can it float: " + str(_canFloat) + "<br/><br/>";
	};

	_allTurrets = allTurrets _objectToBaseOffOf;

	if (_allTurrets isNotEqualTo []) then
	{
		_turretNameAndPaths = [[[-1], "Driver"]];
		{
			_currentConfig = (_thisCfg);
			{
				_currentConfig = (_currentConfig >> "Turrets") select _x;
			} forEach _x;
			_name = getText(_currentConfig >> "gunnerName");
			_turretNameAndPaths pushBack [_x, _name];
		} forEach _allTurrets;

		_string = _string + "<font size='18' shadow='1' color='#FF8E38' face='PuristaBold'>Weapons</font>";
		_cfgMagazineWells = configFile >> "CfgMagazineWells";

		{
			_turretPath = _x select 0;
			_currentTurretWeaponTurrets = _objectToBaseOffOf weaponsTurret _turretPath;
			_magNames = _objectToBaseOffOf magazinesTurret [_turretPath, false];
			_magNamesAndAmounts = [];


			{
				_mag = _x;
				_index = _magNamesAndAmounts findIf {_x select 0 isEqualTo _mag;};
				if (_index isNotEqualTo -1) then
				{
					(_magNamesAndAmounts select _index) set [1, (_magNamesAndAmounts select _index select 1) + 1];
				} else {
					_magNamesAndAmounts pushBack [_x, 1];
				};
			} forEach _magNames;



			if (count _currentTurretWeaponTurrets isNotEqualTo 0) then
			{
				_string = _string + "<br/><font size='14' shadow='1' color='#E0701B' face='PuristaBold'>" + (_x select 1) + "</font><br/>";
				{
					_weaponConfig = [_x] call CBA_fnc_getItemConfig;
					_string = _string + "	" + ([_weaponConfig] call BIS_fnc_displayName) + "<br/>";
					_possibleMagazines = [_weaponConfig] call CBA_fnc_compatibleMagazines;

					{
						_magName = _x select 0;
						_amount = _x select 1;
						if (_magName in _possibleMagazines) then{
							_magConfig = [_magName] call CBA_fnc_getItemConfig;
							_string = _string + "		" + ([_magConfig] call BIS_fnc_displayName) + " ( " + str(_amount) + "x " + str(_objectToBaseOffOf magazineTurretAmmo [_magName, _turretPath]) + " Rounds )" + "<br/>";
						};
					} forEach _magNamesAndAmounts;

					_string = _string + "<br/>";
				} forEach _currentTurretWeaponTurrets;
			};
		} forEach _turretNameAndPaths;
	};

	_items = itemCargo _objectToBaseOffOf;
	_magazines = magazineCargo _objectToBaseOffOf;
	_weapons = weaponCargo _objectToBaseOffOf;
	_backpacks = backpackCargo _objectToBaseOffOf;
	_cargo = _items;
	_cargo append _magazines;
	_cargo append _weapons;
	_cargo append _backpacks;

	if (_objectToBaseOffOf isKindOf "AllVehicles" and _objectToBaseOffOf getVariable ["fnf_clearInventory", true]) then
	{
		_cargo = [];
	};

	if (_cargo isNotEqualTo []) then
	{
		//["",0]
		_shortenedCargo = [];
		{
			_itemToFind = _x;
			_index = _shortenedCargo findif {_x select 1 isEqualTo _itemToFind};
			if (_index isNotEqualTo -1) then
			{
				(_shortenedCargo select _index) set [0, (_shortenedCargo select _index select 0) + 1]
			} else {
				_shortenedCargo pushBack [1, _x];
			};
		} forEach _cargo;

		_shortenedCargo sort true;

		_string = _string + "<font size='18' shadow='1' color='#FF8E38' face='PuristaBold'>Inventory</font><br/>";
		_justBreaked = false;
		{
			_justBreaked = false;
			_displayName = getText (configFile >> "CfgMagazines" >> (_x select 1) >> "displayName");
			_tempPic = getText (configFile >> "CfgMagazines" >> (_x select 1) >> "picture");
			if (_tempPic isEqualTo "") then
			{
				_displayName = getText (configFile >> "CfgWeapons" >> (_x select 1) >> "displayName");
				_tempPic = getText (configFile >> "CfgWeapons" >> (_x select 1) >> "picture");
				if (_tempPic isEqualTo "") then
				{
					_displayName = getText (configFile >> "CfgVehicles" >> (_x select 1) >> "displayName");
					_tempPic = getText (configFile >> "CfgVehicles" >> (_x select 1) >> "picture");
					if (_tempPic isEqualTo "") then
					{
						_displayName = getText (configFile >> "CfgAmmo" >> (_x select 1) >> "displayName");
						_tempPic = getText (configFile >> "CfgAmmo" >> (_x select 1) >> "picture");
					};
				};
			};

			_string = _string + "<font size='32'>[</font>" + str(_x select 0) + "x<img src='" + _tempPic + "' width='32' height='32' title='" + _displayName + "' /><font size='32'>]</font>";

			if (((_forEachIndex + 1) % 5) isEqualTo 0) then
			{
				_string = _string + "<br/>";
				_justBreaked = true;
			};
		} forEach _shortenedCargo;
		if (_justBreaked) then
		{
			_string = _string + "<br/>";
		} else {
			_string = _string + "<br/><br/>";
		};
	};

	_string;
};

_assetCreation = {
	params["_side","_objectsToAdd","_index","_assetString"];
	_itemsToAdd = _objectsToAdd select _index select 1;

	_compactedObjects = [];
	{
		_objectType = typeOf _x;
		_alreadyAdded = -1;
		{
			if (_x select 1 isEqualTo _objectType) then
			{
				_alreadyAdded = _forEachIndex;
				break;
			};
		} forEach _compactedObjects;

		if (_alreadyAdded isEqualTo -1) then
		{
			_compactedObjects pushBack [1, _objectType, _x];
		} else {
			_currentAmount = _compactedObjects select _alreadyAdded select 0;
			_compactedObjects select _alreadyAdded set [0, _currentAmount + 1];
		};
	} forEach _itemsToAdd;

	{
		_string = [_x select 2] call _assetString;
		_thisCfg = (_x select 1) call CBA_fnc_getObjectConfig;
		_dispName = [_thisCfg] call BIS_fnc_displayName;

		switch (_side) do {
			case west:
			{
				player createDiaryRecord ["blufor", [str(_x select 0) + "x " + _dispName,_string], taskNull, "", True];
			};
			case east:
			{
				player createDiaryRecord ["opfor", [str(_x select 0) + "x " + _dispName,_string], taskNull, "", True];
			};
			case independent:
			{
				player createDiaryRecord ["indfor", [str(_x select 0) + "x " + _dispName,_string], taskNull, "", True];
			};
			default { };
		};
	} forEach _compactedObjects;
};

_selectorCreation = {
  params["_selectors", "_side", "_assetString"];
  _selectorsToUse = _selectors select {(_x select 0) isEqualTo _side};
  {
    _x params ["_side", "_selectorName", "_optionAssetPucks"];
    _optionAssetPucksAndStrings = [];
    //[[[],""],[]]

    {
      _tempString = "";
      {
        _string = [_x] call _assetString;
        _tempString = _tempString + _string;
      } forEach _x;
      _optionAssetPucksAndStrings pushBack [_x, _tempString];
    } forEach _optionAssetPucks;

    _diaryEntry = "";
    _subject = "";

    switch (_side) do {
      case west:
      {
        _diaryEntry = player createDiaryRecord ["blufor", ["Selector: " + _selectorName,""], taskNull, "", True];
        _subject = "blufor";
      };
      case east:
      {
        _diaryEntry = player createDiaryRecord ["opfor", ["Selector: " + _selectorName,""], taskNull, "", True];
        _subject = "opfor";
      };
      case independent:
      {
        _diaryEntry = player createDiaryRecord ["indfor", ["Selector: " + _selectorName,""], taskNull, "", True];
        _subject = "indfor";
      };
      default { };
    };

    if (playerSide isEqualTo _side or playerSide isEqualTo sideLogic) then
    {
      [{
        (_this select 0) params ["_diaryEntry", "_subject", "_optionAssetPucksAndStrings", "_selectorName"];
        _optionNumber = 0;
        _optionText = "";
        {
          if (simulationEnabled (_x select 0 select 0)) then
          {
            _optionNumber = _forEachIndex + 1;
            _optionText = (_x select 1);
          };
        } forEach _optionAssetPucksAndStrings;

        _finalString = "<font size='25' shadow='1' color='#FFFFFF' face='PuristaBold'>Selection: Option " + str(_optionNumber) + "</font><br/>" + _optionText + "<font size='25' shadow='1' color='#FFFFFF' face='PuristaBold'>Other Options:</font><br/>";

        {
          if ((_forEachIndex + 1) isEqualTo _optionNumber) then
          {
            continue;
          };
          _finalString = _finalString + "<font size='22' shadow='1' color='#FFFFFF' face='PuristaBold'>Option " + str(_forEachIndex + 1) + ":</font><br/>" + (_x select 1);
        } forEach _optionAssetPucksAndStrings;
        player setDiaryRecordText [[_subject,_diaryEntry],["Selector: " + _selectorName,_finalString,""]];
      },1,[_diaryEntry, _subject, _optionAssetPucksAndStrings, _selectorName]] call CBA_fnc_addPerFrameHandler;
    } else {
      //create entry and leave it
      _finalString = "<font size='25' shadow='1' color='#FFFFFF' face='PuristaBold'>Unknown Selection</font><br/>";
      {
        _finalString = _finalString + "<font size='22' shadow='1' color='#FFFFFF' face='PuristaBold'>Option " + str(_forEachIndex + 1) + ":</font><br/>" + (_x select 1);
      } forEach _optionAssetPucksAndStrings;
      player setDiaryRecordText [[_subject,_diaryEntry],["Selector: " + _selectorName,_finalString,""]];
    };
  } forEach _selectorsToUse;
};

if (playableSlotsNumber blufor > 0) then
{
	_objectsToAdd = -1;
	{
		if (_x select 0 isEqualTo west) then
		{
			_objectsToAdd = _forEachIndex;
		}
	} forEach _objectsToAddToDiary;

  if (_objectsToAdd isNotEqualTo -1) then
  {
    player createDiarySubject ["blufor", "Blufor", "\A3\Data_F\Flags\flag_blue_CO.paa"];
    [west, _objectsToAddToDiary, _objectsToAdd, _assetString] call _assetCreation;
    [_selectorsToAddToDiary, west, _assetString] call _selectorCreation;
    [{blufor countSide (call BIS_fnc_listPlayers) > ((playersNumber blufor) / 2)},{
      [west, (_this select 1)] call (_this select 0);
    }, [_loadoutCreation, _kitInfoModules]] call CBA_fnc_waitUntilAndExecute
  } else {
    [{blufor countSide (call BIS_fnc_listPlayers) > ((playersNumber blufor) / 2)},{
      player createDiarySubject ["blufor", "Blufor", "\A3\Data_F\Flags\flag_blue_CO.paa"];
      [(_this select 2), west, (_this select 3)] call (_this select 4);
      [west, (_this select 1)] call (_this select 0);
    }, [_loadoutCreation, _kitInfoModules, _selectorsToAddToDiary, _assetString, _selectorCreation]] call CBA_fnc_waitUntilAndExecute
  };
};

if (playableSlotsNumber opfor > 0) then
{
	_objectsToAdd = -1;
	{
		if (_x select 0 isEqualTo east) then
		{
			_objectsToAdd = _forEachIndex;
		}
	} forEach _objectsToAddToDiary;

  if (_objectsToAdd isNotEqualTo -1) then
  {
    player createDiarySubject ["opfor", "Opfor", "\A3\Data_F\Flags\flag_red_CO.paa"];
    [east, _objectsToAddToDiary, _objectsToAdd, _assetString] call _assetCreation;
    [_selectorsToAddToDiary, east, _assetString] call _selectorCreation;
    [{east countSide (call BIS_fnc_listPlayers) > ((playersNumber opfor) / 2)},{
      [east, (_this select 1)] call (_this select 0);
    }, [_loadoutCreation, _kitInfoModules]] call CBA_fnc_waitUntilAndExecute
  } else {
    [{east countSide (call BIS_fnc_listPlayers) > ((playersNumber opfor) / 2)},{
      player createDiarySubject ["opfor", "Opfor", "\A3\Data_F\Flags\flag_red_CO.paa"];
      [(_this select 2), east, (_this select 3)] call (_this select 4);
      [east, (_this select 1)] call (_this select 0);
    }, [_loadoutCreation, _kitInfoModules, _selectorsToAddToDiary, _assetString, _selectorCreation]] call CBA_fnc_waitUntilAndExecute
  };
};

if (playableSlotsNumber independent > 0) then
{
	_objectsToAdd = -1;
	{
		if (_x select 0 isEqualTo independent) then
		{
			_objectsToAdd = _forEachIndex;
		}
	} forEach _objectsToAddToDiary;

  if (_objectsToAdd isNotEqualTo -1) then
  {
    player createDiarySubject ["indfor", "Independent", "\A3\Data_F\Flags\flag_green_CO.paa"];
    [independent, _objectsToAddToDiary, _objectsToAdd, _assetString] call _assetCreation;
    [_selectorsToAddToDiary, independent, _assetString] call _selectorCreation;
    [{independent countSide (call BIS_fnc_listPlayers) > ((playersNumber independent) / 2)},{
      [independent, (_this select 1)] call (_this select 0);
    }, [_loadoutCreation, _kitInfoModules]] call CBA_fnc_waitUntilAndExecute
  } else {
    [{independent countSide (call BIS_fnc_listPlayers) > ((playersNumber independent) / 2)},{
      player createDiarySubject ["indfor", "Independent", "\A3\Data_F\Flags\flag_green_CO.paa"];
      [(_this select 2), independent, (_this select 3)] call (_this select 4);
      [independent, (_this select 1)] call (_this select 0);
    }, [_loadoutCreation, _kitInfoModules, _selectorsToAddToDiary, _assetString, _selectorCreation]] call CBA_fnc_waitUntilAndExecute
  };
};

_rules = _initModule getVariable ["fnf_breifingRules", ""];
_ao = _initModule getVariable ["fnf_breifingAO", ""];
_background = _initModule getVariable ["fnf_breifingBackground", ""];
_notes = _initModule getVariable ["fnf_breifingNotes", ""];

_viewDistance = _initModule getVariable ["fnf_viewDistance", 800];
_fortifyPoints = _initModule getVariable ["fnf_fortifyPoints", 0];
_fortifyColour = _initModule getVariable ["fnf_fortifyColour", "Green"];
_timeLimit = _initModule getVariable ["fnf_timeLimit", 50];

if (_rules isNotEqualTo "") then
{
	player createDiaryRecord ["Diary", ["Mission Rules",_rules], taskNull, "", True];
};
if (_ao isNotEqualTo "") then
{
	player createDiaryRecord ["Diary", ["Area of Operations",_ao], taskNull, "", True];
};
if (_background isNotEqualTo "") then
{
	player createDiaryRecord ["Diary", ["Background",_background], taskNull, "", True];
};
if (_notes isNotEqualTo "") then
{
	player createDiaryRecord ["Diary", ["Notes",_notes], taskNull, "", True];
};
player createDiaryRecord ["Diary", ["Mission Details","View Distance: " + str(_viewDistance) + "m<br/>Fortify Points: " + str(_fortifyPoints) + "<br/>Fortify Colour: " + _fortifyColour + "<br/>Time Limit: " + str(_timeLimit) + " Minutes"], taskNull, "", True];
