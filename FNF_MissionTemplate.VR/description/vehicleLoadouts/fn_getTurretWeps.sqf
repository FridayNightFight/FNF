params [["_vehicle", objNull, [objNull]], ["_varName", "turrets", [""]]];

if (isNull _vehicle) exitWith {};

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
        _magDisplayName = getText(configFile >> "CfgMagazines" >> _magClassName >> "displayName");
        _presentMags pushBack [_magClassName, _magDisplayName, _magAmmoCount];
        _countedMags pushBackUnique _magClassName;
      };
    } forEach _allMags;

    // exclude pylons from reg turret weapons
    if (
      count _presentMags > 0 &&
      _presentMags findIf {(_x # 0) in (_pylons apply {_x # 3})} > -1
    ) then {continue};

    // _weaponsData pushBack ([[[_weapon, ["magazines", _presentMags]]], []] call CBA_fnc_hashCreate);
    // _weaponsData pushBack [_weapon, _presentMags];

    _weaponDisplayName = getText(configFile >> "CfgWeapons" >> _weapon >> "displayName");
    // _weaponsData pushBack [_weaponDisplayName, [[["className", _weapon], ["magazines", _presentMags]]] call CBA_fnc_hashCreate];
    // _weaponsData pushBack [_weaponDisplayName, [_weapon, _presentMags]];
    _weaponsData pushBack [_weapon, _weaponDisplayName, _presentMags call BIS_fnc_consolidateArray];

  } forEach _weapons;

  {
    _x params ["_pylonIndex", "_pylonName", "_pylonTurretPath", "_magazineClassName", "_magazineAmmo"];
    if (_turretPath isEqualTo _pylonTurretPath && _magazineClassName != "") then {
      _magazineDisplayName = getText(configFile >> "CfgMagazines" >> _magazineClassName >> "displayName");

      // _pylonData pushBack [str(_pylonIndex),[[["pylonName", _pylonName], ["className", _magazineClassName], ["displayName", _magazineDisplayName], ["ammoCount", _magazineAmmo]]] call CBA_fnc_hashCreate];
      // _pylonData pushBack [str(_pylonIndex), [_pylonName, _magazineClassName, _magazineDisplayName, _magazineAmmo]];
      _pylonData pushBack [_pylonIndex, _pylonName, _magazineClassName, _magazineDisplayName, _magazineAmmo];
    };
  } forEach _pylons;

  _thisArr pushBack [
    str(_x),
    [[
      // ["weapons", [_weaponsData, []] call CBA_fnc_hashCreate],
      ["weapons", _weaponsData],
      // ["pylons", [_pylonData, []] call CBA_fnc_hashCreate]
      ["pylons", _pylonData]
    ]] call CBA_fnc_hashCreate
  ];

} forEach _turrets;

// _incompatibleMags = (magazinesAllTurrets [_vehicle, true]) apply {_x # 0} select {!(_x in _countedMags)};
_incompatibleMags = (magazinesAllTurrets _vehicle) apply {
  [_x#0, getText(configFile >> "CfgMagazines" >> (_x#0) >> "displayName"), str(_x#1), _x#2]
} select {!((_x # 0) in _countedMags)};
_thisArr pushBack ["incompatibleMags", _incompatibleMags];


_vehicle setVariable [_varName, _thisArr];
