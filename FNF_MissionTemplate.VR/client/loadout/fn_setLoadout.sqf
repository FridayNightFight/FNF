if (pRole == ROLE_CIV) exitWith {phx_loadoutAssigned = true};

//set which ugl ammo type is needed
if (phx_loadout_hasUGL) then {
  private _mags = [phx_loadout_rifle_weapon,true] call CBA_fnc_compatibleMagazines;
  if (((phx_loadout_uglAmmoWest select 0) splitString ":") select 0 in _mags) then {phx_loadout_uglAmmo = phx_loadout_uglAmmoWest} else {phx_loadout_uglAmmo = phx_loadout_uglAmmoEast};
};

call phx_fnc_addUniform;
call phx_fnc_addItems;
call phx_fnc_addMagazines;
call phx_fnc_addWeapons;

player linkItem "ItemRadio";
player linkItem "ItemGPS";
player linkItem "ItemCompass";
//player linkItem "ItemWatch";
player linkItem "TFAR_microdagr";

if (phx_loadout_unitLevel > 0) then {
  player addItem "ACE_microDAGR";
};

missionNamespace setVariable ["phx_loadoutAssigned",true];
