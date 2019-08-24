/*
    Handle adding gear to players. Ensures that if a unit already has a piece of clothing that it is not removed and then added again.
    Ex: [phx_loadout_item, "uniform"] call phx_fnc_loadout_handleGear;
*/

params ["_item", "_preferredContainer"];

private ["_split", "_class", "_number", "_addToContainer"];
if (_item isEqualType "") then {
  if (!(_item isEqualTo "")) then {
    _split = _item splitString ":";
    _class = _split select 0;
    _number = 1;
    if (count _split > 1) then {
      _number = parseNumber (_split select 1);
    };

    addAnywhere = {
      if (player canAddItemToUniform [_class, 1]) then {
        player addItemToUniform _class;
      } else {

      if (player canAddItemToVest [_class, 1]) then {
        player addItemToVest _class;
      } else {

      if (player canAddItemToBackpack [_class, 1]) then {
        player addItemToBackpack _class;
      } else {

      if (player canAdd [_class, 1]) then {
        player addItem _class;
      } else {
        titleText [format["PHX fn_loadout_handleGear: Unable to add item classname: %1",_class],"PLAIN"];
      }; //end canAdd
      }; //end canAddItemToUniform
      }; //end canAddItemToVest
      }; //end canAddItemToBackpack
    };

    for "_i" from 1 to _number do {
      switch (_preferredContainer) do {
        case "uniform": {
          if (player canAddItemToUniform [_class, 1]) then {
            player addItemToUniform _class;
          } else {
            call addAnywhere;
          }
        };
        case "vest": {
          if (player canAddItemToVest [_class, 1]) then {
            player addItemToVest _class;
          } else {
            call addAnywhere;
          }
        };
        case "backpack": {
          if (player canAddItemToBackpack [_class, 1]) then {
            player addItemToBackpack _class;
          } else {
            call addAnywhere;
          }
        };
        case "item": {
          if (player canAdd [_class, 1]) then {
            player addItem _class;
          } else {
            call addAnywhere;
          }
        };
        default {};
      };
    };
  };
};
