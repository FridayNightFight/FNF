_itemStr = _this;

if (isNil "phx_addGearErrorStr") then {
  phx_addGearErrorStr = "";
};

_err = {
  params ["_item"];
  phx_addGearErrorStr = phx_addGearErrorStr + _item + "\n";
  _msg = format ["Error adding \n %1", phx_addGearErrorStr];
  titleText [_msg, "PLAIN"];
  titleFadeOut 20;
  systemChat ("Error adding " + _item);
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
  _numToAdd = 1;

  _str = _itemStr select 0;
  _item = _str;
  if (_str find ":" != -1) then {
    _item = (_str select [0, _str find ":"]);
    _numToAdd = parseNumber (_str select [(_str find ":") + 1]);
  };

  switch (_itemStr select 1) do {
    case "backpack": {
      for "_i" from 1 to _numToAdd do {
        if (player canAddItemToBackpack _item) then {
          player addItemToBackpack _item;
        } else {
          _itemStr call _err;
        };
      };
    };
    case "uniform": {
      for "_i" from 1 to _numToAdd do {
        if (player canAddItemToUniform _item) then {
          player addItemToUniform _item;
        } else {
          _itemStr call _err;
        };
      };
    };
  };
};
