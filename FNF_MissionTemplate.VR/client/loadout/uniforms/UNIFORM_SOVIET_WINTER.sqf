phx_loadout_uniform = "rhs_uniform_afghanka_winter_boots_ttsko";
phx_loadout_vest = "rhs_lifchik";
phx_loadout_headgear = "rhs_stsh81_butan";

if (phx_loadout_unitLevel == 2) then {
  phx_loadout_vest = "rhs_lifchik_NCO";
  phx_loadout_headgear = "rhs_fieldcap_m88_ttsko";
}; //PL, SL

if (phx_loadout_unitLevel == 1) then {
  phx_loadout_vest = "rhs_lifchik_vog";
  phx_loadout_headgear = "rhs_ushanka";
}; //TL, MGTL

if (pRole == ROLE_MK || pRole == ROLE_CLS) then {
  phx_loadout_vest = "rhs_lifchik_light";
};

#include "base\EAST_WD.sqf"
