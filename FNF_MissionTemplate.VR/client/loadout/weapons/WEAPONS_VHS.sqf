#include "..\cfgLoadouts.hpp"
call giveBLUFORLoadout;

if !(pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL || pRole == ROLE_MK || pRole == ROLE_P || pRole == ROLE_AR || pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "rhs_weap_vhsd2";
  phx_loadout_rifle_mag = "rhsgref_30rnd_556x45_vhs2:7";
  phx_loadout_rifle_mag_tracer = "rhsgref_30rnd_556x45_vhs2_t:4";
};

if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_rifle_weapon = "rhs_weap_vhsd2_bg";
  phx_loadout_rifle_mag = "rhsgref_30rnd_556x45_vhs2:7";
  phx_loadout_rifle_mag_tracer = "rhsgref_30rnd_556x45_vhs2_t:4";
};
