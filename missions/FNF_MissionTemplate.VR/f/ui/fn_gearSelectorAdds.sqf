disableSerialization;

_display = findDisplay 2000;

_opticListboxControl = _display displayCtrl 2001;
_grenadeListboxControl = _display displayCtrl 2002;
_weaponListboxControl = _display displayCtrl 2004;

_opticListboxControl lbAdd "Iron Sights";

if (weaponChoices == 0) then {
  _weaponListboxControl lbAdd "Disabled";
};

_optics = [];
_weapons = [];
opticsIndexes = [];
opticArraySelectedIndex = 0;
weaponsIndexes = [];
_index = 1;
_weaponsIndex = 0;

_compatibleOptics = [primaryWeapon player, "optic"] call CBA_fnc_compatibleItems;

{
  if (_x in _compatibleOptics) then {
    _optics pushBack _x;
    opticsIndexes pushBack [_x, _index];
    _index = _index + 1;
  };
} forEach allowedOptics;

{
  _weapons pushBack _x;
  weaponsIndexes pushBack [_x, _weaponsIndex];
  _weaponsIndex = _weaponsIndex + 1;
} forEach allowedWeapons;

{
  //_weaponListboxControl lbAdd _x;
  _weaponListboxControl lbAdd getText (configFile >> "cfgWeapons" >> _x >> "displayName");
} forEach allowedWeapons;

{
  //_opticListboxControl lbAdd _x;
  _opticListboxControl lbAdd getText (configFile >> "cfgWeapons" >> _x >> "displayName");
} forEach _optics;

if !(opticFirstSel) then {
  lbSetCurSel [2001, opticSelected];
  opticFirstSel = true;
} else {
  lbSetCurSel [2001, opticSelected];
};

if !(weaponFirstSel) then {
  lbSetCurSel [2004, weaponSelected];
  weaponFirstSel = true;
} else {
  lbSetCurSel [2004, weaponSelected];
};

_weaponListboxSelect =  _weaponListboxControl ctrlAddEventHandler  ["LBSelChanged",{
  params ["_control", "_selectedIndex"];
  {
    if !(_x find _selectedIndex == -1) then {
    weaponArraySelectedIndex = _x;
    };
  } forEach weaponsIndexes;

  if (_selectedIndex == weaponSelected) exitWith {};

  _mag = primaryWeaponMagazine player select 0;
  if !(isNil {primaryWeaponMagazine player select 1}) then {
    grenadeMag = primaryWeaponMagazine player select 1;
  };

  player addWeapon (weaponArraySelectedIndex select 0);

  player addMagazine _mag;
  if !(isNil "grenadeMag") then {
    player addMagazine grenadeMag;
  };

  weaponSelected = _selectedIndex;
  _weapon = currentWeapon ACE_player;
  if !(_weapon in phx_safetyWeapons) then {
    [ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;
    phx_safetyWeapons pushBack (currentWeapon ACE_player);
  };
}];

_opticListboxSelect =  _opticListboxControl ctrlAddEventHandler  ["LBSelChanged",{
  params ["_control", "_selectedIndex"];
  {
    if !(_x find _selectedIndex == -1) then {
    opticArraySelectedIndex = _x;
    };
  } forEach opticsIndexes;

  if (_selectedIndex == 0) then {
    _optic = primaryWeaponItems player select 2;
    player removePrimaryWeaponItem _optic;
  } else {
    player addPrimaryWeaponItem (opticArraySelectedIndex select 0);
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
      if !("ACE_M84" in (magazines player)) then {
        if (grenadesAdded) then {
          if ("rhs_mag_an_m14_th3" in (magazines player)) then {
            for "_i" from 1 to 2 do {
              if ("rhs_mag_an_m14_th3" in (magazines player)) then {
                [player, "rhs_mag_an_m14_th3"] call CBA_fnc_removeItem;
                [player, "ACE_M84"] call CBA_fnc_addItem;
                hintSilent "Flash grenades added";
              };
            };
          };
        } else {
          for "_i" from 1 to 2 do {
            [player, "ACE_M84"] call CBA_fnc_addItem;
            hintSilent "Flash grenades added";
            grenadesAdded = true;
          };
        };
      };
    };
    case 2:{
      if !(player canAdd "rhs_mag_an_m14_th3") exitWith {hintSilent "Not enough space"};
      if !("rhs_mag_an_m14_th3" in (magazines player)) then {
        if (grenadesAdded) then {
          if ("ACE_M84" in (magazines player)) then {
            for "_i" from 1 to 2 do {
              if ("ACE_M84" in (magazines player)) then {
                [player, "ACE_M84"] call CBA_fnc_removeItem;
                [player, "rhs_mag_an_m14_th3"] call CBA_fnc_addItem;
                hintSilent "Incendiary grenades added";
              };
            };
          };
        } else {
          for "_i" from 1 to 2 do {
            [player, "rhs_mag_an_m14_th3"] call CBA_fnc_addItem;
            hintSilent "Incendiary grenades added";
            grenadesAdded = true;
          };
        };
      };
    };
    case 0: {
    };
  };
  grenadeSelected = _selectedIndex;
  }];

  [_opticListboxControl,_grenadeListboxControl] spawn phx_fnc_removeSelectorHandlers;

  //CE Only

  if (((typeOf player isEqualTo "B_soldier_exp_F") || (typeOf player isEqualTo "O_soldier_exp_F") || (typeOf player isEqualTo "I_Soldier_exp_F")) && !("phx_loadout_allowCESelector" call BIS_fnc_getParamValue isEqualTo 1) && explosivesSelectorEnabled) then {

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
