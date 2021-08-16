phx_loadout_uniform = "rhs_uniform_gorka_r_g";
phx_loadout_vest = "rhs_6b23_digi_6sh92_Spetsnaz";
phx_loadout_headgear = "rhs_altyn_bala";

if (phx_loadout_unitlevel > 0) then 
{
  phx_loadout_vest = "rhs_6b23_digi_6sh92_Vog_Radio_spetsnaz";
};

if (pRole == ROLE_AR || pRole == ROLE_MG) then
{
  phx_loadout_vest = "rhs_6b23_digi";
};

if (pRole == ROLE_MK) then {
  phx_loadout_vest = "rhs_6b23_digi_sniper";
};

#include "base\EAST_WD.sqf"
