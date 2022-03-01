// params [["_vehicle", objNull, [objNull]]];
// _vehicle = vehicle player;
_vehicle = cursorObject;

_rawOut = [
  ["className", typeOf _vehicle],
  ["displayName", (configOf _vehicle) call BIS_fnc_displayName],
  ["hierarchy", [configOf _vehicle, true] call BIS_fnc_returnParents]
];

// thisArr contains each turret and subdata for weapons and mags and pylons
_thisArr = [];
// countedMags counts all processed magazines, to determine if vehicles have magazines in a turret that don't match any weapon
_countedMags = [];

_turrets = [[-1]] + allTurrets _vehicle;
_allMags = magazinesAllTurrets _vehicle;
_pylons = getAllPylonsInfo _vehicle;
{
  private _turretPath = _x;
  private _weapons = _vehicle weaponsTurret _turretPath;

  private _weaponsData = [];
  private _pylonData = [];

  {
    private _weapon = _x;

    private _compatMags = [_weapon] call CBA_fnc_compatibleMagazines;
    private _presentMags = [];
    {
      _x params ["_magClassName", "_magTurretPath", "_magAmmoCount"];
      if (_magClassName in _compatMags && _magTurretPath isEqualTo _turretPath) then {
        _presentMags pushBack [_magClassName, _magAmmoCount];
        _countedMags pushBackUnique _magClassName;
      };
    } forEach _allMags;

    // exclude pylons from reg turret weapons
    if (
      count _presentMags > 0 &&
      _presentMags findIf {(_x # 0) in (_pylons apply {_x # 3})} > -1
    ) then {continue};

    _weaponsData pushBack [_weapon, _presentMags];
  } forEach _weapons;

  {
    _x params ["_pylonIndex", "_pylonName", "_pylonTurretPath", "_magazineClassName", "_magazineAmmo"];
    if (_turretPath isEqualTo _pylonTurretPath) then {
      _pylonData pushBack [_pylonIndex, _magazineClassName, _magazineAmmo];
    };
  } forEach _pylons;

  _thisArr pushBack [str(_x), [["weapons", _weaponsData], ["pylons", _pylonData]]];

} forEach _turrets;

// _incompatibleMags = (magazinesAllTurrets [_vehicle, true]) apply {_x # 0} select {!(_x in _countedMags)};
_incompatibleMags = (magazinesAllTurrets _vehicle) apply {_x select [0,2]} select {!((_x # 0) in _countedMags)};
_thisArr pushBack ["incompatibleMags", _incompatibleMags];

// place the data we acquired into a subobject of class/displayname
_rawOut pushBack ["turretsOriginal", _thisArr];
// _rawOut pushBack ["turretsModified", _thisArr];
_finalArr = [_rawOut, []] call CBA_fnc_hashCreate;
_outJSON = [_finalArr] call CBA_fnc_encodeJSON;

// "debug_console" callExtension format["%1", text _outJSON];
// "debug_console" callExtension str _outJSON;
// [text _outJSON, _outJSON];
text _outJSON;
