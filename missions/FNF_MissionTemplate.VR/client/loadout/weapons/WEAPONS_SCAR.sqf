#include "..\cfgLoadouts.hpp"

if !(pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL || pRole == ROLE_MK || pRole == ROLE_P || pRole == ROLE_AR || pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "rhs_weap_SCARH_FDE_STD";
  phx_loadout_rifle_mag = "rhs_mag_20Rnd_SCAR_762x51_m80_ball:7";
  phx_loadout_rifle_mag_tracer = "rhs_mag_20Rnd_SCAR_762x51_m62_tracer:4";
  phx_allowedWeapons = [];
};
