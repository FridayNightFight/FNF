#include "..\cfgLoadouts.hpp"
call giveBLUFORLoadout;

if !(pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL || pRole == ROLE_MK || pRole == ROLE_P || pRole == ROLE_AR || pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "rhs_weap_g36kv";
  phx_loadout_rifle_mag = "rhssaf_30rnd_556x45_EPR_G36:7";
  phx_loadout_rifle_mag_tracer = "rhssaf_30rnd_556x45_Tracers_G36:4";
};

if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_rifle_weapon = "rhs_weap_g36kv_ag36";
  phx_loadout_rifle_mag = "rhssaf_30rnd_556x45_EPR_G36:7";
  phx_loadout_rifle_mag_tracer = "rhssaf_30rnd_556x45_Tracers_G36:4";
};

phx_allowedWeapons = [];
