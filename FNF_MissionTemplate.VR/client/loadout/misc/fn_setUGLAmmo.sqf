/*Sets the UGL ammo type to be used for the player's weapon*/

private _mags = [phx_loadout_rifle_weapon,true] call CBA_fnc_compatibleMagazines;

if (((phx_loadout_uglAmmoWest select 0) splitString ":") select 0 in _mags) then {
  phx_loadout_uglAmmo = phx_loadout_uglAmmoWest;
} else {
  phx_loadout_uglAmmo = phx_loadout_uglAmmoEast;
};
