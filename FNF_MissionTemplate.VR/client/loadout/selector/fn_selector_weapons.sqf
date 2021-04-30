//If player doesn't have tracer mags at start, ignore for mag count checks
if !((phx_loadout_rifle_mag_tracer splitString ":" select 0) in magazines player) then {phx_loadout_rifle_mag_tracer = "0:0"};

//add player's current weapon to selector
phx_selector_weapons append [[primaryWeapon player]];
reverse phx_selector_weapons;

phx_selector_fnc_weapons = {
  params ["_weapon","_mag","_tracer"];

  if (isNil "_mag") then {_mag = phx_loadout_rifle_mag};
  if (isNil "_tracer") then {_tracer = phx_loadout_rifle_mag_tracer};

  if (_weapon == primaryWeapon player) exitWith {};

  {
    player removePrimaryWeaponItem _x;
    player addItem _x;
  } forEach primaryWeaponMagazine player;

  private _weaponItems = primaryWeaponItems player;

  //makes sure player still has all magazines to prevent mag duping
  //all old mags have to be removed for the new weapon and mags to be added
  _oldMag = phx_loadout_rifle_mag splitString ":" select 0;
  _oldMagNum = parseNumber (phx_loadout_rifle_mag splitString ":" select 1);
  if (isNil "_oldMagNum") then {_oldMagNum = 1};

  _oldTracer = phx_loadout_rifle_mag_tracer splitString ":" select 0;
  _oldTracerNum = parseNumber (phx_loadout_rifle_mag_tracer splitString ":" select 1);
  if (isNil "_oldTracerNum") then {_oldTracerNum = 1};

  _oldMagCount = {_x == _oldMag} count magazines player;
  _oldTracerCount = {_x == _oldTracer} count magazines player;

  if !(_oldMagCount == _oldMagNum) exitWith {hint "Missing magazines"};
  if !(_oldTracerCount == _oldTracerNum) exitWith {hint "Missing tracers"};

  player removeMagazines _oldMag;
  player removeMagazines _oldTracer;

  _mag call phx_fnc_addGear;
  player addWeapon _weapon;
  _tracer call phx_fnc_addGear;

  phx_loadout_rifle_mag = _mag;
  phx_loadout_rifle_mag_tracer = _tracer;

  {
    player addPrimaryWeaponItem _x;
  } forEach _weaponItems;
};

//Weapons actions
{
  _action = ["Weapon_Selector",getText (configFile >> "cfgWeapons" >> _x select 0 >> "displayName"),"",{
    (_this select 2) call phx_selector_fnc_weapons;
  },{primaryWeapon player != "" && count phx_selector_weapons > 1}, {}, _x] call ace_interact_menu_fnc_createAction;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Weapon_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
} forEach phx_selector_weapons;
