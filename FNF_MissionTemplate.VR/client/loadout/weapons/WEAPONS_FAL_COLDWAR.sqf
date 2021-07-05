
#include "WEAPONS_IND.sqf"

//Global primary weapon and magazine classes
phx_loadout_rifle_weapon = "rhs_weap_l1a1_wood";
phx_loadout_rifle_mag_tracer = "rhs_mag_20Rnd_762x51_m62_fnfal:4";
phx_loadout_rifle_mag = "rhs_mag_20Rnd_762x51_M80a1_fnfal:9";

//Global sidearm classes
phx_loadout_sidearm_weapon = "rhsusf_weap_m1911a1";
phx_loadout_sidearm_mag = "rhsusf_mag_7x45acp_MHP:3";

phx_allowedWeapons = []; //Weapons that can be selected in the gear selector. Leave blank for none.
//**Currently requires that selectable weapons use the same magazines**