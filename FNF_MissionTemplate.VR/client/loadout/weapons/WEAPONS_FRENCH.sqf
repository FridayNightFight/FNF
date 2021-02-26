#include "..\cfgLoadouts.hpp"

//Global primary weapon and magazine classes
phx_loadout_rifle_weapon     = "arifle_mas_fra_FAMAS_F";
phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red:4";
phx_loadout_rifle_mag        = "rhs_mag_30Rnd_556x45_M855A1_PMAG:7";

//Global sidearm classes
phx_loadout_sidearm_weapon = "rhsusf_weap_glock17g4";
phx_loadout_sidearm_mag    = "rhsusf_mag_17Rnd_9x19_JHP:2";

//Leadership roles - can delete this if you don't want leaders to have GLs or different primary weapons
if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_rifle_weapon   = "arifle_mas_fra_FAMAS_GL_F";
  phx_loadout_rifle_gl_he    = "1Rnd_HE_Grenade_shell:6";
  phx_loadout_rifle_gl_smoke = "1Rnd_Smoke_Grenade_shell:3";
  phx_loadout_rifle_gl_flare = "UGL_FlareWhite_F:3";
};

//AR and MG weapon and magazine classes
if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "LMG_mas_fra_03_F";
  phx_loadout_rifle_mag    = "rhsusf_200rnd_556x45_mixed_box:6";
};

if (pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "LMG_mas_fra_02_F";
  phx_loadout_rifle_mag    = "150Rnd_mas_fra_762x51_Mag:6";
};

//Magazine classnames for assistant AR and MMG ammo man roles (these are the extra mags for the machinegunner)
phx_loadout_aar_mag = "rhsusf_200rnd_556x45_mixed_box:5";
phx_loadout_am_mag  = "150Rnd_mas_fra_762x51_Mag:5";

//Light AT
phx_loadout_antitank_weapon = "rhs_weap_m72a7";

//Marksman
if (pRole == ROLE_MK) then {
  phx_loadout_rifle_weapon = "rhs_weap_sr25_ec";
  phx_loadout_rifle_mag    = "rhsusf_20Rnd_762x51_SR25_m62_Mag:4";
  phx_loadout_rifle_optic  = "optic_SOS";
};

//Pilot
if (pRole == ROLE_P) then {
  phx_loadout_rifle_weapon = "arifle_mas_fra_mp7_F";
  phx_loadout_rifle_mag    = "40Rnd_46x30SD_mas_fra_mag:4";
};
