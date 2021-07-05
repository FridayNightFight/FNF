#include "WEAPONS_IND.sqf"

//Random guerrilla-style weapons
phx_loadout_rifle_weapon = selectRandom ["rhs_weap_MP44", "rhs_weap_asval", "arifle_TRG20_F", "SMG_03C_black", "rhs_weap_ak103", "rhs_weap_ak74_2", "rhs_weap_ak74m", "rhs_weap_m16a4_carryhandle", "rhs_weap_m14", "rhs_weap_l1a1_wood", "rhs_weap_m21a", "rhs_weap_savz58p", "rhs_weap_savz58v_black"];
if (random 100 > 99) then {phx_loadout_rifle_weapon = "rhs_weap_t5000"};
if (phx_loadout_hasUGL) then {
  phx_loadout_rifle_weapon = selectRandom ["rhs_weap_ak103_gp25", "rhs_weap_ak74_gp25", "rhs_weap_ak74m_gp25", "rhs_weap_akm_gp25", "rhs_weap_akms_gp25", "rhs_weap_aks74_gp25"];
};

if (pRole == ROLE_MK) then {
  phx_loadout_rifle_weapon = selectRandom ["rhs_weap_svds_npz", "rhs_weap_m14_rail"];
};

phx_loadout_rifle_mag_tracer = ([phx_loadout_rifle_weapon] call CBA_fnc_compatibleMagazines select 1) + ":5";
phx_loadout_rifle_mag = ([phx_loadout_rifle_weapon] call CBA_fnc_compatibleMagazines select 0) + ":9";

if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "rhs_weap_m84";
  phx_loadout_rifle_mag = "rhs_100Rnd_762x54mmR:8"; //updated to 8 boxes from 5
};
if (pRole == ROLE_AAR) then {
  phx_loadout_aar_mag = "rhs_100Rnd_762x54mmR:8"; //updated to 8 from 5
};
if (pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "rhs_weap_fnmag";
  phx_loadout_rifle_mag = "rhsusf_100Rnd_762x51:8"; //5 to 8
};
if (pRole == ROLE_AM) then {
  phx_loadout_am_mag = "rhsusf_100Rnd_762x51:8"; //5 to 8
};

phx_loadout_sidearm_weapon = selectRandom ["hgun_Rook40_F", "hgun_P07_F", "hgun_ACPC2_F", "rhs_weap_makarov_pm", "rhsusf_weap_glock17g4", "rhsusf_weap_m1911a1", "rhs_weap_tt33", "rhs_weap_cz99"];
phx_loadout_sidearm_mag = ([phx_loadout_sidearm_weapon] call CBA_fnc_compatibleMagazines select 0) + ":2";

if (pRole == ROLE_RAT) then {
  phx_loadout_antitank_weapon = "rhs_weap_rpg26"; // switched to single shot AT
  phx_loadout_antitank_mag = "rhs_rpg26_mag";
};

phx_selector_weapons = [];
