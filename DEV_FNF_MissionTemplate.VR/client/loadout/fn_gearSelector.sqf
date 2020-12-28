//Exit if no optics or weapons are available
waitUntil {missionNamespace getVariable ["phx_loadoutAssigned",false]};
if (isNil "phx_allowedOptics" && isNil "phx_allowedWeapons") exitWith {};

if (pRole == 16) then {
  phx_allowedOptics = [];
};

_action = ["Gear_Selector","Gear Selector","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"],_action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Optic_Selector","Optic","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;

_action = ["Weapon_Selector","Weapon","",{},{true}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "Gear_Selector"],_action] call ace_interact_menu_fnc_addActionToClass;

//Optics
if !(isNil "phx_allowedOptics") then {
  _compatibleOptics = [primaryWeapon player, "optic"] call CBA_fnc_compatibleItems;

  if ((count phx_allowedOptics > 0) && (count _compatibleOptics > 0)) then {
    {
      if (_x in _compatibleOptics) then {
        _action = ["Optic_Selector",getText (configFile >> "cfgWeapons" >> _x >> "displayName"),"",{
          player addPrimaryWeaponItem (_this select 2);
        },{true}, {}, _x] call ace_interact_menu_fnc_createAction;
        [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Optic_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
      };
    } forEach phx_allowedOptics;
    _action = ["Optic_Selector","None","",{
      player removePrimaryWeaponItem (primaryWeaponItems player select 2);
    },{true}] call ace_interact_menu_fnc_createAction;
    [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Optic_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
  };
};

//Weapons
if !(isNil "phx_allowedWeapons") then {
  if (count phx_allowedWeapons > 0) then {
    if !(primaryWeapon player in phx_allowedWeapons) then {
      phx_allowedWeapons pushBack primaryWeapon player;
    };

    {
      _action = ["Weapon_Selector",getText (configFile >> "cfgWeapons" >> _x >> "displayName"),"",{
        if ((_this select 2) == primaryWeapon player) exitWith {};
        _mag = (primaryWeaponMagazine player) select 0;
        _glMag = (primaryWeaponMagazine player) select 1;
        player addWeapon (_this select 2);
        player addMagazine _mag;
        if (!isNil "_glMag") then {
          player addMagazine _glMag;
        };
      },{true}, {}, _x] call ace_interact_menu_fnc_createAction;
      [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Weapon_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
    } forEach phx_allowedWeapons;
  };
};
