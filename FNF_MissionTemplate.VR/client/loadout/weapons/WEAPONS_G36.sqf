#include "WEAPONS_US.sqf"

if (!phx_loadout_hasSpecial) then {
  phx_loadout_rifle_weapon = "rhs_weap_g36kv";
  phx_loadout_rifle_mag = "rhssaf_30rnd_556x45_EPR_G36:7";
  phx_loadout_rifle_mag_tracer = "rhssaf_30rnd_556x45_Tracers_G36:4";
};

if (phx_loadout_hasUGL) then {
  phx_loadout_rifle_weapon = "rhs_weap_g36kv_ag36";
};

phx_selector_weapons = [];
