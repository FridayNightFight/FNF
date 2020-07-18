//Base loadout function call for BLUFOR players - other weapon sets overwrite this

giveBLUFORLoadout = {
  phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:4";
  phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:7";
  phx_loadout_sidearm_weapon = "rhsusf_weap_glock17g4";
  phx_loadout_sidearm_mag = "rhsusf_mag_17Rnd_9x19_JHP:2";
  phx_allowedOptics = ["optic_Holosight_blk_F", "rhsusf_acc_eotech_xps3", "rhsusf_acc_compm4", "rhsusf_acc_T1_high"];
  phx_allowedMagOptics = ["rhsusf_acc_g33_T1", "rhsusf_acc_g33_xps3", "rhsusf_acc_ACOG", "rhsusf_acc_ACOG_RMR", "rhsusf_acc_su230", "rhsusf_acc_su230a", "rhsusf_acc_ELCAN"];
  if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
    phx_loadout_rifle_weapon = "rhs_weap_m4a1_blockII_M203_bk";
    phx_loadout_rifle_gl_he = "1Rnd_HE_Grenade_shell:6";
    phx_loadout_rifle_gl_smoke = "1Rnd_Smoke_Grenade_shell:3";
    phx_loadout_rifle_gl_flare = "UGL_FlareWhite_F:3";
    phx_allowedWeapons = ["rhs_weap_m16a4_carryhandle_M203"];
  } else {
    phx_loadout_rifle_weapon = "rhs_weap_m4a1_blockII_bk";
    phx_allowedWeapons = ["rhs_weap_m16a4_carryhandle"];
  };
  if (pRole == ROLE_AR) then {
    phx_loadout_rifle_weapon = "rhs_weap_m249_pip_L";
    phx_loadout_rifle_mag = "rhsusf_200rnd_556x45_mixed_box:4";
    phx_allowedWeapons = [];
  };
  if (pRole == ROLE_AAR) then {
    phx_loadout_aar_mag = "rhsusf_200rnd_556x45_mixed_box:2";
  };
  if (pRole == ROLE_MG) then {
    phx_loadout_rifle_weapon = "rhs_weap_m240G";
    phx_loadout_rifle_mag = "rhsusf_100Rnd_762x51_m80a1epr:4";
    phx_allowedWeapons = [];
  };
  if (pRole == ROLE_AM) then {
    phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:5";
    phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:4";
    phx_loadout_am_mag = "rhsusf_100Rnd_762x51_m80a1epr:4";
  };
  if (pRole == ROLE_RAT) then {
    phx_loadout_antitank_weapon = "rhs_weap_M136";
    phx_loadout_antitank_mag = "rhs_m136_mag";
  };
  if (pRole == ROLE_AT) then {
    phx_loadout_mediumantitank_weapon = "rhs_weap_fgm148";
    phx_loadout_mediumantitank_optic = "";
    phx_loadout_mediumantitank_mag = "rhs_fgm148_magazine_AT";
    phx_loadout_mediumantitank_mag_1 = "";
  };
  if (pRole == ROLE_AAT) then {
    phx_loadout_mediumantitank_mag = "rhs_fgm148_magazine_AT";
  };
  if (pRole == ROLE_MK) then {
    phx_loadout_rifle_weapon = "rhs_weap_sr25";
    phx_loadout_rifle_mag = "rhsusf_20Rnd_762x51_SR25_m62_Mag:4";
    phx_loadout_rifle_optic = "optic_SOS";
    phx_allowedWeapons = [];
    phx_allowedOptics = [];
    phx_allowedMagOptics = [];
  };
  if (pRole == ROLE_P) then {
    phx_loadout_rifle_weapon = "rhs_weap_hk416d10";
    phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:4";
    phx_allowedWeapons = [];
  };
};
