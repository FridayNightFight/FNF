#include "WEAPONS_IND.sqf"

if (!phx_loadout_hasSpecial) then {
  phx_loadout_rifle_weapon = "rhs_weap_vhsd2";
  phx_loadout_rifle_mag = "rhsgref_30rnd_556x45_vhs2:7";
  phx_loadout_rifle_mag_tracer = "rhsgref_30rnd_556x45_vhs2_t:4";
};

if (phx_loadout_hasUGL) then {
  phx_loadout_rifle_weapon = "rhs_weap_vhsd2_bg";
};

phx_selector_weapons = [];
