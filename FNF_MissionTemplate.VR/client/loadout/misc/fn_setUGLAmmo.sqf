/*Sets the UGL ammo type to be used for the player's weapon*/

private _mags = [phx_loadout_rifle_weapon,true] call CBA_fnc_compatibleMagazines;

if (((phx_loadout_uglAmmoWest select 0) splitString ":") select 0 in _mags) then {
  // if first mag for West will fit, use West
  switch (pRole) do {
    // and if they're a GR (grenadier), use that set
    case ROLE_GR: {phx_loadout_uglAmmo = phx_loadout_uglAmmoWestGR};
    // if they should have huntIR, use that set
    case ROLE_GRIR: {phx_loadout_uglAmmo = phx_loadout_uglAmmoWestGRIR};
    // if neither, use standard for SL/TL etc
    default {phx_loadout_uglAmmo = phx_loadout_uglAmmoWest};
  };
} else {
  switch (pRole) do {
    // and if they're a GR (grenadier), use that set
    case ROLE_GR: {phx_loadout_uglAmmo = phx_loadout_uglAmmoEastGR};
    // if they should have huntIR, use that set
    case ROLE_GRIR: {phx_loadout_uglAmmo = phx_loadout_uglAmmoEastGRIR};
    // if neither, use standard for SL/TL etc
    default {phx_loadout_uglAmmo = phx_loadout_uglAmmoEast};
  };
};