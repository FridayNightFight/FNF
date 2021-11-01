#include "WEAPONS_US.sqf"

WEAPONS_US_LOADOUT = [
  ["rifle", ["rhs_weap_m14_rail_fiberglass"]],
  ["sidearm", ["rhsusf_weap_glock17g4"]],
  ["AR", ["rhs_weap_m249_pip_L"]],
  ["MG", ["rhs_weap_m240G"]],
  ["AT", ["rhs_weap_m72a7"]],
  ["SNP", ["rhs_weap_XM2010"]],
  ["RS", ["srifle_EBR_F", "rhsusf_weap_MP7A2"]],
  ["P", ["rhsusf_weap_MP7A2"]]
];

if (!phx_loadout_hasSpecial && !phx_loadout_hasUGL) then {
  phx_loadout_rifle_weapon = "rhs_weap_m14_rail_fiberglass";
  phx_loadout_rifle_mag = "rhsusf_20Rnd_762x51_m80_Mag:10";
  phx_loadout_rifle_mag_tracer = "rhsusf_20Rnd_762x51_m62_Mag:5";
};

phx_selector_weapons = [];
