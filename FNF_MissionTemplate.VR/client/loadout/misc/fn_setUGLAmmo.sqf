/*Sets the UGL ammo type to be used for the player's weapon*/

private _mags = [phx_loadout_rifle_weapon,true] call CBA_fnc_compatibleMagazines;

if (((phx_loadout_uglAmmoWest select 0) splitString ":") select 0 in _mags) then {
  // if first mag for West will fit, use West
  if (pRole == ROLE_GR) then {
    // and if they're a GR (grenadier), use that set
    phx_loadout_uglAmmo = phx_loadout_uglAmmoWestGR;
  } else {
    // if not, use standard for SL/TL etc
    phx_loadout_uglAmmo = phx_loadout_uglAmmoWest;
  };
} else {
  if (pRole == ROLE_GR) then {
    phx_loadout_uglAmmo = phx_loadout_uglAmmoEastGR;
  } else {
    phx_loadout_uglAmmo = phx_loadout_uglAmmoEast;
  };
};

if (pRole == ROLE_GRIR) then {
  phx_loadout_uglAmmo = phx_loadout_uglAmmoGRIR;
};