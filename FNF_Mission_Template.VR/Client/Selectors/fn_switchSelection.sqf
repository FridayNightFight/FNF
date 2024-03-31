/*
	Author: Mallen

	Description:
		Switches a selection from one option to another

	Parameter(s):
		0: ARRAY -  An array of items to switch to
    1: STRING -  The identifier of the selector
    2: STRING -  The type of selector being used
    3: STRING -  The Display name of the option

	Returns:
		None
*/

params["_allItems", "_id", "_selectorType", "_displayName"];

_currentItems = "";
_currentID = -1;

//if there is a selection made grab that info
{
  if ((_x select 1) isEqualTo _id) then
  {
    _currentItems = (_x select 0);
    _currentID = _forEachIndex;
  };
} forEach fnf_selections;

//if no selection has been made
if (_currentItems isEqualTo "") then
{
  _weaponAddAfter = "NONE";
  {
    //depending on item type do different things and add things
    switch (_selectorType) do {
      case "opt":
      {
        player addWeaponItem [primaryWeapon player, _x, true];
      };
      case "pri":
      {
        if (_x isKindOf ["Rifle", configFile >> "CfgWeapons"]) then
        {
          _weaponAddAfter = _x;
        } else {
          player addItem _x;
        };
      };
      case "sec":
      {
        if (_x isKindOf ["Launcher", configFile >> "CfgWeapons"]) then
        {
          _weaponAddAfter = _x;
        } else {
          if (_x isKindOf "Bag_Base") then
          {
            _loadout = getUnitLoadout player;
            _loadout select 5 select 1 pushBack [_x, true];
            player setUnitLoadout _loadout;
          } else {
            player addItem _x;
          };
        };
      };
      case "hnd":
      {
        if (_x isKindOf ["Pistol", configFile >> "CfgWeapons"]) then
        {
          _weaponAddAfter = _x;
        } else {
          player addItem _x;
        };
      };
      default
      {
        player addItem _x;
      };
    };
  } forEach _allitems;

  //add weapon after mags to ensure mag is put into weapon
  if (_weaponAddAfter isNotEqualTo "NONE") then
  {
    player addWeapon _weaponAddAfter
  };

  ["<t size='1.5' align='center'>Switched to:<br/><br/>" + _displayName + "</t>", "info"] call FNF_ClientSide_fnc_notificationSystem;
  fnf_selections pushBack [_allItems, _id, _selectorType];
} else {

  _hasRequiredItems = true;
  _itemsToAdd = [];
  _weaponToRemove = "NONE";
  _opticToRetain = "";
  //check if player can and has removed items needed
  {
    switch (_selectorType) do {
      case "opt":
      {
        if ((((primaryWeaponItems player) select 2) find _x) isNotEqualTo -1) then
        {
          player removePrimaryWeaponItem _x;
          //track which items have been removed so if things fail we can re-add them
          _itemsToAdd pushBack _x;
        } else {
          _hasRequiredItems = false;
        };
      };
      case "pri":
      {
        if (_x isKindOf ["Rifle", configFile >> "CfgWeapons"]) then
        {
          if ((primaryWeapon player isEqualTo _x) and (_weaponToRemove isEqualTo "NONE")) then
          {
            _weaponToRemove = _x;
            _opticToRetain = ((primaryWeaponItems player) select 2);
            _itemsToAdd pushBack _opticToRetain;
          } else {
            _hasRequiredItems = false;
          };
        } else {
          if ([player, _x] call BIS_fnc_hasItem) then
          {
            if (((primaryWeaponMagazine player) find _x) isNotEqualTo -1) then
            {
              player removePrimaryWeaponItem _x;
            } else {
              player removeItem _x;
            };
            _itemsToAdd pushBack _x;
          } else {
            _hasRequiredItems = false;
          };
        };
      };
      case "sec":
      {
        if (_x isKindOf ["Launcher", configFile >> "CfgWeapons"]) then
        {
          if ((secondaryWeapon player isEqualTo _x) and (_weaponToRemove isEqualTo "NONE")) then
          {
            _weaponToRemove = _x;
          } else {
            _hasRequiredItems = false;
          };
        } else {
          if ([player, _x] call BIS_fnc_hasItem) then
          {
            if (((secondaryWeaponMagazine player) find _x) isNotEqualTo -1) then
            {
              player removeSecondaryWeaponItem _x;
            } else {
              player removeItem _x;
            };
            _itemsToAdd pushBack _x;
          } else {
            _hasRequiredItems = false;
          };
        };
      };
      case "hnd":
      {
        if (_x isKindOf ["Pistol", configFile >> "CfgWeapons"]) then
        {
          if ((handgunWeapon player isEqualTo _x) and (_weaponToRemove isEqualTo "NONE")) then
          {
            _weaponToRemove = _x;
          } else {
            _hasRequiredItems = false;
          };
        } else {
          if ([player, _x] call BIS_fnc_hasItem) then
          {
            if (((handgunMagazine player) find _x) isNotEqualTo -1) then
            {
              player removeHandgunItem _x;
            } else {
              player removeItem _x;
            };
            _itemsToAdd pushBack _x;
          } else {
            _hasRequiredItems = false;
          };
        };
      };
      default
      {
        if ([player, _x] call BIS_fnc_hasItem) then
        {
          player removeItem _x;
          _itemsToAdd pushBack _x;
        } else {
          _hasRequiredItems = false;
        };
      };
    };
  } forEach _currentItems;

  if (_weaponToRemove isNotEqualTo "NONE") then
  {
    player removeWeapon _weaponToRemove;
    _itemsToAdd pushBack _weaponToRemove;
  };

  //check if player had all the items needed to switch, if so add new items to add
  if (_hasRequiredItems) then
  {
    _itemsToAdd = _allItems;
    if (_opticToRetain isNotEqualTo "") then
    {
      _itemsToAdd pushBack _opticToRetain;
    };
    fnf_selections deleteAt _currentID;
    fnf_selections pushBack [_allItems, _id, _selectorType];
    ["<t size='1.5' align='center'>Switched to:<br/><br/>" + _displayName + "</t>", "info"] call FNF_ClientSide_fnc_notificationSystem;
  } else {
    ["<t size='1.5' align='center'>Failed to switch selection, you do not have the items to switch out</t>", "error"] call FNF_ClientSide_fnc_notificationSystem;
  };

  //add either current items or items previously removed to complete selection
  _weaponAddAfter = "NONE";
  _opticAddAfter = "";
  {
    switch (_selectorType) do {
      case "opt":
      {
        player addPrimaryWeaponItem _x;
      };
      case "pri":
      {
        if (_x isKindOf ["Rifle", configFile >> "CfgWeapons"]) then
        {
          _weaponAddAfter = _x;
        } else {
          if (getNumber(configFile >> "CfgWeapons" >> _x >> "itemInfo" >> "type") isEqualTo 201) then
          {
            _opticAddAfter = _x;
          } else {
            player addItem _x;
          };
        };
      };
      case "sec":
      {
        if (_x isKindOf ["Launcher", configFile >> "CfgWeapons"]) then
        {
          _weaponAddAfter = _x;
        } else {
          if (_x isKindOf "Bag_Base") then
          {
            _loadout = getUnitLoadout player;
            _loadout select 5 select 1 pushBack [_x, true];
            player setUnitLoadout _loadout;
          } else {
            player addItem _x;
          };
        };
      };
      case "hnd":
      {
        if (_x isKindOf ["Pistol", configFile >> "CfgWeapons"]) then
        {
          _weaponAddAfter = _x;
        } else {
          player addItem _x;
        };
      };
      default
      {
        player addItem _x;
      };
    };
  } forEach _itemsToAdd;

  if (_weaponAddAfter isNotEqualTo "NONE") then
  {
    player addWeapon _weaponAddAfter;
    if (_opticToRetain isNotEqualTo "") then
    {
      player addPrimaryWeaponItem _opticToRetain;
    };
  };
};

