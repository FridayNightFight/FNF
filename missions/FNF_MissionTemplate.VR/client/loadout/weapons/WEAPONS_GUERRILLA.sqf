#include "..\cfgLoadouts.hpp"

//Random guerrilla-style weapons

phx_loadout_rifle_weapon = selectRandom ["rhs_weap_akmn", "rhs_weap_ak103", "rhs_weap_ak74n", "rhs_weap_ak74_2", "rhs_weap_ak74m", "rhs_weap_aks74n", "rhs_weap_m16a4_carryhandle", "rhs_weap_m14", "rhs_weap_m4_carryhandle", "rhs_weap_l1a1_wood", "rhs_weap_m21s", "rhs_weap_m70b1", "rhs_weap_savz58p", "rhs_weap_savz58v_black", "rhs_weap_m70b3n"];
if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_rifle_weapon = selectRandom ["rhs_weap_ak103_gp25", "rhs_weap_ak74_gp25", "rhs_weap_ak74m_gp25", "rhs_weap_ak74n_gp25", "rhs_weap_ak74n_2_gp25", "rhs_weap_akm_gp25", "rhs_weap_akmn_gp25", "rhs_weap_akms_gp25", "rhs_weap_aks74_gp25", "rhs_weap_aks74n_gp25"];
};

phx_allowedOptics = ["rhs_acc_1p63", "rhs_acc_ekp1", "rhs_acc_ekp8_02", "rhs_acc_okp7_dovetail", "rhs_acc_pkas", "optic_Holosight_blk_F", "rhsusf_acc_eotech_xps3", "rhsusf_acc_compm4", "rhsusf_acc_T1_high"];
phx_allowedMagOptics = ["rhs_acc_1p29", "rhs_acc_1p78", "rhs_acc_nita", "rhs_acc_pso1m2_ak", "rhsusf_acc_g33_T1", "rhsusf_acc_g33_xps3", "rhsusf_acc_ACOG", "rhsusf_acc_ACOG_RMR", "rhsusf_acc_su230", "rhsusf_acc_su230a", "rhsusf_acc_ELCAN"];
phx_allowedWeapons = [];

if (pRole == ROLE_MK) then {
  phx_loadout_rifle_weapon = selectRandom ["rhs_weap_svds_npz", "rhs_weap_m14_rail", "rhs_weap_m24sws", "rhs_weap_SCARH_LB"];
  phx_allowedOptics = [];
  phx_allowedMagOptics = [];
};

phx_loadout_rifle_mag_tracer = ([phx_loadout_rifle_weapon] call CBA_fnc_compatibleMagazines select 1) + ":3";
phx_loadout_rifle_mag = ([phx_loadout_rifle_weapon] call CBA_fnc_compatibleMagazines select 0) + ":6";

if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "rhs_weap_pkm";
  phx_loadout_rifle_mag = "rhs_100Rnd_762x54mmR_green:5";
};
if (pRole == ROLE_AAR) then {
  phx_loadout_aar_mag = "rhs_100Rnd_762x54mmR_green:4";
};
if (pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "rhs_weap_pkp";
  phx_loadout_rifle_mag = "rhs_100Rnd_762x54mmR_green:5";
};
if (pRole == ROLE_AM) then {
  phx_loadout_am_mag = "rhs_100Rnd_762x54mmR_green:4";
};

phx_loadout_sidearm_weapon = selectRandom ["hgun_Rook40_F", "hgun_P07_F", "hgun_ACPC2_F", "rhs_weap_makarov_pm", "rhsusf_weap_glock17g4", "rhsusf_weap_m1911a1", "rhs_weap_tt33", "rhs_weap_cz99", "rhs_weap_savz61_folded"];
phx_loadout_sidearm_mag = ([phx_loadout_sidearm_weapon] call CBA_fnc_compatibleMagazines select 0) + ":2";

phx_loadout_rifle_gl_he = "rhs_VOG25:6";
phx_loadout_rifle_gl_smoke = "rhs_GRD40_White:3";
phx_loadout_rifle_gl_flare = "rhs_VG40OP_white:3";

if (pRole == ROLE_RAT) then {
  phx_loadout_antitank_weapon = "rhs_weap_rpg7";
  phx_loadout_antitank_mag = "rhs_rpg7_PG7VL_mag";
  phx_loadout_antitank_mag_1 = "rhs_rpg7_PG7VR_mag";
};

phx_loadout_rifle_optic = "optic_SOS"; //Only used by marksman role
