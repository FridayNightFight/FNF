/*
	Author: Mallen (Credit to Larrow on Bohemia forms for Unit loadout grabbing initial code)

	Description:
		Checks currently placed units against the composition they originated from

	Parameter(s):
	  None

	Returns:
		None
*/

_cfg = loadConfig "fnf_eden\config.cpp";

_feedbackLayer = -1 add3DENLayer "Kit Check Feedback";

//Weapons
_getWeaponDetails = {
	params["_weapon", "_invCfg"];

	_weaponCfg = (_invCfg >> _weapon);

	_result = [
		getText(_weaponCfg >> "name"),
		getText(_weaponCfg >> "muzzle"),
		getText(_weaponCfg >> "flashlight"),
		getText(_weaponCfg >> "optics"),
		[
			getText(_weaponCfg >> "primaryMuzzleMag" >> "name"),
			getNumber(_weaponCfg >> "primaryMuzzleMag" >> "ammoLeft")
		],
		[
			getText(_weaponCfg >> "secondaryMuzzleMag" >> "name"),
			getNumber(_weaponCfg >> "secondaryMuzzleMag" >> "ammoLeft")
		],
		getText(_weaponCfg >> "underBarrel")
	];

  if (
    _result select 0 isEqualTo "" and
    _result select 1 isEqualTo "" and
    _result select 2 isEqualTo "" and
    _result select 3 isEqualTo "" and
    (_result select 4 select 0) isEqualTo "" and
    (_result select 4 select 1) isEqualTo 0 and
    (_result select 5 select 0) isEqualTo "" and
    (_result select 5 select 1) isEqualTo 0 and
    _result select 6 isEqualTo ""
  ) exitWith
  {
    [];
  };

  if ((_result select 4 select 0) isEqualTo "" and (_result select 4 select 1) isEqualTo 0) then
  {
    _result set [4,[]];
  };
  if ((_result select 5 select 0) isEqualTo "" and (_result select 5 select 1) isEqualTo 0) then
  {
    _result set [5,[]];
  };

  _result;
};

//Containers
_getContainerDetails = {
	params["_container", "_invCfg"];

	_containerCfg = (_invCfg >> _container);

	_containerType = getText(_containerCfg >> "typeName");
	_items = [];
	{
		_cargoType = _x;
		{
			if (_cargoType isEqualTo "MagazineCargo") then
      {
				_items pushBack [getText(_x >> "name"), getNumber(_x >> "count"), getNumber(_x >> "ammoLeft")];
			} else {
				_items pushBack [getText(_x >> "name"), getNumber(_x >> "count")];
			};
		} forEach ("true" configClasses (_containerCfg >> _cargoType));
	} forEach ["ItemCargo", "MagazineCargo"];

	[_containerType, _items]
};

_possibleLoadouts = [];

_bluforConfigs = "getText (_x >> 'editorSubcategory') isEqualTo 'fnf_Blufor'" configClasses (_cfg >> "Cfg3DEN" >> "Compositions");
{
  _name = getText (_x >> "displayName");
  _pathToComp = getText (_x >> "path");

  _possibleLoadouts pushBack [_name, _pathToComp];
} forEach _bluforConfigs;

_opforConfigs = "getText (_x >> 'editorSubcategory') isEqualTo 'fnf_Opfor'" configClasses (_cfg >> "Cfg3DEN" >> "Compositions");
{
  _name = getText (_x >> "displayName");
  _pathToComp = getText (_x >> "path");

  _possibleLoadouts pushBack [_name, _pathToComp];
} forEach _opforConfigs;

_indforConfigs = "getText (_x >> 'editorSubcategory') isEqualTo 'fnf_Indfor'" configClasses (_cfg >> "Cfg3DEN" >> "Compositions");
{
  _name = getText (_x >> "displayName");
  _pathToComp = getText (_x >> "path");

  _possibleLoadouts pushBack [_name, _pathToComp];
} forEach _indforConfigs;

_allItems = all3DENEntities;
_allLogic = _allItems select 3;

_kitInformationPointers = [];
{
  if ((typeOf _x) isEqualTo "fnf_module_kitInformation") then
  {
    _kitInformationPointers pushBack _x;
  };
} forEach _allLogic;

_allGroups = _allItems select 1;

_allLayers = _allItems select 6;

{
  _currentKitInformationPointer = _x;
  _kitName = (_currentKitInformationPointer get3DENAttribute "fnf_kitName") select 0;

  _loadoutIndex = _possibleLoadouts findIf {_x select 0 isEqualTo _kitName};
  if (_loadoutIndex isEqualTo -1) then
  {
    //inform user that loadout cannot be found
    _pos = [0,0,3] vectorAdd (getPos _x);
    _marker = create3DENEntity ["Object", "VR_3DSelector_01_exit_F", _pos];
    _marker set3DENLayer _feedbackLayer;
    _comment = create3DENEntity ["Comment", "", _pos];
    _comment set3DENLayer _feedbackLayer;
    _comment set3DENAttribute ["Name", "Incorrect Loadout Name"];
    _comment set3DENAttribute ["Description", "Loadout Name cannot be found in compositions, please ensure this module has the correct name of the kit"];
    continue;
  };
  _loadoutPath = _possibleLoadouts select _loadoutIndex select 1;
  _loadoutPath = _loadoutPath + "\composition.sqe";

  _cfgLoadout = loadConfig _loadoutPath;
  _unitsConfig = ("getText (_x >> 'name') isEqualTo 'Units'" configClasses (_cfgLoadout >> "items")) select 0;
  _configGroups = "true" configClasses (_unitsConfig >> "Entities");

  _groupsForMySide = [];
  {
    _name = ((_x get3DENAttribute "name") select 0);
    if (_name isEqualTo _kitName) then
    {
      _entities = get3DENLayerEntities _x;
      _infoFound = false;
      _selectorsFound = false;
      _unitsFound = false;

      _unitsLayer = 0;
      {
        if (typeName _x isEqualTo "SCALAR") then
        {
          _name = ((_x get3DENAttribute "name") select 0);
          switch (_name) do {
            case "Info": {_infoFound = true;};
            case "Selectors": {_selectorsFound = true;};
            case "Units": {_unitsFound = true; _unitsLayer = _x;};
          };
        };
      } forEach _entities;

      if (_infoFound and _selectorsFound and _unitsFound) then
      {
        _groupsForMySide = get3DENLayerEntities _unitsLayer;
        break;
      };
    };
  } forEach _allLayers;

  {
    _leader = leader _x;
    _leaderDescription = (_leader get3DENAttribute "description") select 0;

    _correctGroupConfig = "NONE FOUND";
    {
      _checkLeaderDescription = getText (_x >> "Entities" >> "Item0" >> "Attributes" >> "description");
      if ([_checkLeaderDescription, _leaderDescription] call BIS_fnc_inString) then
      {
        _correctGroupConfig = _x;
      };
    } forEach _configGroups;

    if (_correctGroupConfig isEqualTo "NONE FOUND") then
    {
      //inform user that group cannot be found
      _pos = [0,0,3] vectorAdd (getPos _leader);
      _marker = create3DENEntity ["Object", "VR_3DSelector_01_exit_F", _pos];
      _marker set3DENLayer _feedbackLayer;
      _comment = create3DENEntity ["Comment", "", _pos];
      _comment set3DENLayer _feedbackLayer;
      _comment set3DENAttribute ["Name", "Incorrect Leader Name"];
      _comment set3DENAttribute ["Description", "Leader name cannot be found, check the role description of the leader is correct, other members of this group have not been checked"];
      continue;
    };

    _configUnits = "true" configClasses (_correctGroupConfig >> "Entities");

    _allUnits = units _x;

    if ((count _configUnits) isNotEqualTo (count _allUnits)) then
    {
      //inform user that group has incorrect number of people
      _pos = [0,0,3] vectorAdd (getPos _leader);
      _marker = create3DENEntity ["Object", "VR_3DSelector_01_exit_F", _pos];
      _marker set3DENLayer _feedbackLayer;
      _comment = create3DENEntity ["Comment", "", _pos];
      _comment set3DENLayer _feedbackLayer;
      _comment set3DENAttribute ["Name", "Incorrect Group Size"];
      _comment set3DENAttribute ["Description", ("Group size should be " + str(count _configUnits) + ", It is actually " + str(count _allUnits))];

      continue;
    };

    {
      _unitDescription = (_x get3DENAttribute "description") select 0;
      _correctUnitConfig = "NONE FOUND";
      {
        _checkUnitDescription = getText (_x >> "Attributes" >> "description");
        if ([_checkUnitDescription, _unitDescription] call BIS_fnc_inString) then
        {
          _correctUnitConfig = _x;
        };
      } forEach _configUnits;

      if (_correctUnitConfig isEqualTo "NONE FOUND") then
      {
        //inform user that unit cannot be found
        _pos = [0,0,3] vectorAdd (getPos _x);
        _marker = create3DENEntity ["Object", "VR_3DSelector_01_exit_F", _pos];
        _marker set3DENLayer _feedbackLayer;
        _comment = create3DENEntity ["Comment", "", _pos];
        _comment set3DENLayer _feedbackLayer;
        _comment set3DENAttribute ["Name", "Incorrect Unit Name"];
        _comment set3DENAttribute ["Description", "Unit name cannot be found, check the role description of the Unit is correct"];
        continue;
      };

      //get check loadout
      _invConfig = (_correctUnitConfig >> "Attributes" >> "Inventory");

      _checkLoadout = [];

      {
	      _checkLoadout pushBack ([_x, _invConfig] call _getWeaponDetails);
      } forEach ["primaryWeapon", "secondaryWeapon", "handgun"];

      {
	      _checkLoadout pushBack ([_x, _invConfig] call _getContainerDetails);
      } forEach ["uniform", "vest", "backpack"];

      _checkLoadout pushBack getText(_invConfig >> "headgear");
      _checkLoadout pushBack getText(_invConfig >> "goggles");
      _checkLoadout pushBack (["binocular", _invConfig] call _getWeaponDetails);

      //linked Items
      _checkLoadout pushBack [
	      getText(_invConfig >> "map"),
	      getText(_invConfig >> "gps"),
	      getText(_invConfig >> "radio"),
	      getText(_invConfig >> "compass"),
	      getText(_invConfig >> "watch"),
	      getText(_invConfig >> "hmd")
      ];

      //get unit loadout
      _unitLoadout = getUnitLoadout _x;

      if (_unitLoadout isNotEqualTo _checkLoadout) then
      {
        //inform user that loadout is incorrect
        _pos = [0,0,3] vectorAdd (getPos _x);
        _marker = create3DENEntity ["Object", "VR_3DSelector_01_exit_F", _pos];
        _marker set3DENLayer _feedbackLayer;
        _comment = create3DENEntity ["Comment", "", _pos];
        _comment set3DENLayer _feedbackLayer;
        _comment set3DENAttribute ["Name", "Incorrect Loadout"];
        _comment set3DENAttribute ["Description", ("Unit Loadout:" + str(_unitLoadout) + endl + endl + "CheckLoadout:" + str(_checkLoadout))];
      };
    } forEach _allUnits;
  } forEach _groupsForMySide;
} forEach _kitInformationPointers;
