// Add clothing
call phx_fnc_handleClothing; // Add clothing variables above this line!

//CE charges
call phx_fnc_loadout_handleCECharges;

// Add gear
[phx_loadout_rifle_mag_tracer, "vest"] call phx_fnc_handleGear;
[phx_loadout_explosives, "backpack"] call phx_fnc_handleGear;
[phx_loadout_aid, "uniform"] call phx_fnc_handleGear;
[phx_loadout_maptools, "item"] call phx_fnc_handleGear;
[phx_loadout_smoke, "uniform"] call phx_fnc_handleGear;
[phx_loadout_defusalkit, "uniform"] call phx_fnc_handleGear;
[phx_loadout_trigger, "uniform"] call phx_fnc_handleGear;
[phx_loadout_grenade, "uniform"] call phx_fnc_handleGear;
[phx_loadout_rifle_mag, "vest"] call phx_fnc_handleGear;
player addWeapon phx_loadout_rifle_weapon;
[phx_loadout_sidearm_mag, "vest"] call phx_fnc_handleGear;
player addWeapon phx_loadout_sidearm_weapon;
player addItem phx_loadout_entrenching;
player addItem "MineDetector";

if (phx_allowFortify && (playerSide == phx_defendingSide)) then {
  player addItem "ACE_Fortify";
};

// Add items
call phx_fnc_handleItems; // Add binocular/nvg variables above this line!

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
