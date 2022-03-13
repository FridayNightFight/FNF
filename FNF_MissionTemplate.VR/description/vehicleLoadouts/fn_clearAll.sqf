params ["_vehicle"];

// clear turret magazines
{
  _x params ["_className", "_turretPath"];
  _vehicle removeMagazinesTurret [_className, _turretPath];
} forEach (magazinesAllTurrets _vehicle);

// clear turret weapons
{
  private _turretPath = _x;
  {
    private _weapon = _x;
    _vehicle removeWeaponTurret [_weapon, _turretPath];
  } forEach (_vehicle weaponsTurret _x);
} forEach ([[-1]] + allTurrets _vehicle);

// clear pylon mags
{
  _x params ["_pylonIndex", "_pylonName", "_turretPath", "_magazine", "_magAmmo"];
  _vehicle setPylonLoadout [_pylonName, "", true, [-1]];
} forEach (getAllPylonsInfo _vehicle);
