#include "cfgLoadouts.hpp"

giveBLUFORLoadout = {
  phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:4";
  phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:7";
  if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
    phx_loadout_rifle_weapon = "rhs_weap_m4a1_blockII_M203_bk";
    phx_loadout_rifle_gl_he = "1Rnd_HE_Grenade_shell:6";
    phx_loadout_rifle_gl_smoke = "1Rnd_Smoke_Grenade_shell:3";
    phx_loadout_rifle_gl_flare = "UGL_FlareWhite_F:3";
    phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:7";
    phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:4";
  } else { phx_loadout_rifle_weapon = "rhs_weap_m4a1_blockII_bk"; };
  if (pRole == ROLE_AR) then {
    phx_loadout_automaticrifle_weapon = "rhs_weap_m249_pip_L";
    phx_loadout_automaticrifle_mag = "rhsusf_200rnd_556x45_mixed_box:4";
  };
  if (pRole == ROLE_AAR) then {
    phx_loadout_automaticrifle_mag = "rhsusf_200rnd_556x45_mixed_box:2";
  };
  if (pRole == ROLE_MG) then {
    phx_loadout_mmg_weapon = "rhs_weap_m240G";
    phx_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m80a1epr:4";
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
  };
  phx_loadout_flare = "rhs_weap_rsp30_white:3";
};

giveOPFORLoadout = {
  phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green:4";
  phx_loadout_rifle_mag = "rhs_30Rnd_545x39_AK:7";
  if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
    phx_loadout_rifle_weapon = "rhs_weap_ak74m_gp25";
    phx_loadout_rifle_gl_he = "rhs_VOG25:6";
    phx_loadout_rifle_gl_smoke = "rhs_GRD40_White:3";
    phx_loadout_rifle_gl_flare = "rhs_VG40OP_white:3";
    phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green:7";
    phx_loadout_rifle_mag = "rhs_30Rnd_545x39_AK:4";
    _nightvision = "phx_loadout_nightvision" call BIS_fnc_getParamValue;
    if (_nightvision isEqualTo 1 || _nightvision isEqualTo 2) then {
      phx_loadout_rifle_weapon = "rhs_weap_ak74mr_gp25";
    };
  } else { phx_loadout_rifle_weapon = "rhs_weap_ak74m"; };
  if (pRole == ROLE_AR) then {
    phx_loadout_automaticrifle_weapon = "rhs_weap_pkm";
    phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR_green:5";
  };
  if (pRole == ROLE_AAR) then {
    phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR_green:4";
  };
  if (pRole == ROLE_MG) then {
    phx_loadout_mmg_weapon = "rhs_weap_pkp";
    phx_loadout_mmg_mag = "rhs_100Rnd_762x54mmR_green:4";
  };
  if (pRole == ROLE_AM) then {
    phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green:5";
    phx_loadout_rifle_mag = "rhs_30Rnd_545x39_AK:4";
    phx_loadout_mmg_mag = "rhs_100Rnd_762x54mmR_green:4";
  };
  if (pRole == ROLE_RAT) then {
    phx_loadout_antitank_weapon = "rhs_weap_rpg7";
    phx_loadout_antitank_mag = "rhs_rpg7_PG7VL_mag";
  };
  if (pRole == ROLE_AT) then {
    phx_loadout_mediumantitank_weapon = "launch_RPG32_green_F";
    phx_loadout_mediumantitank_mag = "RPG32_F:1";
  };
  if (pRole == ROLE_AAT) then {
    phx_loadout_mediumantitank_mag = "RPG32_F";
  };
  if (pRole == ROLE_MK) then {
    phx_loadout_rifle_weapon = "rhs_weap_svdp_npz";
    phx_loadout_rifle_mag = "ACE_10Rnd_762x54_Tracer_mag:9";
    phx_loadout_rifle_optic = "optic_SOS";
  };
  phx_loadout_flare = "rhs_weap_rsp30_white:3";
};

giveINDFORLoadout = {
  phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green:4";
  phx_loadout_rifle_mag = "rhs_30Rnd_545x39_AK:7";
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
  };
  if (pRole == ROLE_AT) then {
    phx_loadout_mediumantitank_weapon = "launch_RPG32_green_F";
    phx_loadout_mediumantitank_mag = "RPG32_F:2";
  };
  if (pRole == ROLE_AAT) then {
    phx_loadout_mediumantitank_mag = "RPG32_F";
  };
  if (pRole == ROLE_MK) then {
    phx_loadout_rifle_weapon = "rhs_weap_svds_npz";
    phx_loadout_rifle_mag = "ACE_10Rnd_762x54_Tracer_mag:8";
    phx_loadout_rifle_optic = "optic_SOS";
  };
  phx_loadout_flare = "rhs_weap_rsp30_white:3";
};

switch (pWeapons) do {
    case WEAPONS_M4A1_BLOCK_M249_M240G_M136_GUST: {
        [] call giveBLUFORLoadout;
    };
    case WEAPONS_M16A4_M249_M240G_M136_GUST: {
        [] call giveBLUFORLoadout;
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_rifle_weapon = "rhs_weap_m16a4_carryhandle_M203";
        } else { phx_loadout_rifle_weapon = "rhs_weap_m16a4_carryhandle"; };
        if (pRole == ROLE_MK) then {
          phx_loadout_rifle_weapon = "rhs_weap_sr25";
          phx_loadout_rifle_mag = "rhsusf_20Rnd_762x51_SR25_m62_Mag:4";
          phx_loadout_rifle_optic = "optic_SOS";
        };
    };
    case WEAPONS_AK74M_PKM_PKP_RPG7_RPG32: {
        [] call giveOPFORLoadout;
    };
    case WEAPONS_MX_STONER_MXSW_RPG32_TITAN: {
      phx_loadout_rifle_mag_tracer = "30Rnd_65x39_caseless_mag_Tracer:4";
      phx_loadout_rifle_mag = "30Rnd_65x39_caseless_mag:7";
      if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
        phx_loadout_rifle_weapon = "arifle_MX_GL_Black_F";
        phx_loadout_rifle_gl_he = "1Rnd_HE_Grenade_shell:6";
        phx_loadout_rifle_gl_smoke = "1Rnd_Smoke_Grenade_shell:3";
        phx_loadout_rifle_gl_flare = "UGL_FlareWhite_F:3";
        phx_loadout_rifle_mag_tracer = "30Rnd_65x39_caseless_mag_Tracer:7";
        phx_loadout_rifle_mag = "30Rnd_65x39_caseless_mag:4";
      } else { phx_loadout_rifle_weapon = "arifle_MX_Black_F"; };
      if (pRole == ROLE_AR) then {
        phx_loadout_automaticrifle_weapon = "arifle_MX_SW_Black_F";
        phx_loadout_automaticrifle_mag = "100Rnd_65x39_caseless_mag_Tracer:6";
      };
      if (pRole == ROLE_AAR) then {
        phx_loadout_automaticrifle_mag = "100Rnd_65x39_caseless_mag_Tracer:3";
      };
      if (pRole == ROLE_MG) then {
        phx_loadout_mmg_weapon = "LMG_Zafir_F";
        phx_loadout_mmg_mag = "150Rnd_762x54_Box_Tracer:6";
      };
      if (pRole == ROLE_AM) then {
        phx_loadout_rifle_mag_tracer = "30Rnd_65x39_caseless_mag_Tracer:5";
        phx_loadout_rifle_mag = "30Rnd_65x39_caseless_mag:4";
        phx_loadout_mmg_mag = "150Rnd_762x54_Box_Tracer:3";
      };
      if (pRole == ROLE_RAT) then {
        phx_loadout_antitank_weapon = "launch_RPG32_F";
        phx_loadout_antitank_mag = "RPG32_F";
      };
      if (pRole == ROLE_AT) then {
        phx_loadout_mediumantitank_weapon = "launch_I_Titan_short_F";
        phx_loadout_mediumantitank_mag = "Titan_AT:1";
      };
      if (pRole == ROLE_AAT) then {
        phx_loadout_mediumantitank_mag = "Titan_AT";
      };
      if (pRole == ROLE_MK) then {
        phx_loadout_rifle_weapon = "arifle_MXM_Black_F";
        phx_loadout_rifle_mag = "30Rnd_65x39_caseless_mag_Tracer:4";
        phx_loadout_rifle_optic = "optic_SOS";
      };
      phx_loadout_flare = "ACE_HandFlare_White:3";
    };
    case WEAPONS_KATIBA_ZAFIR_LYNX_RPG32_TITAN:{
      phx_loadout_rifle_mag_tracer = "30Rnd_65x39_caseless_green_mag_Tracer:4";
      phx_loadout_rifle_mag = "30Rnd_65x39_caseless_green:7";
      if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
        phx_loadout_rifle_weapon = "arifle_Katiba_GL_F";
        phx_loadout_rifle_gl_he = "1Rnd_HE_Grenade_shell:6";
        phx_loadout_rifle_gl_smoke = "1Rnd_Smoke_Grenade_shell:3";
        phx_loadout_rifle_gl_flare = "UGL_FlareWhite_F:3";
        phx_loadout_rifle_mag_tracer = "30Rnd_65x39_caseless_green_mag_Tracer:7";
        phx_loadout_rifle_mag = "30Rnd_65x39_caseless_green:4";
      } else { phx_loadout_rifle_weapon = "arifle_Katiba_F"; };
      if (pRole == ROLE_AR) then {
        phx_loadout_automaticrifle_weapon = "LMG_Zafir_F";
        phx_loadout_automaticrifle_mag = "150Rnd_762x54_Box_Tracer:6";
      };
      if (pRole == ROLE_AAR) then {
        phx_loadout_automaticrifle_mag = "150Rnd_762x54_Box_Tracer:3";
      };
      if (pRole == ROLE_MG) then {
        phx_loadout_mmg_weapon = "LMG_Zafir_F";
        phx_loadout_mmg_mag = "150Rnd_762x54_Box_Tracer:6";
      };
      if (pRole == ROLE_AM) then {
        phx_loadout_rifle_mag_tracer = "30Rnd_65x39_caseless_green_mag_Tracer:5";
        phx_loadout_rifle_mag = "30Rnd_65x39_caseless_green:4";
        phx_loadout_mmg_mag = "150Rnd_762x54_Box_Tracer:3";
      };
      if (pRole == ROLE_RAT) then {
        phx_loadout_antitank_weapon = "launch_RPG32_F";
        phx_loadout_antitank_mag = "RPG32_F";
      };
      if (pRole == ROLE_AT) then {
        phx_loadout_mediumantitank_weapon = "launch_O_Titan_short_F";
        phx_loadout_mediumantitank_mag = "Titan_AT:1";
      };
      if (pRole == ROLE_AAT) then {
        phx_loadout_mediumantitank_mag = "Titan_AT";
      };
      if (pRole == ROLE_MK) then {
        phx_loadout_rifle_weapon = "srifle_GM6_camo_F";
        phx_loadout_rifle_mag = "5Rnd_127x108_Mag:5";
        phx_loadout_rifle_optic = "optic_SOS";
      };
      phx_loadout_flare = "ACE_HandFlare_White:3";
    };
    case WEAPONS_KAR98K_PKM_MG42_RPG26_RPG7: {
      phx_loadout_rifle_mag_tracer = "";
      phx_loadout_rifle_mag = "rhsgref_5Rnd_792x57_kar98k:10";
      phx_loadout_rifle_weapon = "rhs_weap_kar98k";
      if (pRole == ROLE_AR) then {
        phx_loadout_automaticrifle_weapon = "rhs_weap_pkm";
        phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR_green:4";
      };
      if (pRole == ROLE_AAR) then {
        phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR_green:3";
      };
      if (pRole == ROLE_MG) then {
        phx_loadout_mmg_weapon = "rhs_weap_mg42";
        phx_loadout_mmg_mag = "rhsgref_296Rnd_792x57_SmE_belt:2";
      };
      if (pRole == ROLE_AM) then {
        phx_loadout_mmg_mag = "rhsgref_296Rnd_792x57_SmE_belt:2";
      };
      if (pRole == ROLE_RAT) then {
        phx_loadout_antitank_weapon = "rhs_weap_rpg26";
        phx_loadout_antitank_mag = "";
      };
      if (pRole == ROLE_CE) then {
        phx_loadout_explosives = "IEDUrbanBig_Remote_Mag:2";
        phx_loadout_explosives_1 = "APERSTripMine_Wire_Mag";
      };
      if (pRole == ROLE_AT) then {
        phx_loadout_mediumantitank_weapon = "rhs_weap_rpg7";
        phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7V_mag:3";
      };
      if (pRole == ROLE_AAT) then {
        phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7V_mag:2";
      };
      if (pRole == ROLE_MK) then {
        phx_loadout_rifle_weapon = "rhs_weap_m76";
        phx_loadout_rifle_mag = "rhssaf_10Rnd_792x57_m76_tracer:5";
        phx_loadout_rifle_optic = "rhs_acc_pso1m2";
      };
      phx_loadout_flare = "ACE_HandFlare_White:3";
    };
    case WEAPONS_SCARH_MK18320_SAW_M240_M136_GUST:{
      phx_loadout_rifle_mag_tracer = "rhs_mag_20Rnd_SCAR_762x51_m62_tracer_bk:4";
      phx_loadout_rifle_mag = "rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk:7";
      if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
        phx_loadout_rifle_weapon = "rhs_weap_mk18_m320";
        phx_loadout_rifle_gl_he = "1Rnd_HE_Grenade_shell:6";
        phx_loadout_rifle_gl_smoke = "1Rnd_Smoke_Grenade_shell:3";
        phx_loadout_rifle_gl_flare = "UGL_FlareWhite_F:3";
        phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:7";
        phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:4";
      } else { phx_loadout_rifle_weapon = "rhs_weap_mk17_STD"; };
      if (pRole == ROLE_AR) then {
        phx_loadout_automaticrifle_weapon = "rhs_weap_m249_pip_L";
        phx_loadout_automaticrifle_mag = "rhsusf_200rnd_556x45_mixed_box:4";
      };
      if (pRole == ROLE_AAR) then {
        phx_loadout_automaticrifle_mag = "rhsusf_200rnd_556x45_mixed_box:2";
      };
      if (pRole == ROLE_MG) then {
        phx_loadout_mmg_weapon = "rhs_weap_m240G";
        phx_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m80a1epr:4";
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
      };
      phx_loadout_flare = "rhs_weap_rsp30_white:3";
    };
    case WEAPONS_UNARMED: {
        phx_loadout_rifle_weapon = "";
        phx_loadout_rifle_gl_weapon = "";
        phx_loadout_rifle_mag = "";
        phx_loadout_rifle_mag_tracer = "";
        phx_loadout_rifle_gl_he = "";
        phx_loadout_rifle_gl_smoke = "";
        phx_loadout_rifle_gl_flare = "";
        phx_loadout_automaticrifle_weapon = "";
        phx_loadout_automaticrifle_mag = "";
        phx_loadout_mmg_weapon = "";
        phx_loadout_mmg_mag = "";
        phx_loadout_antitank_weapon = "";
        phx_loadout_antitank_mag = "";
        phx_loadout_mediumantitank_weapon = "";
        phx_loadout_mediumantitank_mag = "";
        phx_loadout_cuffs = "";
        phx_loadout_smoke = "";
        phx_loadout_flare = "";
        phx_loadout_defusalkit = "";
        phx_loadout_trigger = "";
        phx_loadout_entrenching = "";
        phx_loadout_grenade = "";
        phx_loadout_explosives = "";
    };
    default {};
};

if (pRole == ROLE_P) then {
  phx_loadout_rifle_weapon = "hgun_PDW2000_F";
  phx_loadout_rifle_mag = "30Rnd_9x21_Mag:3";
};
