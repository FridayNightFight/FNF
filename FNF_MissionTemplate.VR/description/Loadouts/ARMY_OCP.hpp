
#define RIFLE "rhs_weap_m16a4_carryhandle", "rhs_weap_m4a1_blockII_bk"
#define RIFLE_MAG "rhs_mag_30Rnd_556x45_M855A1_Stanag:7", "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:4"

#define RIFLE_GL "rhs_weap_m16a4_carryhandle_M203", "rhs_weap_m4a1_blockII_M203_bk"
#define RIFLE_GL_MAG RIFLE_MAG

#define ARR3(_arg1,_arg2,_arg3) _arg1##,##_arg2##,##_arg3
#define ARR4(_arg1,_arg2,_arg3,_arg4) _arg1,_arg2,_arg3,_arg4
#define STR(s) #s;
#define UGL_MAGS(_type,_count) _type##:##_count
// #define STD_UGL_MAG BASE_UGL_FRAG##:6",\
//   BASE_UGL_SMOKEWHITE##:3",\
//   BASE_UGL_FLAREWHITE##:3"
// #define GR_UGL_MAG BASE_UGL_FRAG##:15",\
//   BASE_UGL_SMOKEWHITE##:6",\
//   BASE_UGL_FLAREWHITE##:2"
// #define GRIR_UGL_MAG "UGL_MAGS(BASE_UGL_FRAG,10)"","UGL_MAGS(BASE_UGL_SMOKEWHITE,4)","UGL_MAGS(BASE_UGL_FLAREWHITE,2)","UGL_MAGS(BASE_UGL_HUNTIR,4)"
// #define GRIR_UGL_MAG UGL_MAGS(BASE_UGL_FRAG,10)

#define CARBINE "rhs_weap_m4a1_carryhandle"
#define CARBINE_MAG RIFLE_MAG

#define SIDEARM "rhsusf_weap_glock17g4"
#define SIDEARM_MAG "rhsusf_mag_17Rnd_9x19_JHP:2"

#define AR_RIFLE "rhs_weap_m249_pip_L"
#define AR_MAG "rhsusf_200rnd_556x45_mixed_box:6"
#define AR_MAG_ASST "rhsusf_200rnd_556x45_mixed_box:5"

#define MMG_RIFLE "rhs_weap_m240G"
#define MMG_MAG "rhsusf_100Rnd_762x51_m80a1epr:8"
#define MMG_MAG_ASST "rhsusf_100Rnd_762x51_m80a1epr:6"

#define AT_LAUNCHER "rhs_weap_m72a7"

#define SPOTTER_RIFLE "srifle_EBR_F"
#define SPOTTER_MAG "ACE_20Rnd_762x51_Mag_SD:11"

#define SMG_RIFLE "rhsusf_weap_MP7A2"
#define SMG_MAG "rhsusf_mag_40Rnd_46x30_FMJ:8"

#define SNP_RIFLE "rhs_weap_XM2010", "rhs_weap_XM2010_wd", "rhs_weap_XM2010_d", "rhs_weap_XM2010_sa"
#define SNP_MAG "rhsusf_5Rnd_300winmag_xm2010:12"


#define UNIFORM "rhs_uniform_cu_ocp"
#define HELMET "rhsusf_ach_helmet_headset_ess_ocp_alt"
#define HELMET_PILOT "rhsusf_hgu56p_visor_tan"
#define HELMET_CREWMAN "rhsusf_cvc_alt_helmet"
#define VEST "rhsusf_iotv_ocp_Rifleman"
#define VEST_LEADER "rhsusf_iotv_ocp_Grenadier"
#define VEST_AR "rhsusf_iotv_ocp_SAW"
#define VEST_MEDIC "rhsusf_iotv_ocp_Medic"
#define VEST_PILOT "rhsusf_plateframe_light"
#define BACKPACK "B_AssaultPack_cbr"
#define BACKPACK_RADIO "TFAR_rt1523g_black"
#define BACKPACK_MEDIC "B_FieldPack_cbr"
#define BACKPACK_AR "B_Carryall_cbr"
#define BACKPACK_AT "B_Kitbag_cbr"


class RI {
  uniform[] = {UNIFORM};
  vest[] = {VEST};
  headgear[] = {HELMET};
  backpack[] = {BACKPACK};
  backpackItems[] = {GRUNT_MEDICAL};
  weapons[] = {RIFLE};
  launchers[] = {};
  sidearms[] = {SIDEARM};
  magazines[] = {RIFLE_MAG,SIDEARM_MAG,BASE_GRENADES};
  items[] = {TOOLS};
  linkedItems[] = {LINKED};
  attachments[] = {};
  launcherAttachments[] = {};
  opticChoices[] = {MISSION_OPTICS};
};

class PL : RI {
  vest[] = {VEST_LEADER};
  backpack[] = {BACKPACK_RADIO};
  backpackItems[] = {GRUNT_MEDICAL};
  weapons[] = {RIFLE_GL};
  magazines[] = {
    RIFLE_GL_MAG,
    UGL_MAGS(BASE_UGL_FRAG,6),
    UGL_MAGS(BASE_UGL_SMOKEWHITE,3),
    UGL_MAGS(BASE_UGL_FLAREWHITE,3),
    SIDEARM_MAG,
    BASE_GRENADES,
    LEADER_SMOKES
  };
  items[] += {LEADER_TOOLS,SIDE_KEY};
  linkedItems[] += {VECTOR};
};

class SGT : PL {};
class SL : PL {};
class TL : PL {};

class AR : RI {
  vest[] = {VEST_AR};
  backpack[] = {BACKPACK_AR};
  weapons[] = {AR_RIFLE};
  magazines[] = {AR_MAG,SIDEARM_MAG,BASE_GRENADES};
  attachments[] = {};
  opticChoices[] = {};
};

class ARA : RI {
  magazines[] += {AR_MAG_ASST};
};

class MED : RI {
  vest[] = {VEST_MEDIC};
  backpack[] = {BACKPACK_MEDIC};
  backpackItems[] = {MEDIC_MEDICAL};
  magazines[] += {MEDIC_SMOKES};
};