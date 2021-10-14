#define destroy "destroy"
#define uplink "uplink"
#define rush "rush"
#define connection "connection"
#define captureTheFlag "captureTheFlag"
#define adSector "adSector"
#define neutralSector "neutralSector"
#define scavHunt "scavHunt"

// MAT Launchers
// [launcher,[mags],[optics]]
// keep this in sync with \description\KITS\GEAR\common.hpp
// #define HALF_AMMO(_count) __EVAL((_count) / (2));
#define STRINGIFY(s) #s
#define CARLG(_count) ["rhs_weap_maaws",[STRINGIFY(rhs_mag_maaws_HEAT:_count)],["rhs_optic_maaws"],"RELOAD"]
#define RPG32(_count) ["launch_RPG32_green_F",[STRINGIFY(RPG32_F:_count)],[],"RELOAD"]
#define RPG7(_count) ["rhs_weap_rpg7",[STRINGIFY(rhs_rpg7_PG7VL_mag:_count)],["rhs_acc_pgo7v3"],"RELOAD"]
#define TITAN(_count) ["launch_I_Titan_short_F",[STRINGIFY(Titan_AT:_count)],[],"RELOAD"]
#define JAVELIN(_count) ["rhs_weap_fgm148",[STRINGIFY(rhs_fgm148_magazine_AT:_count)],[],"RELOAD"]
#define NLAW(_count) ["ACE_launch_NLAW_ready_F",[],[],"DISPOSABLE"]
#define METIS(_count) ["launch_O_Vorona_green_F",[STRINGIFY(Vorona_HEAT:_count)],[],"RELOAD"]
#define STINGER(_count) ["rhs_weap_fim92",[STRINGIFY(rhs_fim92_mag:_count)],[],"RELOAD"]
#define IGLA(_count) ["rhs_weap_igla",[STRINGIFY(rhs_mag_9k38_rocket:_count)],[],"RELOAD"]
#define VN_LAW(_count) ["vn_m72",[STRINGIFY(vn_m72_mag:_count)],[],"DISPOSABLE"]
#define VN_RPG7(_count) ["vn_rpg7",[STRINGIFY(vn_rpg7_mag:_count)],[],"RELOAD"]
#define VN_STRELA(_count) ["vn_sa7",[STRINGIFY(vn_sa7_mag:_count)],[],"RELOAD"]

#define GEARDEFAULT ["GEARDEFAULT"]
