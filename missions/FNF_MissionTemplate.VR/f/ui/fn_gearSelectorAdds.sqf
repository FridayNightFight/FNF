disableSerialization;

_display = findDisplay 2000;

_opticListboxControl = _display displayCtrl 2001;
_grenadeListboxControl = _display displayCtrl 2002;

_opticListboxControl lbAdd "Iron Sights";

_optics = [];

switch (side player) do {
  case west:{
    _optics = ["optic_Holosight_blk_F","rhsusf_acc_eotech_552","rhsusf_acc_compm4","rhsusf_acc_T1_high"];
  };
  case east: {
    _optics = ["rhs_acc_1p63","rhs_acc_ekp1","rhs_acc_ekp8_02","rhs_acc_pkas"];
  };
  case independent: {
    _optics = ["optic_Holosight_blk_F","rhsusf_acc_eotech_552","optic_ACO_grn","rhsusf_acc_compm4","rhsusf_acc_T1_high","rhs_acc_ekp1","rhs_acc_ekp8_02","rhs_acc_pkas"];
  };
};

{
  _opticListboxControl lbAdd _x;
} forEach _optics;

if !(opticFirstSel) then {
  lbSetCurSel [2001, opticSelected];
  opticFirstSel = true;
} else {
  lbSetCurSel [2001, opticSelected];
};

switch (side player) do {
  case west: {
    _opticListboxSelect =  _opticListboxControl ctrlAddEventHandler  ["LBSelChanged",{
      params ["_control", "_selectedIndex"];
      switch (_selectedIndex) do {
        case 1:{
          player addPrimaryWeaponItem "optic_Holosight_blk_F";
        };
        case 2:{
          player addPrimaryWeaponItem "rhsusf_acc_eotech_552";
        };
        case 3:{
          player addPrimaryWeaponItem "rhsusf_acc_compm4";
        };
        case 4:{
          player addPrimaryWeaponItem "rhsusf_acc_T1_high";
        };
        case 0: {
          _optic = primaryWeaponItems player select 2;
          player removePrimaryWeaponItem _optic;
        };
      };
       opticSelected = _selectedIndex;
    }];
  };
  case east: {
    _opticListboxSelect =  _opticListboxControl ctrlAddEventHandler  ["LBSelChanged",{
      params ["_control", "_selectedIndex"];
      switch (_selectedIndex) do {
        case 1:{
          player addPrimaryWeaponItem "rhs_acc_1p63";
        };
        case 2:{
          player addPrimaryWeaponItem "rhs_acc_ekp1";
        };
        case 3:{
          player addPrimaryWeaponItem "rhs_acc_ekp8_02";
        };
        case 4:{
          player addPrimaryWeaponItem "rhs_acc_pkas";
        };
        case 0: {
          _optic = primaryWeaponItems player select 2;
          player removePrimaryWeaponItem _optic;
        };
      };
       opticSelected = _selectedIndex;
    }];
  };
  case independent: {
    _opticListboxSelect =  _opticListboxControl ctrlAddEventHandler  ["LBSelChanged",{
      params ["_control", "_selectedIndex"];
      switch (_selectedIndex) do {
        case 1:{
          player addPrimaryWeaponItem "optic_Holosight_blk_F";
        };
        case 2:{
          player addPrimaryWeaponItem "rhsusf_acc_eotech_552";
        };
        case 3:{
          player addPrimaryWeaponItem "optic_ACO_grn";
        };
        case 4:{
          player addPrimaryWeaponItem "rhsusf_acc_compm4";
        };
        case 5: {
          player addPrimaryWeaponItem "rhsusf_acc_T1_high";
        };
        case 6: {
          player addPrimaryWeaponItem "rhs_acc_ekp1";
        };
        case 7: {
          player addPrimaryWeaponItem "rhs_acc_ekp8_02";
        };
        case 8: {
          player addPrimaryWeaponItem "rhs_acc_pkas";
        };
        case 0: {
          _optic = primaryWeaponItems player select 2;
          player removePrimaryWeaponItem _optic;
        };
      };
       opticSelected = _selectedIndex;
    }];
  };
};

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
      if ("rhs_mag_an_m14_th3" in _magazines) then {
        [player, "rhs_mag_an_m14_th3"] call CBA_fnc_removeItem;
      };
      if !("ACE_M84" in _magazines) then {
        [player, "ACE_M84"] call CBA_fnc_addItem;
        hintSilent "Flash grenade added";
      };
    };
    case 2:{
      if !(player canAdd "rhs_mag_an_m14_th3") exitWith {hintSilent "Not enough space"};
      if ("ACE_M84" in _magazines) then {
        [player, "ACE_M84"] call CBA_fnc_removeItem;
      };
      if !("rhs_mag_an_m14_th3" in _magazines) then  {
        [player, "rhs_mag_an_m14_th3"] call CBA_fnc_addItem;
        hintSilent "Incendiary grenade added";
      };
    };
    case 0: {
      if ("ACE_M84" in _magazines) then {
        [player, "ACE_M84"] call CBA_fnc_removeItem;
      };
      if ("rhs_mag_an_m14_th3" in _magazines) then {
        [player, "rhs_mag_an_m14_th3"] call CBA_fnc_removeItem;
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
