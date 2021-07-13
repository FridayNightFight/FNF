#include "WEAPONS_IND.sqf"

//Global primary weapon and magazine classes
if (!phx_loadout_hasSpecial && !phx_loadout_hasUGL) then {
  phx_loadout_rifle_weapon = "rhs_weap_l1a1_wood";
  phx_loadout_rifle_mag_tracer = "rhs_mag_20Rnd_762x51_m62_fnfal:5";
  phx_loadout_rifle_mag = "rhs_mag_20Rnd_762x51_M80a1_fnfal:10";
};

//Global sidearm classes
phx_loadout_sidearm_weapon = "rhsusf_weap_m1911a1";
phx_loadout_sidearm_mag = "rhsusf_mag_7x45acp_MHP:3";
