#include "WEAPONS_RU.sqf"


WEAPONS_IND_LOADOUT = [
  ["rifle", ["rhs_weap_akmn"]],
  ["sidearm", ["rhs_weap_pya"]],
  ["AR", ["rhs_weap_rpk74m"]],
  ["MG", ["rhs_weap_pkp"]],
  ["AT", ["rhs_weap_rpg26"]],
  ["SNP", ["rhs_weap_t5000"]],
  ["RS", ["rhs_weap_akmn", "rhs_weap_aks74un"]],
  ["P", ["rhs_weap_aks74un"]]
];

if (!phx_loadout_hasSpecial) then {
  phx_loadout_rifle_weapon = "rhs_weap_akmn";
  phx_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm_polymer_tracer:4";
  phx_loadout_rifle_mag = "rhs_30Rnd_762x39mm_polymer_89:7";

  if (phx_loadout_hasUGL) then {phx_loadout_rifle_weapon = "rhs_weap_akmn_gp25"};
};
