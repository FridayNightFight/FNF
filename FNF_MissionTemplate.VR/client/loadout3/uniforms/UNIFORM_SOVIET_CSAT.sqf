phx_loadout_uniform = "rhs_uniform_afghanka_ttsko";
phx_loadout_vest = selectRandom ["rhs_lifchik", "rhs_lifchik_light"];
phx_loadout_headgear = "rhs_stsh81_butan";

if (phx_loadout_unitLevel == 2) then {
  phx_loadout_vest = "rhs_lifchik_NCO";
  phx_loadout_headgear = "rhs_fieldcap_m88_ttsko";
}; //PL, SL
if (phx_loadout_unitLevel == 1) then {
  phx_loadout_vest = "rhs_lifchik_vog";
}; //TL, MGTL
if (pRole == ROLE_MK) then {
  phx_loadout_vest = "rhs_belt_svd";
};

#include "base\EAST_D.sqf"
