/*
* Author: Martin, IndigoFox
*
* Description:
* Add single item if single string, and add multiple instances if "className:count" format is supplied. Takes array.
* Uses CBA functionality to disregard max load, and instead reference max container capacity to determine if something can be added.
*
* Arguments:
* 0: Single classname or array of classnames, in one of two formats. <STRING> or <ARRAY>
* 1: Preferred container (defaults to trying each container in order) <STRING>, one of "uniform","vest","backpack"
* 2: Unit to add the item to (default: player) <OBJECT>
*
* Return Value:
* true on success <BOOLEAN>
* nil on failure with warning <NIL>
*
* Example:
* "FirstAidKit" call fnf_loadout_fnc_addGear;
* "FirstAidKit:5" call fnf_loadout_fnc_addGear;
* ["FirstAidKit:3","ItemMap","ItemCompass"] call fnf_loadout_fnc_addGear;
*
* Public: Yes
*/

_itemStr = _this;

if (_itemStr isEqualTo "") exitWith {};

private _addGearErrorStr = "";

_err = {
  params ["_item"];
  _addGearErrorStr = _addGearErrorStr + _item + "\n";
  _msg = format ["Error adding \n %1", _addGearErrorStr];
  titleText [_msg, "PLAIN"];
  titleFadeOut 20;
  systemChat ("Error adding " + _item);
  nil
};

if (typeName _itemStr isEqualTo "STRING") then {
  if (_itemStr find ":" != -1) then {
    _item = _itemStr select [0, _itemStr find ":"];
    _numToAdd = parseNumber (_itemStr select [(_itemStr find ":") + 1]);
    for "_i" from 1 to _numToAdd do {
      if (player canAdd _item) then {
        player additem _item;
      } else {
        _item call _err;
      };
    };
  } else {
    if (player canAdd _itemStr) then {
      player additem _itemStr;
    } else {
      _itemStr call _err;
    };
  };
} else {

  _itemStr params ["_str",["_container", "uniform", [""]], ["_unit", player, [objNull]]];

  private _item = _str;
  _numToAdd = 1;
  if (_str find ":" != -1) then {
    _item = (_str select [0, _str find ":"]);
    _numToAdd = parseNumber (_str select [(_str find ":") + 1]);
  };

  switch (_container) do {
    case "backpack": {
      for "_i" from 1 to _numToAdd do {
        if ([_unit, _item, 1, false, false, true] call CBA_fnc_canAddItem) then {
          _unit addItemToBackpack _item;
        } else {
          _itemStr call _err;
        };
      };
    };
    case "vest": {
      for "_i" from 1 to _numToAdd do {
        if ([_unit, _item, 1, false, true, false] call CBA_fnc_canAddItem) then {
          _unit addItemToVest _item;
        } else {
          if ([_unit, _item, 1, false, false, true] call CBA_fnc_canAddItem) then {
            _unit addItemToBackpack _item;
          } else {
            _itemStr call _err;
          };
        };
      };
    };
    default {
      for "_i" from 1 to _numToAdd do {
        if ([_unit, _item, 1, true, false, false] call CBA_fnc_canAddItem) then {
          _unit addItemToUniform _item;
        } else {
          if ([_unit, _item, 1, false, true, false] call CBA_fnc_canAddItem) then {
            _unit addItemToVest _item;
          } else {
            if ([_unit, _item, 1, false, false, true] call CBA_fnc_canAddItem) then {
              _unit addItemToBackpack _item;
            } else {
              _itemStr call _err;
            };
          };
        };
      };
    };
  };
};
true
