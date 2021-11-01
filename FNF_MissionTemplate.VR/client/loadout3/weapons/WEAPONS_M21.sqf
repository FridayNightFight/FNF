#include "WEAPONS_US.sqf"

WEAPONS_US_LOADOUT = [
  ["rifle", ["rhs_weap_m21a"]],
  ["sidearm", ["rhsusf_weap_glock17g4"]],
  ["AR", ["rhs_weap_m249_pip_L"]],
  ["MG", ["rhs_weap_m240G"]],
  ["AT", ["rhs_weap_m72a7"]],
  ["SNP", ["rhs_weap_XM2010"]],
  ["RS", ["srifle_EBR_F", "rhsusf_weap_MP7A2"]],
  ["P", ["rhsusf_weap_MP7A2"]]
];

if (!phx_loadout_hasSpecial) then {
  phx_loadout_rifle_weapon = "rhs_weap_m21a";
  phx_loadout_rifle_mag = "rhsgref_30rnd_556x45_m21:7";
  phx_loadout_rifle_mag_tracer = "rhsgref_30rnd_556x45_m21_t:4";
};

if (phx_loadout_hasUGL) then {
  phx_loadout_rifle_weapon = "rhs_weap_m21a_pbg40";
};

phx_selector_weapons = [];
