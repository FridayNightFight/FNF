giveINDFORLoadout = {
  phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green:4";
  phx_loadout_rifle_mag = "rhs_30Rnd_545x39_AK:7";
  phx_loadout_sidearm_weapon = "hgun_P07_F";
  phx_loadout_sidearm_mag = "16Rnd_9x21_Mag:2";
  if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
    phx_loadout_rifle_weapon = "rhs_weap_ak74m_gp25";
    phx_loadout_rifle_gl_he = "rhs_VOG25:6";
    phx_loadout_rifle_gl_smoke = "rhs_GRD40_White:3";
    phx_loadout_rifle_gl_flare = "rhs_VG40OP_white:3";
    phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green:7";
    phx_loadout_rifle_mag = "rhs_30Rnd_545x39_AK:4";
  } else { phx_loadout_rifle_weapon = "rhs_weap_ak74m"; };
  if (pRole == ROLE_AR) then {
    phx_loadout_automaticrifle_weapon = "rhs_weap_pkm";
    phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR_green:3";
  };
  if (pRole == ROLE_AAR) then {
    phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR_green:3";
  };
  if (pRole == ROLE_MG) then {
    phx_loadout_mmg_weapon = "rhs_weap_pkp";
    phx_loadout_mmg_mag = "rhs_100Rnd_762x54mmR_green:3";
  };
  if (pRole == ROLE_AM) then {
    phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green:5";
    phx_loadout_rifle_mag = "rhs_30Rnd_545x39_AK:4";
    phx_loadout_mmg_mag = "rhs_100Rnd_762x54mmR_green:4";
  };
  if (pRole == ROLE_RAT) then {
    phx_loadout_antitank_weapon = "rhs_weap_rpg7";
    phx_loadout_antitank_mag = "rhs_rpg7_PG7VL_mag";
    phx_loadout_antitank_mag_1 = "rhs_rpg7_PG7VR_mag";
  };
  if (pRole == ROLE_AT) then {
    phx_loadout_mediumantitank_weapon = "rhs_weap_rpg7";
    phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7VR_mag:2";
    phx_loadout_mediumantitank_mag_1 = "rhs_rpg7_PG7VL_mag:2";
    phx_loadout_mediumantitank_optic = "rhs_acc_pgo7v3";
  };
  if (pRole == ROLE_AAT) then {
    phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7V_mag:2";
  };
  if (pRole == ROLE_MK) then {
    phx_loadout_rifle_weapon = "rhs_weap_svds_npz";
    phx_loadout_rifle_mag = "ACE_10Rnd_762x54_Tracer_mag:8";
    phx_loadout_rifle_optic = "optic_SOS";
  };
  phx_loadout_flare = "rhs_weap_rsp30_white:3";
};
