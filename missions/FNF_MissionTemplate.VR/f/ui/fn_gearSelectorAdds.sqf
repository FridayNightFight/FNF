disableSerialization;

_display = findDisplay 2000;

_opticListboxControl = _display displayCtrl 2001;
_grenadeListboxControl = _display displayCtrl 2002;

_opticListboxControl lbAdd "Iron Sights";

_optics = [];
_allowedOptics = [];
opticsIndexes = [];
opticArraySelectedIndex = 0;
_index = 1;

_configClasses = "true" configClasses (configfile >> "CfgWeapons") apply {configName _x};
_configClasses apply {
  if (((configName (configfile >> "CfgWeapons" >> _x) call BIS_fnc_itemType) select 1) isEqualTo "AccessorySights" && !isNull (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "OpticsModes" >> "ACO")) then {
    _allowedOptics pushBack _x;
  };
};

_compatibleOptics = [primaryWeapon player, "optic"] call CBA_fnc_compatibleItems;

{
  if (_x in _compatibleOptics) then {
    _optics pushBack _x;
    opticsIndexes pushBack [_x, _index];
    _index = _index + 1;
  };
} forEach _allowedOptics;

{
  _opticListboxControl lbAdd _x;
} forEach _optics;

if !(opticFirstSel) then {
  lbSetCurSel [2001, opticSelected];
  opticFirstSel = true;
} else {
  lbSetCurSel [2001, opticSelected];
};

_opticListboxSelect =  _opticListboxControl ctrlAddEventHandler  ["LBSelChanged",{
  params ["_control", "_selectedIndex"];
  {
    if !(_x find _selectedIndex == -1) then {
    opticArraySelectedIndex = _x;
    };
  } forEach opticsIndexes;

  player addPrimaryWeaponItem (opticArraySelectedIndex select 0);

  if (_selectedIndex == 0) then {
    _optic = primaryWeaponItems player select 2;
    player removePrimaryWeaponItem _optic;
  };

  opticSelected = _selectedIndex;
}];

_grenadeListboxControl lbAdd "None";
_grenadeListboxControl lbAdd "M84 Flash Grenade";
_grenadeListboxControl lbAdd "Incendiary Grenade";

if !(grenadeFirstSel) then {
  lbSetCurSel [2002, grenadeSelected];
  grenadeFirstSel = true;
} else {
  lbSetCurSel [2002, grenadeSelected];
};

_grenadeListboxSelect =  _grenadeListboxControl ctrlAddEventHandler  ["LBSelChanged",{
  params ["_control", "_selectedIndex"];
  _magazines = magazines player;
  switch (_selectedIndex) do {
    case 1:{
      if !(player canAdd "ACE_M84") exitWith {hintSilent "Not enough space"};
      for "_i" from 1 to 2 do {
        if ("rhs_mag_an_m14_th3" in _magazines) then {
          [player, "rhs_mag_an_m14_th3"] call CBA_fnc_removeItem;
        };
      };
      if !("ACE_M84" in _magazines) then {
        for "_i" from 1 to 2 do {
          [player, "ACE_M84"] call CBA_fnc_addItem;
        };
        hintSilent "Flash grenades added";
      };
    };
    case 2:{
      if !(player canAdd "rhs_mag_an_m14_th3") exitWith {hintSilent "Not enough space"};
      for "_i" from 1 to 2 do {
        if ("ACE_M84" in _magazines) then {
          [player, "ACE_M84"] call CBA_fnc_removeItem;
        };
      };
      if !("rhs_mag_an_m14_th3" in _magazines) then {
        for "_i" from 1 to 2 do {
          [player, "rhs_mag_an_m14_th3"] call CBA_fnc_addItem;
        };
        hintSilent "Incendiary grenades added";
      };
    };
    case 0: {
      if ("ACE_M84" in _magazines) then {
        for "_i" from 1 to 2 do {
          [player, "ACE_M84"] call CBA_fnc_removeItem;
        };
      };
      if ("rhs_mag_an_m14_th3" in _magazines) then {
        for "_i" from 1 to 2 do {
          [player, "rhs_mag_an_m14_th3"] call CBA_fnc_removeItem;
        };
      };
      hintSilent "";
    };
  };
  grenadeSelected = _selectedIndex;
  }];

  [_opticListboxControl,_grenadeListboxControl] spawn phx_fnc_removeSelectorHandlers;

  //CE Only

  if (pRole == 7 && !("phx_loadout_allowCESelector" call BIS_fnc_getParamValue isEqualTo 1) && explosivesSelectorEnabled) then {

    _explosivesListboxControl = _display displayCtrl 2003;

    _explosivesListboxControl lbAdd "2x Satchel Charges";
    _explosivesListboxControl lbAdd "4x Demo Block";
    _explosivesListboxControl lbAdd "2x Demo, 1x Trip Mine";
    _explosivesListboxControl lbAdd "2x Trip Mine";
    _explosivesListboxControl lbAdd "1x Satchel, 2x SLAM Mine, 1x M15 AT Mine";

    /*if !(explosiveFirstSel) then {
      lbSetCurSel [2003, explosiveSelected];
      explosiveFirstSel = true;
    } else {
      lbSetCurSel [2003, explosiveSelected];
    };*/

    hintyHint = {
      hintSilent "You have selected your explosives loadout.\nYou will not be able to change it when you exit the Gear Selector."
    };

    _explosivesListboxSelect =  _explosivesListboxControl ctrlAddEventHandler  ["LBSelChanged",{
      params ["_control", "_selectedIndex"];

      {
        _chargeClass = _x;
        for "_i" from 1 to ({_chargeClass == _x} count (magazines player)) do {
          player removeItem _chargeClass;
        };
      } forEach explosivesClasses;

      switch (_selectedIndex) do {
        case 0:{
          player addItem "SatchelCharge_Remote_Mag";
          player addItem "SatchelCharge_Remote_Mag";
          explosivesSelectorEnabled = false;
          call hintyHint;
        };
        case 1:{
          player addItem "DemoCharge_Remote_Mag";
          player addItem "DemoCharge_Remote_Mag";
          player addItem "DemoCharge_Remote_Mag";
          player addItem "DemoCharge_Remote_Mag";
          explosivesSelectorEnabled = false;
          call hintyHint;
        };
        case 2: {
          player addItem "DemoCharge_Remote_Mag";
          player addItem "DemoCharge_Remote_Mag";
          player addItem "APERSTripMine_Wire_Mag";
          explosivesSelectorEnabled = false;
          call hintyHint;
        };
        case 3:{
          player addItem "APERSTripMine_Wire_Mag";
          player addItem "APERSTripMine_Wire_Mag";
          explosivesSelectorEnabled = false;
          call hintyHint;
        };
        case 4:{
          player addItem "SatchelCharge_Remote_Mag";
          player addItem "SLAMDirectionalMine_Wire_Mag";
          player addItem "SLAMDirectionalMine_Wire_Mag";
          player addItem "ATMine_Range_Mag";
          explosivesSelectorEnabled = false;
          call hintyHint;
        };
      };
      explosiveSelected = _selectedIndex;
      }];

      [_explosivesListboxControl] spawn phx_fnc_removeSelectorHandlers;
  };
