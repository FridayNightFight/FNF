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

params["_modules", "_initModule"];

_bluforPresent = false;
_opforPresent = false;
_indforPresent = false;

_objectsToAddToDiary = [];

{
  _syncedObjects = synchronizedObjects _x;
  _objectsToDisplay = [];

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
      default
      {
        _objectsToDisplay pushBack _x;
      };
    };
  } forEach _syncedObjects;

  _alreadyAdding = -1;
  {
    if (_x select 0 == _moduleSide) then
    {
      _alreadyAdding = _forEachIndex;
    }
  } forEach _objectsToAddToDiary;

  if (_alreadyAdding == -1) then
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
} forEach _modules;

_loadoutCreation = {
  params["_side"];
  _helmets = [];
  _uniforms = [];
  _vests = [];

  _playersToRead = [];

  _sidePlayerCount = _side countSide allPlayers;

  if (_sidePlayerCount > 2) then
  {
    _ran1 = round (random (_sidePlayerCount - 1));
    _ran2 = round (random (_sidePlayerCount - 1));
    _ran3 = round (random (_sidePlayerCount - 1));
    _playersToRead pushBack ((allPlayers select {(side _x == _side)}) select _ran1);
    _playersToRead pushBack ((allPlayers select {(side _x == _side)}) select _ran2);
    _playersToRead pushBack ((allPlayers select {(side _x == _side)}) select _ran3);
  } else {
    _ran1 = round (random (_sidePlayerCount - 1));
    _playersToRead pushBack ((allPlayers select {(side _x == _side)}) select _ran1);
  };

  {
    if (headgear _x != "") then
    {
      _helmetCfg = (headgear _x) call CBA_fnc_getItemConfig;
      _helmetpic = (_helmetCfg >> "picture") call BIS_fnc_getCfgData;
      _helmets pushBack _helmetpic;
    } else {
      _helmets pushBack "";
    };

    if (uniform _x != "") then
    {
      _uniformCfg = (uniform _x) call CBA_fnc_getItemConfig;
      _uniformpic = (_uniformCfg >> "picture") call BIS_fnc_getCfgData;
      _uniforms pushBack _uniformpic;
    } else {
      _uniforms pushBack "";
    };

    if (vest _x != "") then
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
      if (_x == _primary) then
      {
        _weaponFound = true;
        break;
      }
    } foreach _weaponsFound;

    if (not _weaponFound) then
    {
      _weaponsFound pushBack _primary;
    };
  } forEach (allPlayers select {(side _x == _side)});

  _weaponPics = [];
  {
    _weaponCfg = _x call CBA_fnc_getItemConfig;
    _weaponPic = (_weaponCfg >> "picture") call BIS_fnc_getCfgData;
    _weaponPics pushBack _weaponPic
  } forEach _weaponsFound;

  _string = "<font size='18' shadow='1' color='#FF8E38' face='PuristaBold'>Uniform</font><br/>";
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

  _string = _string + "<font size='18' shadow='1' color='#FF8E38' face='PuristaBold'>Weapons</font><br/>";
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
      if (_objectType == _x select 1) then
      {
        _alreadyAdded = _forEachIndex;
        break;
      };
    } forEach _compactedObjects;

    if (_alreadyAdded == -1) then
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



    _driverWeaponTurrets = _objectToBaseOffOf weaponsTurret [-1];
    _gunnerWeaponTurrets = _objectToBaseOffOf weaponsTurret [0];
    _commanderWeaponTurrets = _objectToBaseOffOf weaponsTurret [0,0];

    _string = _string + "<font size='18' shadow='1' color='#FF8E38' face='PuristaBold'>Weapons</font>";

    if (count _driverWeaponTurrets != 0) then
    {
      _string = _string + "<br/><font size='14' shadow='1' color='#E0701B' face='PuristaBold'>Driver Weapons</font><br/>";
      {
        _string = _string + "  " + ([[_x] call CBA_fnc_getItemConfig] call BIS_fnc_displayName) + "<br/>";
      } forEach _driverWeaponTurrets;
    };

    if (count _gunnerWeaponTurrets != 0) then
    {
      _string = _string + "<br/><font size='14' shadow='1' color='#E0701B' face='PuristaBold'>Gunner Weapons</font><br/>";
      {
        _string = _string + "  " + ([[_x] call CBA_fnc_getItemConfig] call BIS_fnc_displayName) + "<br/>";
      } forEach _gunnerWeaponTurrets;
    };

    if (count _commanderWeaponTurrets != 0) then
    {
      _string = _string + "<br/><font size='14' shadow='1' color='#E0701B' face='PuristaBold'>Commander Weapons</font><br/>";
      {
        _string = _string + "  " + ([[_x] call CBA_fnc_getItemConfig] call BIS_fnc_displayName) + "<br/>";
      } forEach _commanderWeaponTurrets;
    };

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
    if (_x select 0 == west) then
    {
      _objectsToAdd = _forEachIndex;
    }
  } forEach _objectsToAddToDiary;

  if (_objectsToAdd != -1) then
  {
    player createDiarySubject ["blufor", "Blufor", "\A3\Data_F\Flags\flag_blue_CO.paa"];
    [west, _objectsToAddToDiary, _objectsToAdd] call _assetCreation;
    [{blufor countSide (allPlayers select {alive _x}) > 0},{
      [west] call (_this select 0);
    }, [_loadoutCreation]] call CBA_fnc_waitUntilAndExecute
  } else {
    [{blufor countSide (allPlayers select {alive _x}) > 0},{
      player createDiarySubject ["blufor", "Blufor", "\A3\Data_F\Flags\flag_blue_CO.paa"];
      [west] call (_this select 0);
    }, [_loadoutCreation]] call CBA_fnc_waitUntilAndExecute
  };
};

if (playableSlotsNumber opfor > 0) then
{
  _objectsToAdd = -1;
  {
    if (_x select 0 == east) then
    {
      _objectsToAdd = _forEachIndex;
    }
  } forEach _objectsToAddToDiary;

  if (_objectsToAdd != -1) then
  {
    player createDiarySubject ["opfor", "Opfor", "\A3\Data_F\Flags\flag_red_CO.paa"];
    [east, _objectsToAddToDiary, _objectsToAdd] call _assetCreation;
    [{east countSide (allPlayers select {alive _x}) > 0},{
      [west] call (_this select 0);
    }, [_loadoutCreation]] call CBA_fnc_waitUntilAndExecute
  } else {
    [{east countSide (allPlayers select {alive _x}) > 0},{
      player createDiarySubject ["opfor", "Opfor", "\A3\Data_F\Flags\flag_red_CO.paa"];
      [east] call (_this select 0);
    }, [_loadoutCreation]] call CBA_fnc_waitUntilAndExecute
  };
};

if (playableSlotsNumber independent > 0) then
{
  _objectsToAdd = -1;
  {
    if (_x select 0 == independent) then
    {
      _objectsToAdd = _forEachIndex;
    }
  } forEach _objectsToAddToDiary;

  if (_objectsToAdd != -1) then
  {
    player createDiarySubject ["indfor", "Independent", "\A3\Data_F\Flags\flag_green_CO.paa"];
    [independent, _objectsToAddToDiary, _objectsToAdd] call _assetCreation;
    [{independent countSide (allPlayers select {alive _x}) > 0},{
      [west] call (_this select 0);
    }, [_loadoutCreation]] call CBA_fnc_waitUntilAndExecute
  } else {
    [{independent countSide (allPlayers select {alive _x}) > 0},{
      player createDiarySubject ["indfor", "Independent", "\A3\Data_F\Flags\flag_green_CO.paa"];
      [independent] call (_this select 0);
    }, [_loadoutCreation]] call CBA_fnc_waitUntilAndExecute
  };
};

_rules = _initModule getVariable ["fnf_breifingRules", ""];
_ao = _initModule getVariable ["fnf_breifingAO", ""];
_background = _initModule getVariable ["fnf_breifingBackground", ""];
_notes = _initModule getVariable ["fnf_breifingNotes", ""];

_viewDistance = _initModule getVariable "fnf_viewDistance";
_fortifyPoints = _initModule getVariable "fnf_fortifyPoints";
_fortifyColour = _initModule getVariable ["fnf_fortifyColour", "Green"];
_timeLimit = _initModule getVariable ["fnf_timeLimit", 50];

if (_rules != "") then
{
  player createDiaryRecord ["Diary", ["Mission Rules",_rules], taskNull, "", True];
};
if (_ao != "") then
{
  player createDiaryRecord ["Diary", ["Area of Operations",_ao], taskNull, "", True];
};
if (_background != "") then
{
  player createDiaryRecord ["Diary", ["Background",_background], taskNull, "", True];
};
if (_notes != "") then
{
  player createDiaryRecord ["Diary", ["Notes",_notes], taskNull, "", True];
};
player createDiaryRecord ["Diary", ["Mission Details","View Distance: " + str(_viewDistance) + "m<br/>Fortify Points: " + str(_fortifyPoints) + "<br/>Fortify Colour: " + _fortifyColour + "<br/>Time Limit: " + str(_timeLimit) + " Minutes"], taskNull, "", True];
