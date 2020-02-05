_glTypes = ["EGLM","M203_GL","M320_GL","GP25Muzzle","AG36Muzzle"];

if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_rifle_weapon = selectRandom ["rhs_weap_ak103_gp25","rhs_weap_ak74m_gp25","rhs_weap_akmn_gp25","rhs_weap_hk416d10_m320","rhs_weap_m16a4_carryhandle_M203","rhs_weap_m4a1_blockII_M203_bk",
  "rhs_weap_mk18_m320","rhs_weap_g36kv_ag36","arifle_Katiba_GL_F","rhs_weap_akm_gp25","arifle_TRG21_GL_F"];

  {
    _glClass = isClass (configFile >> "CfgWeapons" >> phx_loadout_rifle_weapon >> _x);
    if (_glClass) then {
      phx_loadout_rifle_gl_he = (([configFile >> "CfgWeapons" >> phx_loadout_rifle_weapon >> _x >> "magazines", "ARRAY", 0] call CBA_fnc_getConfigEntry) select 0) + ":6";
    };
  } forEach _glTypes;

  phx_loadout_rifle_gl_smoke = "";
  phx_loadout_rifle_gl_flare = "";
} else {
  phx_loadout_rifle_weapon = selectRandom ["arifle_TRG20_F","arifle_Mk20_plain_F","arifle_Katiba_F","arifle_MX_Black_F","SMG_03C_TR_black","srifle_DMR_01_F","rhs_weap_ak103","rhs_weap_ak104",
  "rhs_weap_ak105","rhs_weap_ak74m","rhs_weap_ak74","rhs_weap_ak105_npz","rhs_weap_akmn","rhs_weap_aks74n","rhs_weap_asval_npz","rhs_weap_akm","rhs_weap_hk416d10","rhs_weap_hk416d145",
  "rhs_weap_m16a4_carryhandle","rhs_weap_m27iar","rhs_weap_m4_mstock","rhs_weap_m4a1_blockII","rhs_weap_mk17_STD","rhs_weap_mk18","rhs_weap_SCARH_USA_LB","rhs_weap_kar98k","rhs_weap_l1a1_wood",
  "rhs_weap_m1garand_sa43","rhs_weap_m21a_pr","rhs_weap_m92","rhs_weap_m70b1","rhs_weap_m38_rail","rhs_weap_MP44","rhs_weap_savz58p_rail_black","rhs_weap_vhsd2","rhs_weap_g36kv","rhs_weap_g36c",
  "rhs_weap_m21a_pbg40","rhs_weap_m70b1n","rhs_weap_SCARH_CQC","rhs_weap_m82a1","rhs_weap_mosin_sbr","rhsusf_weap_MP7A2","SMG_03_TR_black","arifle_MXC_Black_F"];
};

if (pRole == ROLE_AR) then {
  phx_loadout_automaticrifle_weapon = selectRandom ["rhs_weap_m249_pip_ris","rhs_weap_mg42","rhs_weap_m84","rhs_weap_pkm","rhs_weap_pkp","rhs_weap_m240G","LMG_Zafir_F","LMG_Mk200_F"];
  phx_loadout_automaticrifle_mag = selectRandom ([phx_loadout_automaticrifle_weapon] call CBA_fnc_compatibleMagazines) + ":9";
};
if (pRole == ROLE_AAR) then {
  phx_loadout_automaticrifle_mag = "";
};
if (pRole == ROLE_MG) then {
  phx_loadout_mmg_weapon = selectRandom ["rhs_weap_m249_pip_ris","rhs_weap_mg42","rhs_weap_m84","rhs_weap_pkm","rhs_weap_pkp","rhs_weap_m240G","LMG_Zafir_F","LMG_Mk200_F"];
  phx_loadout_mmg_mag = selectRandom ([phx_loadout_mmg_weapon] call CBA_fnc_compatibleMagazines) + ":9";
};
if (pRole == ROLE_AM) then {
  phx_loadout_mmg_mag = "";
};
if (pRole == ROLE_RAT) then {
  phx_loadout_antitank_weapon = selectRandom ["rhs_weap_M136","rhs_weap_M136_hedp","rhs_weap_maaws","rhs_weap_rpg26","rhs_weap_rpg7","rhs_weap_m72a7"];
  phx_loadout_antitank_mag = selectRandom ([phx_loadout_antitank_weapon] call CBA_fnc_compatibleMagazines) + ":3";
};
if (pRole == ROLE_AT) then {
  phx_loadout_mediumantitank_weapon = selectRandom ["rhs_weap_fgm148","rhs_weap_maaws","launch_RPG32_green_F","rhs_weap_rpg7"];
  phx_loadout_mediumantitank_mag = selectRandom ([phx_loadout_mediumantitank_weapon] call CBA_fnc_compatibleMagazines) + ":3";
};
if (pRole == ROLE_AAT) then {
  phx_loadout_mediumantitank_mag = "";
};
if (pRole == ROLE_MK) then {
  phx_loadout_rifle_weapon = selectRandom ["arifle_MXM_Black_F","rhs_weap_svdp_npz","rhs_weap_t5000","rhs_weap_vss_npz","rhs_weap_M107","rhs_weap_XM2010","rhs_weap_m24sws","rhs_weap_m40a5",
  "rhs_weap_sr25","rhs_weap_mosin_sbr","srifle_GM6_F","srifle_LRR_F","srifle_EBR_F"];
  phx_loadout_rifle_mag = selectRandom ([phx_loadout_rifle_weapon] call CBA_fnc_compatibleMagazines) + ":9";
  phx_loadout_rifle_optic = "optic_SOS";
};

phx_loadout_rifle_mag = selectRandom ([phx_loadout_rifle_weapon] call CBA_fnc_compatibleMagazines) + ":12";
