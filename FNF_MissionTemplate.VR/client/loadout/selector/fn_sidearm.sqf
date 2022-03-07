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


if (isNil "_mags") then {_mags = fnf_loadout_sidearmMagazines};
_mags = [_mags, _weapon] call fnf_loadout_fnc_getWeaponMagazines;

if (_weapon == handgunWeapon player) exitWith {};

{
  player removeHandgunItem _x;
  [_x, "vest", player] call fnf_loadout_fnc_addGear;
} forEach (handgunMagazine player);

private _weaponItems = handgunItems player;

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
} forEach fnf_loadout_sidearmMagazines;

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
fnf_loadout_sidearm = _weapon;

fnf_loadout_sidearmMagazines = _mags;

{
  player addHandgunItem _x;
} forEach _weaponItems;

if ((player getVariable "fnfLoadout") == "RIS") then {
  // add silencer if avail
  _muzzleAcc = [_weapon, "muzzle"] call CBA_fnc_compatibleItems;
  _silencers = _muzzleAcc select {getNumber(configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "soundTypeIndex") > 0};
  if (count _silencers > 0) then {player addHandgunItem (_silencers select 0)};
};

_weapon call _fnc_hintDetails;
