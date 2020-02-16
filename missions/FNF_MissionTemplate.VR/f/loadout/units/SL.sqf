phx_loadout_unitLevel = 2;

// Add clothing
call phx_fnc_loadout_handleClothing; // Add clothing variables above this line!

// Add gear
[phx_loadout_aid, "uniform"] call phx_fnc_loadout_handleGear;
//[phx_loadout_splint, "uniform"] call phx_fnc_loadout_handleGear;
[phx_loadout_smoke, "uniform"] call phx_fnc_loadout_handleGear;
[phx_loadout_grenade, "uniform"] call phx_fnc_loadout_handleGear;
[phx_loadout_cuffs, "item"] call phx_fnc_loadout_handleGear;
[phx_loadout_maptools, "item"] call phx_fnc_loadout_handleGear;
[phx_loadout_rifle_gl_he, "vest"] call phx_fnc_loadout_handleGear;
[phx_loadout_rifle_gl_smoke, "vest"] call phx_fnc_loadout_handleGear;
[phx_loadout_rifle_gl_flare, "vest"] call phx_fnc_loadout_handleGear;
[phx_loadout_rifle_mag_tracer, "backpack"] call phx_fnc_loadout_handleGear;
[phx_loadout_rifle_mag, "backpack"] call phx_fnc_loadout_handleGear;
[phx_loadout_sidearm_mag, "vest"] call phx_fnc_loadout_handleGear;
player addWeapon phx_loadout_rifle_weapon;
player addWeapon phx_loadout_sidearm_weapon;

// Add items
phx_loadout_addBinocular = "ACE_VectorDay";
phx_loadout_dagr = "tf_microdagr";
call phx_fnc_loadout_handleItems; // Add binocular/nvg variables above this line!

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
