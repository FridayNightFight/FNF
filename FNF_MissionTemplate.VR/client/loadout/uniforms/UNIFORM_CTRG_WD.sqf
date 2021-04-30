phx_loadout_uniform  = "U_B_CTRG_2";
phx_loadout_vest     = "V_PlateCarrier2_rgr_noflag_F";
phx_loadout_headgear = "H_HelmetB_snakeskin";

if (pRole == ROLE_CR) then { phx_loadout_headgear = "H_HelmetCrew_I";}; // Crewman

#include "base\WEST_WD.sqf"
