#include "WEAPONS_US.sqf"

WEAPONS_G36_LOADOUT = [
  ["rifle", ["rhs_weap_g36kv"]],
  ["sidearm", ["rhsusf_weap_glock17g4"]],
  ["AR", ["rhs_weap_m249_pip_L"]],
  ["MG", ["rhs_weap_m240G"]],
  ["AT", ["rhs_weap_m72a7"]],
  ["SNP", ["rhs_weap_XM2010"]],
  ["RS", ["srifle_EBR_F", "rhsusf_weap_MP7A2"]],
  ["P", ["rhsusf_weap_MP7A2"]]
];

if (!phx_loadout_hasSpecial) then {
  phx_loadout_rifle_weapon = "rhs_weap_g36kv";
  phx_loadout_rifle_mag = "rhssaf_30rnd_556x45_EPR_G36:7";
  phx_loadout_rifle_mag_tracer = "rhssaf_30rnd_556x45_Tracers_G36:4";
};

if (phx_loadout_hasUGL) then {
  phx_loadout_rifle_weapon = "rhs_weap_g36kv_ag36";
};

phx_selector_weapons = [];
