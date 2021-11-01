phx_loadout_uniform = "rhs_uniform_afghanka";
phx_loadout_vest = "rhs_lifchik";
phx_loadout_headgear = "rhs_ssh68_2";

if (phx_loadout_unitLevel == 2) then {
  phx_loadout_vest = "rhs_lifchik_NCO";
  phx_loadout_headgear = "rhs_fieldcap_m88";
}; //PL, SL

if (phx_loadout_unitLevel == 1) then {
  phx_loadout_vest = "rhs_lifchik_vog";
  phx_loadout_headgear = "rhs_pilotka";
}; //TL, MGTL

if (pRole == ROLE_MK || pRole == ROLE_CLS) then {
  phx_loadout_vest = "rhs_lifchik_light";
};

#include "base\EAST_D.sqf"
