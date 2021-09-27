#include "WEAPONS_IND.sqf"

WEAPONS_VHS_LOADOUT = [
  ["rifle", ["rhs_weap_vhsd2"]],
  ["sidearm", ["rhs_weap_pya"]],
  ["AR", ["rhs_weap_rpk74m"]],
  ["MG", ["rhs_weap_pkp"]],
  ["AT", ["rhs_weap_rpg26"]],
  ["SNP", ["rhs_weap_t5000"]],
  ["RS", ["rhs_weap_vhsd2", "rhs_weap_aks74un"]],
  ["P", ["rhs_weap_aks74un"]]
];

if (!phx_loadout_hasSpecial) then {
  phx_loadout_rifle_weapon = "rhs_weap_vhsd2";
  phx_loadout_rifle_mag = "rhsgref_30rnd_556x45_vhs2:7";
  phx_loadout_rifle_mag_tracer = "rhsgref_30rnd_556x45_vhs2_t:4";
};

if (phx_loadout_hasUGL) then {
  phx_loadout_rifle_weapon = "rhs_weap_vhsd2_bg";
};

phx_selector_weapons = [];
