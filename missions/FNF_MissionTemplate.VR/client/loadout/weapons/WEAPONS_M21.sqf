#include "..\cfgLoadouts.hpp"
call giveOPFORLoadout;

if !(pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL || pRole == ROLE_MK || pRole == ROLE_P || pRole == ROLE_AR || pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "rhs_weap_m21a";
  phx_loadout_rifle_mag = "rhsgref_30rnd_556x45_m21:7";
  phx_loadout_rifle_mag_tracer = "rhsgref_30rnd_556x45_m21_t:4";
};

if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_rifle_weapon = "rhs_weap_m21a_pbg40";
  phx_loadout_rifle_mag = "rhsgref_30rnd_556x45_m21:7";
  phx_loadout_rifle_mag_tracer = "rhsgref_30rnd_556x45_m21_t:4";
};

phx_allowedWeapons = [];
