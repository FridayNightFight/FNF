//If player doesn't have tracer mags at start, ignore for mag count checks
// if !((fnf_loadout_rifle_mag_tracer splitString ":" select 0) in magazines player) then {fnf_loadout_rifle_mag_tracer = "0:0"};

// //add player's current weapon to selector
// _curAllMags = (magazinesAmmo player);
// _curAllMags pushback [primaryWeaponMagazine player];
// _curAllMagsProcessed = flatten (_curAllMags apply {_x # 0});
// _compatMags = [primaryWeapon player] call CBA_fnc_compatibleMagazines;

// _saveMags = _curAllMagsProcessed select {_x in _compatMags};
// _toProcess = _saveMags call CBA_fnc_getArrayElements;

// _curSet = [primaryWeapon player];
// {
//   if !(_x isEqualType 2) then {
//     _curSet pushBack format[
//       "%1:%2",
//       _x,
//       _toProcess select (_forEachIndex + 1)
//     ];
//   };
// } forEach _toProcess;

// fnf_selector_weapons pushBack _curSet;
// reverse fnf_selector_weapons;

params ["_weapon","_mags"];

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
  [_textArr joinString '<br/>', "success", 5] call fnf_ui_fnc_notify;
};


if (isNil "_mags") then {_mags = fnf_loadout_weaponMagazines};
_mags = [_mags, _weapon] call fnf_loadout_fnc_getWeaponMagazines;

if (_weapon == primaryWeapon player) exitWith {};

{
  player removePrimaryWeaponItem _x;
  [_x, "vest", player] call fnf_loadout_fnc_addGear;
} forEach primaryWeaponMagazine player;

private _weaponItems = primaryWeaponItems player;

//makes sure player still has all magazines to prevent mag duping
//all old mags have to be removed for the new weapon and mags to be added
_oldMags = [];
{
  (_x splitString ":") params ["_magClass","_count"];
  if (isNil "_count") then {
    _count = 1;
  } else {
    _count = parseNumber(_count);
  };
  for "_i" from 1 to _count do {
    _oldMags pushBack _magClass;
  };
} forEach fnf_loadout_weaponMagazines;

_oldMags = _oldMags call BIS_fnc_consolidateArray;

private _allOldMagsPresent = true;
{
  _x params ["_thisOldMag", "_desiredCount"];
  private _currentCount = ({_x == _thisOldMag} count magazines player);
  if (_currentCount < _desiredCount) exitWith {_allOldMagsPresent = false};
} forEach _oldMags;

if (!_allOldMagsPresent) exitWith {hint "Missing magazines"};

{player removeMagazines _x} forEach (_oldMags apply {_x # 0});

{[_x, "vest", player] call fnf_loadout_fnc_addGear} forEach _mags;
player addWeapon _weapon;
fnf_loadout_weapon = _weapon;

fnf_loadout_weaponMagazines = _mags;

{
  player addPrimaryWeaponItem _x;
} forEach _weaponItems;

// if previous optic doesn't fit new weapon, null prior selection so they can pick a new one
if !(fnf_loadout_chosenOptic in ([primaryWeapon player, "optic"] call CBA_fnc_compatibleItems)) then {
  fnf_loadout_chosenOptic = "";
};

if ((player getVariable "fnfLoadout") == "RIS") then {
  // add silencer if avail
  _muzzleAcc = [_weapon, "muzzle"] call CBA_fnc_compatibleItems;
  _silencers = _muzzleAcc select {getNumber(configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "soundTypeIndex") > 0};
  if (count _silencers > 0) then {player addPrimaryWeaponItem (_silencers select 0)};
};

_weapon call _fnc_hintDetails;
