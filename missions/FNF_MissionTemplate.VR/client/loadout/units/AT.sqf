// Add gear - you can also re-define gear here
phx_loadout_aid call phx_fnc_addGear;
phx_loadout_smoke call phx_fnc_addGear;
phx_loadout_grenade call phx_fnc_addGear;
phx_loadout_maptools call phx_fnc_addGear;

phx_loadout_rifle_mag call phx_fnc_addGear;
player addWeapon phx_loadout_rifle_weapon;
phx_loadout_rifle_mag_tracer call phx_fnc_addGear;

phx_loadout_sidearm_mag call phx_fnc_addGear;
player addWeapon phx_loadout_sidearm_weapon;

phx_loadout_mediumantitank_mag call phx_fnc_addGear;
if (!isNil "phx_loadout_mediumantitank_mag_1" && phx_loadout_mediumantitank_mag_1 != "") then {phx_loadout_mediumantitank_mag_1 call phx_fnc_addGear};

//Sleep to avoid weird issue where game thinks there is no room in backpack after adding launcher
[] spawn {
  sleep 1;
  player addWeapon phx_loadout_mediumantitank_weapon;
  player addSecondaryWeaponItem phx_loadout_mediumantitank_optic;
};
