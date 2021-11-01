phx_loadout_uniform  = "rhsgreg_uniform_altis_lizard";
phx_loadout_vest     = "rhsusf_mbav_rifleman";
phx_loadout_headgear = "rhsgref_helmet_pasgt_altis_lizard";

if (pRole == ROLE_CLS) then
{
	phx_loadout_vest = "rhsusf_mbav_medic";
};

if (phx_loadout_unitlevel > 0) then
{
	phx_loadout_vest = "rhsusf_mbav_grenadier";
};

if (pRole == ROLE_MG || pRole == AR) then
{
	phx_loadout_vest = "rhsusf_mbav_mg";
};

#include "base\WEST_WD.sqf"