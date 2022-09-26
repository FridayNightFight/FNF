// GEAR
#define GRUNT_MEDICAL "FirstAidKit:4"
#define MEDIC_MEDICAL "ACE_fieldDressing:32","ACE_morphine:16","ACE_epinephrine:8","ACE_tourniquet:4","ACE_bloodIV_500:12","ACE_bloodIV_250:4","ACE_personalAidKit"
#define LINKED "ItemMap","ItemCompass","ItemWatch","ItemGPS","TFAR_microdagr"
#define VN_B_LINKED_SOG "vn_b_item_map","vn_b_item_compass_sog","vn_b_item_watch"
#define VN_B_LINKED "vn_b_item_map","vn_b_item_compass","vn_b_item_watch"
#define VN_O_LINKED "vn_o_item_map","vn_b_item_compass","vn_b_item_watch"
#define TOOLS "ACE_MapTools"
#define LEADER_TOOLS "ACE_microDAGR"
#define SPOTTER_TOOLS "ACE_SpottingScope"
#define SNIPER_TOOLS "ACE_Tripod","ACE_RangeCard"
#define TRIPOD "ACE_Tripod"
#define SHOVEL "ACE_EntrenchingTool"

#define SMOKE_GRENADES "SmokeShell:2"
#define FRAG_GRENADES "rhs_mag_m67:2"
#define BASE_GRENADES FRAG_GRENADES,SMOKE_GRENADES
#define MEDIC_SMOKES "SmokeShellBlue:2"
#define LEADER_SMOKES "SmokeShellGreen:2","SmokeShellPurple:2","SmokeShellRed:2"
#define MARKING_SMOKES "rhs_mag_m713_Red:3","rhs_mag_m716_yellow:2","rhs_GRD40_Red:4","rhs_GRD40_Green:2"

#define VN_B_FRAG_GRENADES "vn_m61_grenade_mag:2"
#define VN_B_SMOKE_GRENADES "vn_m18_white_mag:2"
#define VN_B_BASE_GRENADES VN_B_FRAG_GRENADES,VN_B_SMOKE_GRENADES
#define VN_O_FRAG_GRENADES "vn_t67_grenade_mag:2"
#define VN_O_SMOKE_GRENADES "vn_rdg2_mag:2"
#define VN_O_BASE_GRENADES VN_O_FRAG_GRENADES,VN_O_SMOKE_GRENADES
#define VN_MEDIC_SMOKES "vn_m18_purple_mag:3"
#define VN_LEADER_SMOKES "vn_m18_green_mag:2","vn_m18_red_mag:2","vn_m18_yellow_mag:2"

#define HUNTIR_MONITOR "ACE_HuntIR_monitor:1"
#define BASE_UGL_HUNTIR ACE_HuntIR_M203

#define CE_TRIGGER "ACE_M26_Clacker"
#define CE_DEFUSE "ACE_DefusalKit"
#define CE_DETECTOR "MineDetector"
#define CE_FORTIFYTOOL "ACE_Fortify"
#define CE_FRAG_GRENADES "2x Frag grenades", "rhs_mag_m67:2"
#define CE_INCEN_GRENADES "2x Thermite grenades", "ACE_M14:2"
#define CE_SATCHEL "2x Satchel", "SatchelCharge_Remote_Mag:2"
#define CE_MINEAP "2x AP mine, 2x flare mine","APERSTripMine_Wire_Mag:2","rhs_mine_sm320_red_mag:2"
#define CE_MINEAT "2x AT mine", "ATMine_Range_Mag:2"
#define CE_DEMOCHARGE "4x Demo charge", "DemoCharge_Remote_Mag:4"

#define VN_B_CE_FRAG_GRENADES "2x Frag grenades",VN_B_FRAG_GRENADES
#define VN_B_CE_WP_GRENADES "2x WP Grenades", "vn_m34_grenade_mag:2"
#define VN_O_CE_FRAG_GRENADES "2x Frag grenades",VN_O_FRAG_GRENADES
#define VN_O_CE_INCEN_GRENADES "2x Molotov cocktails", "vn_molotov_grenade_mag:2"

#define VN_CE_SATCHEL "2x Satchel", "vn_mine_satchel_remote_02_mag:2"
#define VN_B_MINEAP "2x AP pressure plate mine, 2x flare mine","vn_mine_m16_mag:2","rhs_mine_sm320_red_mag:2"
#define VN_O_MINEAP "2x AP pressure plate mine, 2x flare mine","vn_mine_m14_mag:2","rhs_mine_sm320_red_mag:2"
#define VN_B_MINEAT "2x AT pressure plate mine", "vn_mine_m15_mag:2"
#define VN_O_MINEAT "2x AT pressure plate mine", "vn_mine_tm57_mag:2"
#define VN_O_MINEAT_TRIPWIRE "2x AT tripwire mine", "vn_mine_tripwire_arty_mag:2"
#define VN_CE_DEMOCHARGE "4x Demo charge", "vn_mine_m112_remote_mag:4"

#define VN_BINOCULARS "vn_mk21_binocs"

// AT Launchers
// [launcher,[mags],[optics]]
// #define HALF_AMMO(_count) __EVAL((_count) / (2));
// classname,magazines,optics,reloadable,shortname
#define STRINGIFY(s) #s
#define M72LAW(_count) {"rhs_weap_m72a7",{},{},"DISPOSABLE","M72"}
#define AT4(_count) {"rhs_weap_M136",{},{},"DISPOSABLE","AT4"}
#define RPG26(_count) {"rhs_weap_rpg26",{},{},"DISPOSABLE","RPG26"}

#define CARLG(_HEATCount,_HECount) {"rhs_weap_maaws",{STRINGIFY(rhs_mag_maaws_HEAT:_HEATCount),STRINGIFY(rhs_mag_maaws_HE:_HECount)},{"rhs_optic_maaws"},"RELOAD","CARLG"}
#define SMAW(_HEATCount,_HECount) {"rhs_weap_smaw_green",{STRINGIFY(rhs_mag_smaw_HEAA:_HEATCount),STRINGIFY(rhs_mag_smaw_HEDP:_HECount)},{"rhs_weap_optic_smaw"},"RELOAD","SMAW"}
#define M80(_count) {"rhs_weap_m80",{},{},"DISPOSABLE","M80"}
#define RPG32(_HEATCount,_HECount) {"launch_RPG32_green_F",{STRINGIFY(RPG32_F:_HEATCount),STRINGIFY(RPG32_HE_F:_HECount)},{},"RELOAD","RPG32"}
#define RPG7(_HEATCount,_HECount) {"rhs_weap_rpg7",{STRINGIFY(rhs_rpg7_PG7VL_mag:_HEATCount),STRINGIFY(rhs_rpg7_OG7V_mag:_HECount)},{"rhs_acc_pgo7v3"},"RELOAD","RPG7"}

#define TITAN(_count) {"launch_I_Titan_short_F",{STRINGIFY(Titan_AT:_count)},{},"RELOAD","TITAN"}
#define JAVELIN(_count) {"rhs_weap_fgm148",{STRINGIFY(rhs_fgm148_magazine_AT:_count)},{},"RELOAD","JAVELIN"}
#define NLAW(_count) {"ACE_launch_NLAW_ready_F",{},{},"DISPOSABLE","NLAW"}
#define METIS(_count) {"launch_O_Vorona_green_F",{STRINGIFY(Vorona_HEAT:_count)},{},"RELOAD","METIS"}

#define STINGER(_count) {"rhs_weap_fim92",{STRINGIFY(rhs_fim92_mag:_count)},{},"RELOAD","STINGER"}
#define IGLA(_count) {"rhs_weap_igla",{STRINGIFY(rhs_mag_9k38_rocket:_count)},{},"RELOAD","IGLA"}

#define VN_LAW(_count) {"vn_m72",{STRINGIFY(vn_m72_mag:_count)},{},"DISPOSABLE","M72"}
#define VN_RPG7(_count) {"vn_rpg7",{STRINGIFY(vn_rpg7_mag:_count)},{},"RELOAD","RPG7"}
#define VN_STRELA(_count) {"vn_sa7",{STRINGIFY(vn_sa7_mag:_count)},{},"RELOAD","STRELA"}


// CONDITIONALS -- references here used in SQF based on variables set in config.sqf
class common {
  NVG = "ACE_NVG_Gen4";
  thermalImager = "ACE_MX2A";
  mortarGear[] = {"ACE_artilleryTable"};

  class binoculars {
    standard = "Binocular";
    rangefinder = "Rangefinder";
    vector21 = "ACE_VectorDay";
  };
};

// OPTICS
#define STD_OPTICS "optic_Holosight_blk_F", "rhsusf_acc_eotech_xps3", "rhsusf_acc_compm4", "rhsusf_acc_T1_high", "rhs_acc_1p63", "rhs_acc_ekp1", "rhs_acc_ekp8_02", "rhs_acc_okp7_dovetail", "rhs_acc_pkas"
#define MAG_OPTICS "rhsusf_acc_ACOG", "rhsusf_acc_ACOG_RMR", "rhsusf_acc_su230", "rhsusf_acc_su230_mrds", "rhsusf_acc_su230a", "rhsusf_acc_su230a_mrds", "optic_MRCO", "optic_Hamr", "optic_Arco_blk_F", "rhsusf_acc_ELCAN", "rhs_acc_1p29", "rhs_acc_1p78", "rhs_acc_nita", "rhs_acc_pso1m2_ak", "uk3cb_optic_artel_m14"
#define SNP_OPTICS "rhsusf_acc_M8541", "rhsusf_acc_M8541_wd"
#define STD_VN_OPTICS
#define MAG_VN_OPTICS "vn_o_4x_m16","vn_o_4x_m4956","vn_o_3x_m84","vn_o_3x_m9130"
// "vn_o_9x_m16","vn_o_9x_m14"
#define SNP_VN_OPTICS "vn_o_9x_m40a1","vn_o_3x_m9130"
#define SNP_VN_NVG_OPTICS "vn_o_anpvs2_m40a1"

class optics {
  standard[] = {STD_OPTICS,STD_VN_OPTICS};
  magnified[] = {STD_OPTICS,STD_VN_OPTICS,MAG_OPTICS,MAG_VN_OPTICS};
  sniper[] = {SNP_OPTICS,SNP_VN_OPTICS};
  sniperNVG[] = {SNP_OPTICS,SNP_VN_NVG_OPTICS};
};

// FUNCTIONS
#define SAM_GEAR(BACKPACK,MAG) backpack[] = {BACKPACK}; backpackItems[] = {}; magazines[] += {MAG}; items[] += {BASE_MEDICAL};
#define MORTAR_GEAR(BACKPACK) backpack[] = {BACKPACK}; items[] += {BASE_ARTILLERY};
