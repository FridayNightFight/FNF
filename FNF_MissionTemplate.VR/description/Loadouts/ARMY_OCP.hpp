
// put all rifle weapons
#define RIFLE "rhs_weap_m16a4_carryhandle","rhs_weap_m4a1_blockII_bk"
// put all mags for the weapons above -- only the compatible ones for the player's weapon will be given
#define RIFLE_MAG "rhs_mag_30Rnd_556x45_M855A1_Stanag:7","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:4"
// give Riflemen extra mags
#define RIFLE_MAG_RI "rhs_mag_30Rnd_556x45_M855A1_Stanag:12","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:6"

// put all GL weapons
#define RIFLE_GL "rhs_weap_m16a4_carryhandle_M203","rhs_weap_m4a1_blockII_M203_bk"
#define RIFLE_GL_MAG RIFLE_MAG

// UGL types - these should be classnames of items compatible with RIFLE_GL
// note: "type" here, if using a definition, MUST not have quotes around it. only the classname.
#define UGL_MAGS(_type,_count) _type##:##_count
#define UGL_FRAG 1Rnd_HE_Grenade_shell
#define UGL_SMOKEWHITE 1Rnd_Smoke_Grenade_shell
#define UGL_FLAREWHITE UGL_FlareWhite_F

// put all Carbine-style (shorter) weapons
#define CARBINE "rhs_weap_m4a1_carryhandle"
#define CARBINE_MAG RIFLE_MAG
#define CARBINE_MAG_RI RIFLE_MAG_RI

#define DM_RIFLE RIFLE
#define DM_MAG RIFLE_MAG

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

#define SIDEARM "rhsusf_weap_glock17g4"
#define SIDEARM_MAG "rhsusf_mag_17Rnd_9x19_JHP:2"

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

// [player getVariable "phxLoadout", (configProperties [_cfgPath, "true", true]) apply {configName _x}]

class ARMY_OCP {
  class BASE {
    uniform[] = {UNIFORM};
    vest[] = {VEST};
    headgear[] = {HELMET};
    backpack[] = {BACKPACK};
    backpackItems[] = {};
    launchers[] = {};
    sidearms[] = {
      {{SIDEARM},{SIDEARM_MAG}}
    };
    weaponChoices[] = {
      {{RIFLE},{RIFLE_MAG}},
      {{CARBINE},{CARBINE_MAG}}
    };
    magazines[] = {BASE_GRENADES};
    items[] = {TOOLS,GRUNT_MEDICAL};
    linkedItems[] = {LINKED};
    attachments[] = {};
    launcherAttachments[] = {};
    explosiveChoices[] = {};
    grenadeChoices[] = {};
    giveSideKey = 0; // 0 for no key, 1 for side key, 2 for GLOBAL key
  };

  class RI : BASE {
    weaponChoices[] = {
      {{RIFLE},{RIFLE_MAG_RI}},
      {{CARBINE},{CARBINE_MAG_RI}}
    };
  };

  class TL : BASE {
    vest[] = {VEST_LEADER};
    backpack[] = {BACKPACK_RADIO};
    weaponChoices[] = {
      {
        {RIFLE_GL},
        {
          RIFLE_GL_MAG,
          UGL_MAGS(UGL_FRAG,6),
          UGL_MAGS(UGL_SMOKEWHITE,3),
          UGL_MAGS(UGL_FLAREWHITE,3)
        }
      }
    };
    magazines[] += {
      LEADER_SMOKES
    };
    items[] += {LEADER_TOOLS};
    linkedItems[] += {VECTOR};
    giveSideKey = 1;
  };

  class SL : TL {};
  class SGT : TL {};
  class PL : TL {};

  class AR : BASE {
    vest[] = {VEST_AR};
    backpack[] = {BACKPACK_AR};
    weapons[] = {AR_RIFLE};
    weaponChoices[] = {
      {{AR_RIFLE},{AR_MAG}}
    };
    attachments[] = {};
  };

  class ARA : BASE {
    magazines[] += {AR_MAG_ASST};
  };

  class GR : BASE {
    weaponChoices[] = {
      {
        {RIFLE_GL},
        {
          RIFLE_GL_MAG,
          UGL_MAGS(UGL_FRAG,15),
          UGL_MAGS(UGL_SMOKEWHITE,6),
          UGL_MAGS(UGL_FLAREWHITE,2)
        }
      }
    };
  };

  class GRIR : BASE {
    weaponChoices[] = {
      {
        {RIFLE_GL},
        {
          RIFLE_GL_MAG,
          UGL_MAGS(UGL_FRAG,10),
          UGL_MAGS(UGL_SMOKEWHITE,4),
          UGL_MAGS(UGL_FLAREWHITE,2),
          UGL_MAGS(UGL_FLAREWHITE,2),
          UGL_MAGS(BASE_UGL_HUNTIR,4)
        }
      }
    };
  };

  class MGA : BASE {
    backpackItems[] += {MMG_MAG_ASST,TRIPOD,SHOVEL};
  };

  class MG : BASE {
    weaponChoices[] = {
      {{MMG_RIFLE},{MMG_MAG}}
    };
  };

  class CE : BASE {
    magazines[] = {SMOKE_GRENADES};
    items[] += {CE_TRIGGER,CE_DEFUSE};
    backpackItems[] += {CE_DETECTOR,CE_FORTIFYTOOL,SHOVEL};
    explosiveChoices[] = {{CE_SATCHEL},{CE_MINEAP},{CE_MINEAT},{CE_DEMOCHARGE}};
    grenadeChoices[] = {{CE_FRAG_GRENADES},{CE_INCEN_GRENADES}};
  };

  class LAT : BASE {
    launchers[] = {AT_LAUNCHER};
  };
  class MATA: BASE {};
  class MAT: MATA {};

  class DM: BASE {
    weaponChoices[] = {
      {{DM_RIFLE},{DM_MAG}}
    };
  };

  class MED : BASE {
    vest[] = {VEST_MEDIC};
    backpack[] = {BACKPACK_MEDIC};
    backpackItems[] = {MEDIC_MEDICAL};
    magazines[] += {
      MEDIC_SMOKES
    };
  };
};
