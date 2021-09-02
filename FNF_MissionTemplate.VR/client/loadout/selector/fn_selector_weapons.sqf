//If player doesn't have tracer mags at start, ignore for mag count checks
if !((phx_loadout_rifle_mag_tracer splitString ":" select 0) in magazines player) then {phx_loadout_rifle_mag_tracer = "0:0"};

//add player's current weapon to selector
_curAllMags = (magazinesAmmo player);
_curAllMags pushback [primaryWeaponMagazine player];
_curAllMagsProcessed = flatten (_curAllMags apply {_x # 0});
_compatMags = [primaryWeapon player] call CBA_fnc_compatibleMagazines;

_saveMags = _curAllMagsProcessed select {_x in _compatMags};
_toProcess = _saveMags call CBA_fnc_getArrayElements;

_curSet = [primaryWeapon player];
{
  if !(_x isEqualType 2) then {
    _curSet pushBack format[
      "%1:%2",
      _x,
      _toProcess select (_forEachIndex + 1)
    ];
  };
} forEach _toProcess;

phx_selector_weapons pushBack _curSet;
reverse phx_selector_weapons;

phx_selector_fnc_weapons = {
  params ["_weapon","_mag","_tracer"];

  _fnc_hintDetails = {
    private _thisCfg = _this call CBA_fnc_getItemConfig;
    private _dispName = [_thisCfg] call BIS_fnc_displayName;
    private _desc = getText(_thisCfg >> "descriptionShort");
    private _pic = getText(_thisCfg >> "picture");

    _textArr = [
      format["<t align='center'><t size='1.5'>%1</t>", _dispName],
      _desc,
      format["<img size='3' image='%1'/>", _pic],
      "</t>"
    ];
    [_textArr joinString '<br/>', "success", 5] call phx_ui_fnc_notify;
  };

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

  if (pRole == ROLE_RS) then {
    // add silencer if avail
    _muzzleAcc = [_weapon, "muzzle"] call CBA_fnc_compatibleItems;
    _silencers = _muzzleAcc select {getNumber(configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "soundTypeIndex") > 0};
    if (count _silencers > 0) then {player addPrimaryWeaponItem (_silencers select 0)};
  };

  _weapon call _fnc_hintDetails;
};

//Weapons actions
{
  _action = [
    "Weapon_Selector",
    getText (configFile >> "cfgWeapons" >> _x # 0 >> "displayName"),
    "",
    { // param to code above
      (_this select 2) call phx_selector_fnc_weapons;
    },
    { // condition
      primaryWeapon player != "" && count phx_selector_weapons > 1 && fnf_pref_loadoutInterface == "ACE"
    },
    {},
    _x // arg to be used in param, arg is array
  ] call ace_interact_menu_fnc_createAction;
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector","Weapon_Selector"], _action] call ace_interact_menu_fnc_addActionToClass;
} forEach phx_selector_weapons;
