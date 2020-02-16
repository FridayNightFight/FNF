// Add clothing
call phx_fnc_loadout_handleClothing; // Add clothing variables above this line!

// Add gear
[phx_loadout_aid, "uniform"] call phx_fnc_loadout_handleGear;
//[phx_loadout_splint, "uniform"] call phx_fnc_loadout_handleGear;
[phx_loadout_smoke, "uniform"] call phx_fnc_loadout_handleGear;
[phx_loadout_grenade, "uniform"] call phx_fnc_loadout_handleGear;
[phx_loadout_cuffs, "item"] call phx_fnc_loadout_handleGear;
player addWeapon phx_loadout_mmg_weapon;
player addPrimaryWeaponItem (phx_loadout_mmg_mag select [0, count phx_loadout_mmg_mag - 2]);
[phx_loadout_mmg_mag, "backpack"] call phx_fnc_loadout_handleGear;
[phx_loadout_sidearm_mag, "vest"] call phx_fnc_loadout_handleGear;
player addWeapon phx_loadout_sidearm_weapon;


// Add items
call phx_fnc_loadout_handleItems; // Add binocular/nvg variables above this line!

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
