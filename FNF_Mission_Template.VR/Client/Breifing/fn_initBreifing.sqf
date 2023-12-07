/*
	Author: Mallen

	Description:
		Sets up the breifing for the mission

	Parameter(s):
		0: ARRAY -  An array of all breifing asset modules
    1: MODULE -  The init module for use with breifing notes etc

	Returns:
		None
*/

params["_assetModules", "_kitInfoModules", "_initModule"];

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

  _sidePlayerCount = _side countSide allPlayers;

  if (_sidePlayerCount > 2) then
  {
    _ran1 = round (random (_sidePlayerCount - 1));
    _ran2 = round (random (_sidePlayerCount - 1));
    _ran3 = round (random (_sidePlayerCount - 1));
    _playersToRead pushBack ((allPlayers select {(side _x isEqualTo _side)}) select _ran1);
    _playersToRead pushBack ((allPlayers select {(side _x isEqualTo _side)}) select _ran2);
    _playersToRead pushBack ((allPlayers select {(side _x isEqualTo _side)}) select _ran3);
  } else {
    _ran1 = round (random (_sidePlayerCount - 1));
    _playersToRead pushBack ((allPlayers select {(side _x isEqualTo _side)}) select _ran1);
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
    _weaponFound = false;
    {
      if (_x isEqualTo _primary) then
      {
        _weaponFound = true;
        break;
      }
    } foreach _weaponsFound;

    if (not _weaponFound) then
    {
      _weaponsFound pushBack _primary;
    };
  } forEach (allPlayers select {(side _x isEqualTo _side)});

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

_assetCreation = {
  params["_side","_objectsToAdd","_index"];
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
    _thisCfg = (_x select 1) call CBA_fnc_getObjectConfig;
    _objectToBaseOffOf = _x select 2;
    _dispName = [_thisCfg] call BIS_fnc_displayName;
    _desc = getText(_thisCfg >> "descriptionShort");
    _pic = [_thisCfg >> "editorPreview", "STRING", "\A3\EditorPreviews_F\Data\CfgVehicles\Box_FIA_Ammo_F.jpg"] call CBA_fnc_getConfigEntry;

    _string = "<font size='20' shadow='1' color='#FF8E38' face='PuristaBold'>" + _dispName + "</font><br/><img width='330' image='" + _pic + "'/><br/><br/><font size='18' shadow='1' color='#FF8E38' face='PuristaBold'>Stats</font><br/>";

    _totalSeats = [_x select 1, true] call BIS_fnc_crewCount; // Number of total seats: crew + non-FFV cargo/passengers + FFV cargo/passengers
    _crewSeats = [_x select 1, false] call BIS_fnc_crewCount; // Number of crew seats only
    _canFloat = (_thisCfg >> "canFloat") call BIS_fnc_getCfgDataBool;

    _string = _string + "  Capacity: " + str(_totalSeats) + "<br/>";
    _string = _string + "  Crew: " + str(_crewSeats) + "<br/>";
    _string = _string + "  Can it float: " + str(_canFloat) + "<br/><br/>";

    _allTurrets = allTurrets _objectToBaseOffOf;
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
          _string = _string + "  " + ([_weaponConfig] call BIS_fnc_displayName) + "<br/>";
          _possibleMagazines = [_weaponConfig] call CBA_fnc_compatibleMagazines;

          {
            _magName = _x select 0;
            _amount = _x select 1;
            if (_magName in _possibleMagazines) then{
              _magConfig = [_magName] call CBA_fnc_getItemConfig;
              _string = _string + "    " + ([_magConfig] call BIS_fnc_displayName) + " ( " + str(_amount) + "x " + str(_objectToBaseOffOf magazineTurretAmmo [_magName, _turretPath]) + " Rounds )" + "<br/>";
            };
          } forEach _magNamesAndAmounts;

          _string = _string + "<br/>";
        } forEach _currentTurretWeaponTurrets;
      };
    } forEach _turretNameAndPaths;

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
    [west, _objectsToAddToDiary, _objectsToAdd] call _assetCreation;
    [{blufor countSide (allPlayers select {alive _x}) > ((playersNumber blufor) / 2)},{
      [west, (_this select 1)] call (_this select 0);
    }, [_loadoutCreation, _kitInfoModules]] call CBA_fnc_waitUntilAndExecute
  } else {
    [{blufor countSide (allPlayers select {alive _x}) > ((playersNumber blufor) / 2)},{
      player createDiarySubject ["blufor", "Blufor", "\A3\Data_F\Flags\flag_blue_CO.paa"];
      [west, (_this select 1)] call (_this select 0);
    }, [_loadoutCreation, _kitInfoModules]] call CBA_fnc_waitUntilAndExecute
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
    [east, _objectsToAddToDiary, _objectsToAdd] call _assetCreation;
    [{east countSide (allPlayers select {alive _x}) > ((playersNumber opfor) / 2)},{
      [east, (_this select 1)] call (_this select 0);
    }, [_loadoutCreation, _kitInfoModules]] call CBA_fnc_waitUntilAndExecute
  } else {
    [{east countSide (allPlayers select {alive _x}) > ((playersNumber opfor) / 2)},{
      player createDiarySubject ["opfor", "Opfor", "\A3\Data_F\Flags\flag_red_CO.paa"];
      [east, (_this select 1)] call (_this select 0);
    }, [_loadoutCreation, _kitInfoModules]] call CBA_fnc_waitUntilAndExecute
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
    [independent, _objectsToAddToDiary, _objectsToAdd] call _assetCreation;
    [{independent countSide (allPlayers select {alive _x}) > ((playersNumber independent) / 2)},{
      [independent, (_this select 1)] call (_this select 0);
    }, [_loadoutCreation, _kitInfoModules]] call CBA_fnc_waitUntilAndExecute
  } else {
    [{independent countSide (allPlayers select {alive _x}) > ((playersNumber independent) / 2)},{
      player createDiarySubject ["indfor", "Independent", "\A3\Data_F\Flags\flag_green_CO.paa"];
      [independent, (_this select 1)] call (_this select 0);
    }, [_loadoutCreation, _kitInfoModules]] call CBA_fnc_waitUntilAndExecute
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
