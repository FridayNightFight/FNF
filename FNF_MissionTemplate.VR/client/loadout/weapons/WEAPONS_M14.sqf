#include "WEAPONS_US.sqf"

if (!phx_loadout_hasSpecial && !phx_loadout_hasUGL) then {
  phx_loadout_rifle_weapon = "rhs_weap_m14_rail_fiberglass";
  phx_loadout_rifle_mag = "rhsusf_20Rnd_762x51_m80_Mag:10";
  phx_loadout_rifle_mag_tracer = "rhsusf_20Rnd_762x51_m62_Mag:5";
};

phx_selector_weapons = [];
