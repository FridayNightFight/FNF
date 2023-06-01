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
{
  if ((_x select 1) == _id) then
  {
    _currentItems = (_x select 0);
    _currentID = _forEachIndex;
  };
} forEach fnf_selections;

if (_currentItems isEqualTo "") then
{
  {
    switch (_selectorType) do {
      case "opt":
      {
        player addWeaponItem [primaryWeapon player, _x, true];
      };
      case "pri":
      {
        if (_x isKindOf ["Rifle", configFile >> "CfgWeapons"]) then
        {
          player addWeapon _x;
        } else {
          player addItem _x;
        };
      };
      case "sec":
      {
        if (_x isKindOf ["Launcher", configFile >> "CfgWeapons"]) then
        {
          player addWeapon _x;
        } else {
          player addItem _x;
        };
      };
      case "hnd":
      {
        if (_x isKindOf ["Pistol", configFile >> "CfgWeapons"]) then
        {
          player addWeapon _x;
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



  ["<t size='1.5' align='center'>Switched to:<br/><br/>" + _displayName + "</t>", "info"] call FNF_ClientSide_fnc_notificationSystem;
  fnf_selections pushBack [_allItems, _id, _selectorType];
} else {

  _hasRequiredItems = true;
  _itemsToAdd = [];

  {
    switch (_selectorType) do {
      case "opt":
      {
        if ((primaryWeaponItems player) select 2 == _x) then
        {
          player removePrimaryWeaponItem _x;
          _itemsToAdd pushBack _x;
        } else {
          _hasRequiredItems = false;
        };
      };
      case "pri":
      {
        if (_x isKindOf ["Rifle", configFile >> "CfgWeapons"]) then
        {
          if (primaryWeapon player == _x) then
          {
            player removeWeapon _x;
            _itemsToAdd pushBack _x;
            _opticSelectors = [];
            {
              if ((_x select 2) == "opt") then
              {
                _opticSelectors pushBack _forEachIndex;
              };
            } forEach fnf_selections;
            {
              fnf_selections deleteAt (_x - _forEachIndex);
            } forEach _opticSelectors;

          } else {
            _hasRequiredItems = false;
          };
        } else {
          if ([player, _x] call BIS_fnc_hasItem) then
          {
            player removeItem _x;
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
          if (primaryWeapon player == _x) then
          {
            player removeWeapon _x;
            _itemsToAdd pushBack _x;
          } else {
            _hasRequiredItems = false;
          };
        } else {
          if ([player, _x] call BIS_fnc_hasItem) then
          {
            player removeItem _x;
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
          if (primaryWeapon player == _x) then
          {
            player removeWeapon _x;
            _itemsToAdd pushBack _x;
          } else {
            _hasRequiredItems = false;
          };
        } else {
          if ([player, _x] call BIS_fnc_hasItem) then
          {
            player removeItem _x;
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

  if (_hasRequiredItems) then
  {
    _itemsToAdd = _allItems;
    fnf_selections deleteAt _currentID;
    fnf_selections pushBack [_allItems, _id, _selectorType];
    ["<t size='1.5' align='center'>Switched to:<br/><br/>" + _displayName + "</t>", "info"] call FNF_ClientSide_fnc_notificationSystem;
  } else {
    ["<t size='1.5' align='center'>Failed to switch selection, you do not have the items to switch out</t>", "warning"] call FNF_ClientSide_fnc_notificationSystem;
  };

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
          player addWeapon _x;
        } else {
          player addItem _x;
        };
      };
      case "sec":
      {
        if (_x isKindOf ["Launcher", configFile >> "CfgWeapons"]) then
        {
          player addWeapon _x;
        } else {
          player addItem _x;
        };
      };
      case "hnd":
      {
        if (_x isKindOf ["Pistol", configFile >> "CfgWeapons"]) then
        {
          player addWeapon _x;
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
};

