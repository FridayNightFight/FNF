#include "WEAPONS_RU.sqf"

if (!phx_loadout_hasSpecial) then {
  phx_loadout_rifle_weapon = "rhs_weap_akmn";
  phx_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm_polymer_tracer:4";
  phx_loadout_rifle_mag = "rhs_30Rnd_762x39mm_polymer_89:7";

  if (phx_loadout_hasUGL) then {phx_loadout_rifle_weapon = "rhs_weap_akmn_gp25"};
};
