#define destroy "destroy"
#define uplink "uplink"
#define rush "rush"
#define connection "connection"
#define captureTheFlag "captureTheFlag"
#define adSector "adSector"
#define neutralSector "neutralSector"
#define scavHunt "scavHunt"
#define assassin "assassin"

// AT Launchers
// [launcher,[mags],[optics]]
// keep this in sync with \description\KITS\GEAR\common.hpp
// #define HALF_AMMO(_count) __EVAL((_count) / (2));
// classname,magazines,optics,reloadable,shortname
#define STRINGIFY(s) #s
#define M72LAW(_count) ["rhs_weap_m72a7",[],[],"DISPOSABLE","M72"]
#define RPG26(_count) ["rhs_weap_rpg26",[],[],"DISPOSABLE","RPG26"]

#define CARLG(_HEATCount,_HECount) ["rhs_weap_maaws",[STRINGIFY(rhs_mag_maaws_HEAT:_HEATCount),STRINGIFY(rhs_mag_maaws_HE:_HECount)],["rhs_optic_maaws"],"RELOAD","CARLG"]
#define SMAW(_HEATCount,_HECount) ["rhs_weap_smaw_green",[STRINGIFY(rhs_mag_smaw_HEAA:_HEATCount),STRINGIFY(rhs_mag_smaw_HEDP:_HECount)],["rhs_weap_optic_smaw"],"RELOAD","SMAW"]
#define M80(_count) ["rhs_weap_m80",[],[],"DISPOSABLE","M80"]
#define RPG32(_HEATCount,_HECount) ["launch_RPG32_green_F",[STRINGIFY(RPG32_F:_HEATCount),STRINGIFY(RPG32_HE_F:_HECount)],[],"RELOAD","RPG32"]
#define RPG7(_HEATCount,_HECount) ["rhs_weap_rpg7",[STRINGIFY(rhs_rpg7_PG7VL_mag:_HEATCount),STRINGIFY(rhs_rpg7_OG7V_mag:_HECount)],["rhs_acc_pgo7v3"],"RELOAD","RPG7"]

#define TITAN(_count) ["launch_I_Titan_short_F",[STRINGIFY(Titan_AT:_count)],[],"RELOAD","TITAN"]
#define JAVELIN(_count) ["rhs_weap_fgm148",[STRINGIFY(rhs_fgm148_magazine_AT:_count)],[],"RELOAD","JAVELIN"]
#define NLAW(_count) ["launch_NLAW_F",[],[],"DISPOSABLE","NLAW"]
#define METIS(_count) ["launch_O_Vorona_green_F",[STRINGIFY(Vorona_HEAT:_count)],[],"RELOAD","METIS"]

#define STINGER(_count) ["rhs_weap_fim92",[STRINGIFY(rhs_fim92_mag:_count)],[],"RELOAD","STINGER"]
#define IGLA(_count) ["rhs_weap_igla",[STRINGIFY(rhs_mag_9k38_rocket:_count)],[],"RELOAD","IGLA"]

#define VN_LAW(_count) ["vn_m72",[STRINGIFY(vn_m72_mag:_count)],[],"DISPOSABLE","M72"]
#define VN_RPG7(_count) ["vn_rpg7",[STRINGIFY(vn_rpg7_mag:_count)],[],"RELOAD","RPG7"]
#define VN_STRELA(_count) ["vn_sa7",[STRINGIFY(vn_sa7_mag:_count)],[],"RELOAD","STRELA"]

#define GEARDEFAULT ["GEARDEFAULT"]


// CREW-SERVED WEAPONS
#define MORTAR_2B14(_he,_smk,_illum) ["ace_compat_rhs_afrf3_2b14_carry","ace_csw_carryMortarBaseplate",[STRINGIFY(ACE_1Rnd_82mm_Mo_HE:_he),STRINGIFY(ACE_1Rnd_82mm_Mo_Smoke:_smk),STRINGIFY(ACE_1Rnd_82mm_Mo_Illum:_illum)]]
#define MORTAR_M252(_he,_smk,_illum) ["ace_compat_rhs_usf3_m252_carry","ace_csw_carryMortarBaseplate",[STRINGIFY(ACE_1Rnd_82mm_Mo_HE:_he),STRINGIFY(ACE_1Rnd_82mm_Mo_Smoke:_smk),STRINGIFY(ACE_1Rnd_82mm_Mo_Illum:_illum)]]

#define HMG_M2(_boxes) ["ace_compat_rhs_usf3_m2_carry","ace_csw_m3CarryTripod",[STRINGIFY(ace_csw_100Rnd_127x99_mag_red:_boxes)]]
#define HMG_M2_LO(_boxes) ["ace_compat_rhs_usf3_m2_carry","ace_csw_m3CarryTripodLow",[STRINGIFY(ace_csw_100Rnd_127x99_mag_red:_boxes)]]

#define HMG_KORD(_boxes) ["ace_compat_rhs_afrf3_kord_carry","ace_csw_kordCarryTripod",[STRINGIFY(ace_csw_50Rnd_127x108_mag:_boxes)]]
#define HMG_KORD_LO(_boxes) ["ace_compat_rhs_afrf3_kord_carry","ace_csw_kordCarryTripodLow",[STRINGIFY(ace_csw_50Rnd_127x108_mag:_boxes)]]
#define HMG_DSHKM(_boxes) ["ace_compat_rhs_gref3_dshkm_carry","ace_csw_kordCarryTripod",[STRINGIFY(ace_csw_50Rnd_127x108_mag:_boxes)]]
#define HMG_DSHKM_LO(_boxes) ["ace_compat_rhs_gref3_dshkm_carry","ace_csw_kordCarryTripodLow",[STRINGIFY(ace_csw_50Rnd_127x108_mag:_boxes)]]

#define AT_SPG9(_he,_heat) ["ace_compat_rhs_afrf3_spg9_carry","ace_csw_spg9CarryTripod",[STRINGIFY(ace_compat_rhs_afrf3_mag_OG9VM:_he),STRINGIFY(ace_compat_rhs_afrf3_mag_PG9V:_heat)]]
#define AT_METIS(_he,_heat) ["ace_compat_rhs_afrf3_metis_carry","",[STRINGIFY(ace_compat_rhs_afrf3_mag_9M131F:_he),STRINGIFY(ace_compat_rhs_afrf3_mag_9M131M:_heat)]]
#define AT_TOW(_tow) ["ace_compat_rhs_usf3_tow_carry","",[STRINGIFY(ace_compat_rhs_usf3_mag_TOW:_tow)]]


#define VN_MORTAR_TYPE53(_hecnt,_smk,_illum) ["ace_compat_sog_mortar_type53_carry","ace_csw_carryMortarBaseplate",[STRINGIFY(ace_compat_sog_82mm_he:_hecnt),STRINGIFY(ace_compat_sog_82mm_wp:_smk),STRINGIFY(ace_compat_sog_82mm_lume:_illum)]]
#define VN_MORTAR_M2_60mm(_hecnt,_smk,_illum) ["ace_compat_sog_mortar_m2_carry","ace_csw_carryMortarBaseplate",[STRINGIFY(ace_compat_sog_60mm_he:_hecnt),STRINGIFY(ace_compat_sog_60mm_wp:_smk),STRINGIFY(ace_compat_sog_60mm_lume:_illum)]]
#define VN_MORTAR_M29_81mm(_hecnt,_smk,_illum) ["ace_compat_sog_mortar_m29_carry","ace_csw_carryMortarBaseplate",[STRINGIFY(ace_compat_sog_81mm_he:_hecnt),STRINGIFY(ace_compat_sog_81mm_wp:_smk),STRINGIFY(ace_compat_sog_81mm_lume:_illum)]]

// #define VN_MMG_M1919A6(_boxes) ["ace_compat_sog_m1919a6_carry",nil,[]]
// #define VN_MMG_M1919A4(_boxes) ["ace_compat_sog_m1919a4_carry","ace_csw_m3CarryTripod",[]]
// #define VN_MMG_M1919A4_LO(_boxes) ["ace_compat_sog_m1919a4_carry","ace_csw_m3CarryTripodLow",[]]
// #define VN_MMG_M60(_boxes) ["ace_compat_sog_m60_carry","ace_csw_m3CarryTripod",[]]
// #define VN_MMG_M60_LO(_boxes) ["ace_compat_sog_m60_carry","ace_csw_m3CarryTripodLow",[]]

// #define VN_MMG_RPD(_boxes) ["ace_compat_sog_rpd_carry","ace_csw_kordCarryTripod",[]]

// #define VN_HMG_DSHKM(_boxes) ["ace_compat_sog_dshkm_carry","ace_csw_kordCarryTripod",[]]
// #define VN_HMG_DSHKM_LO(_boxes) ["ace_compat_sog_dshkm_carry","ace_csw_kordCarryTripodLow",[]]
// #define VN_HMG_DSHKM_AA(_boxes) ["ace_compat_sog_dshkm_AA_carry","ace_csw_kordCarryTripod",[]]
// #define VN_HMG_DSHKM_SHIELD(_boxes) ["ace_compat_sog_dshkm_shield_carry","ace_csw_kordCarryTripodLow",[]]
// #define VN_HMG_M2(_boxes) ["ace_compat_sog_m2_carry","ace_csw_m3CarryTripod",[]]
// #define VN_HMG_M2_LO(_boxes) ["ace_compat_sog_m2_carry","ace_csw_m3CarryTripodLow",[]]



/*
ace_compat_rhs_afrf3_2b14_carry // MORTAR 2B14 Podnos
ace_compat_rhs_usf3_m252_carry // MORTAR M252
ace_csw_carryMortarBaseplate // Mortar base

ace_compat_rhs_afrf3_kord_carry // HMG KORD
ace_compat_rhs_gref3_dshkm_carry // HMG DSHKM

ace_csw_kordCarryTripod // HMG KORD Tripod
ace_csw_kordCarryTripodLow // HMG KORD Tripod Low
ace_compat_rhs_afrf3_nsv_carry // HMG NSV
ace_compat_rhs_usf3_m2_carry // HMG M2

ace_compat_rhs_afrf3_spg9_carry // AT SPG9
ace_csw_spg9CarryTripod // AT SPG9 Tripod

*/
