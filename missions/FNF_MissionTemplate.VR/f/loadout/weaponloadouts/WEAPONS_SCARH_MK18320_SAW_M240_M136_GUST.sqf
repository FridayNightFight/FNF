phx_loadout_rifle_mag_tracer = "rhs_mag_20Rnd_SCAR_762x51_m62_tracer_bk:4";
phx_loadout_rifle_mag = "rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk:7";
if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_rifle_weapon = "rhs_weap_mk18_m320";
  phx_loadout_rifle_gl_he = "1Rnd_HE_Grenade_shell:6";
  phx_loadout_rifle_gl_smoke = "1Rnd_Smoke_Grenade_shell:3";
  phx_loadout_rifle_gl_flare = "UGL_FlareWhite_F:3";
  phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:7";
  phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:4";
  allowedWeapons = ["rhs_weap_m4a1_blockII_M203_d","rhs_weap_m4a1_blockII_M203_wd","rhs_weap_hk416d10_m320","rhs_weap_hk416d145_m320"];
} else {
  phx_loadout_rifle_weapon = "rhs_weap_mk17_STD";
  allowedWeapons = ["rhs_weap_SCARH_CQC","rhs_weap_SCARH_FDE_CQC","rhs_weap_SCARH_STD","rhs_weap_SCARH_FDE_STD","rhs_weap_SCARH_LB","rhs_weap_SCARH_FDE_LB"];
};
if (pRole == ROLE_AR) then {
  phx_loadout_automaticrifle_weapon = "rhs_weap_m249_pip_L";
  phx_loadout_automaticrifle_mag = "rhsusf_200rnd_556x45_mixed_box:4";
  allowedWeapons = [phx_loadout_automaticrifle_weapon];
};
if (pRole == ROLE_AAR) then {
  phx_loadout_automaticrifle_mag = "rhsusf_200rnd_556x45_mixed_box:2";
};
if (pRole == ROLE_MG) then {
  phx_loadout_mmg_weapon = "rhs_weap_m240G";
  phx_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m80a1epr:4";
  allowedWeapons = [phx_loadout_mmg_weapon];
};
if (pRole == ROLE_AM) then {
  phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:5";
  phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:4";
  phx_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m80a1epr:4";
};
if (pRole == ROLE_RAT) then {
  phx_loadout_antitank_weapon = "rhs_weap_M136_hedp";
  phx_loadout_antitank_mag = "rhs_m136_hedp_mag";
};
if (pRole == ROLE_AT) then {
  phx_loadout_mediumantitank_weapon = "rhs_weap_maaws";
  phx_loadout_mediumantitank_optic = "rhs_optic_maaws";
  phx_loadout_mediumantitank_mag = "rhs_mag_maaws_HEAT:1";
};
if (pRole == ROLE_AAT) then {
  phx_loadout_mediumantitank_mag = "rhs_mag_maaws_HEAT";
};
if (pRole == ROLE_MK) then {
  phx_loadout_rifle_weapon = "rhs_weap_sr25";
  phx_loadout_rifle_mag = "rhsusf_20Rnd_762x51_SR25_m62_Mag:4";
  phx_loadout_rifle_optic = "optic_SOS";
  allowedWeapons = [phx_loadout_rifle_weapon];
};
phx_loadout_flare = "rhs_weap_rsp30_white:3";
