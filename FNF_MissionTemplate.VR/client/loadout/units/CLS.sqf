// Add gear - you can also re-define gear here
[phx_loadout_PAK, "backpack"] call phx_fnc_addGear;
[phx_loadout_bandage, "backpack"] call phx_fnc_addGear;
[phx_loadout_morphine, "backpack"] call phx_fnc_addGear;
[phx_loadout_epinephrine, "backpack"] call phx_fnc_addGear;
[phx_loadout_blood, "backpack"] call phx_fnc_addGear;

phx_loadout_aid call phx_fnc_addGear;
phx_loadout_smoke call phx_fnc_addGear;
phx_loadout_grenade call phx_fnc_addGear;
phx_loadout_maptools call phx_fnc_addGear;
phx_loadout_rifle_mag call phx_fnc_addGear;
player addWeapon phx_loadout_rifle_weapon;
phx_loadout_rifle_mag_tracer call phx_fnc_addGear;
phx_loadout_sidearm_mag call phx_fnc_addGear;
player addWeapon phx_loadout_sidearm_weapon;

player setVariable ["ace_medical_medicclass", 1, true];
