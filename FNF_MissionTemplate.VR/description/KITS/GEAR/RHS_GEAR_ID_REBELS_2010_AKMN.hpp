#include "..\undef.hpp" // Reset defines

// put all rifle weapons
#define RIFLE "rhs_weap_akmn"
// put all mags for the weapons above -- only the compatible ones for the player's weapon will be given
#define RIFLE_MAG "rhs_30Rnd_762x39mm_polymer_89:7","rhs_30Rnd_762x39mm_polymer_tracer:4"
// give Riflemen extra mags
#define RIFLE_MAG_RI "rhs_30Rnd_762x39mm_polymer_89:12","rhs_30Rnd_762x39mm_polymer_tracer:6"

#define SIDEARM "rhs_weap_makarov_pm"
#define SIDEARM_MAG "rhs_mag_9x18_8_57N181S:2"

// put all GL weapons
#define RIFLE_GL "rhs_weap_akmn_gp25"
#define RIFLE_GL_MAG RIFLE_MAG

// UGL types - these should be classnames of items compatible with RIFLE_GL
// note: "type" here, if using a definition, MUST not have quotes around it. only the classname.
#define UGL_MAGS(_type,_count) _type##:##_count
#define UGL_FRAG rhs_VOG25
#define UGL_SMOKEWHITE rhs_GRD40_White
#define UGL_FLAREWHITE rhs_VG40OP_white

// put all Carbine-style (shorter) weapons
#define CARBINE "rhs_weap_aks74un"
#define CARBINE_MAG "rhs_30Rnd_545x39_7N10_AK:7", "rhs_30Rnd_545x39_AK_plum_green:4"
#define CARBINE_MAG_RI "rhs_30Rnd_545x39_7N10_AK:12", "rhs_30Rnd_545x39_AK_plum_green:6"
#define CARBINE_MAG_CREW "rhs_30Rnd_545x39_7N10_AK:4","rhs_30Rnd_545x39_AK_plum_green:2"

#define SMG_RIFLE "rhs_weap_pp2000"
#define SMG_MAG "rhs_mag_9x19mm_7n31_44:8"
#define SMG_MAG_CREW "rhs_mag_9x19mm_7n31_44:4"

#define AR_RIFLE "rhs_weap_rpk74m"
#define AR_MAG "fnf_45rnd_rpk_green:12"
#define AR_MAG_ASST "fnf_45rnd_rpk_green:12"

#define AT_LAUNCHER RPG7(2,0)

#define MAT1_LAUNCHER RPG7(2,1)
#define MAT2_LAUNCHER RPG7(2,1)

#define DM_RIFLE "rhs_weap_svdp_wd_npz"
#define DM_MAG "rhs_10Rnd_762x54mmR_7N1:11"

#define MMG_RIFLE "rhs_weap_pkp"
#define MMG_MAG "rhs_100Rnd_762x54mmR:6"
#define MMG_MAG_ASST "rhs_100Rnd_762x54mmR:8"

#define SPOTTER_RIFLE "rhs_weap_aks74n_2", "rhs_weap_asval"
#define SPOTTER_MAG "rhs_45Rnd_545X39_7U1_AK:8", "rhs_20rnd_9x39mm_SP6:11"

#define SNP_RIFLE "rhs_weap_t5000"
#define SNP_MAG "rhs_5Rnd_338lapua_t5000:12"

// [player getVariable "phxLoadout", (configProperties [_cfgPath, "true", true]) apply {configName _x}]

class RHS_GEAR_ID_REBELS_2010_AKMN {
  author = "Mazz38";
  description = "ID: 2010 Rebels ARMY AKMN Kits";

  class BASE {
    backpackItems[] = {};
    sidearms[] = {
      {{SIDEARM},{SIDEARM_MAG}}
    };
    weaponChoices[] = {
      {{RIFLE},{RIFLE_MAG}},
      {{CARBINE},{CARBINE_MAG}}
    };
    launchers[] = {};
    defaultMAT[] = {};
    magazines[] = {BASE_GRENADES};
    items[] = {TOOLS,GRUNT_MEDICAL};
    linkedItems[] = {LINKED};
    attachments[] = {};
    launcherAttachments[] = {};
    explosiveChoices[] = {};
    grenadeChoices[] = {};
    giveSideKey = 0; // 0 for no key, 1 for side key, 2 for GLOBAL key
    giveSilencer = 0; // 0 for no silencer, 1 to equip silencer on primary weapon
    giveSRRadio = 1;
    giveLRRadio = 0;
  };

  class RI : BASE {
    weaponChoices[] = {
      {{RIFLE},{RIFLE_MAG_RI}},
      {{CARBINE},{CARBINE_MAG_RI}}
    };
  };

  class TL : BASE {
    /*weaponChoices[] = {
      {
        {RIFLE_GL},
        {
          RIFLE_GL_MAG,
          MARKING_SMOKES,
          UGL_MAGS(UGL_FLAREWHITE,4)
        }
      }
    };*/
    magazines[] += {
      LEADER_SMOKES
    };
    items[] += {LEADER_TOOLS};
    linkedItems[] += {VECTOR};
    giveSideKey = 1;
    giveLRRadio = 1;
  };

  class SL : TL {};
  
  class PL : TL {};

  class ARA : BASE {
    backpackItems[] += {AR_MAG_ASST};
  };
  class AB: BASE {};
  class AR : BASE {
    weapons[] = {AR_RIFLE};
    weaponChoices[] = {
      {{AR_RIFLE},{AR_MAG}}
    };
    attachments[] = {};
  };

  class GR : BASE {
    weaponChoices[] = {
      {
        {RIFLE_GL},
        {
          RIFLE_GL_MAG,
          UGL_MAGS(UGL_FRAG,GR_GRENADECOUNT),
          UGL_MAGS(UGL_SMOKEWHITE,UGL_SMOKECOUNT),
          MARKING_SMOKES,
          UGL_MAGS(UGL_FLAREWHITE,UGL_FLARECOUNT)
        }
      }
    };
  };

  class SGT : TL {
    weaponChoices[] = {
      {
        {RIFLE_GL},
        {
          RIFLE_GL_MAG,
          UGL_MAGS(UGL_FRAG,GRIR_GRENADECOUNT),
          UGL_MAGS(UGL_SMOKEWHITE,UGL_SMOKECOUNT),
          MARKING_SMOKES,
          UGL_MAGS(UGL_FLAREWHITE,UGL_FLARECOUNT),
          UGL_MAGS(BASE_UGL_HUNTIR,3)
        }
      }
    };
    items[] += {HUNTIR_MONITOR};
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

  class MATA1 : BASE {
    defaultMAT[] = {MAT1_LAUNCHER};
  };
  class MAT1 : MATA1 {};
  class MATA2 : BASE {
    defaultMAT[] = {MAT2_LAUNCHER};
  };
  class MAT2 : MATA2 {};

  class RIS : BASE {
    weaponChoices[] = {
      {{SPOTTER_RIFLE},{SPOTTER_MAG}}
    };
    backpackItems[] += {SPOTTER_TOOLS};
    giveSilencer = 1;
  };

  class DM : BASE {
    weaponChoices[] = {
      {{DM_RIFLE},{DM_MAG}}
    };
  };

  class SNP : BASE {
    weaponChoices[] = {
      {{SNP_RIFLE},{SNP_MAG}}
    };
    backpackItems[] += {SNIPER_TOOLS};
  };

  class CR : BASE {
    weaponChoices[] = {
      {{SMG_RIFLE},{SMG_MAG_CREW}},
      {{CARBINE},{CARBINE_MAG_CREW}}
    };
    giveSideKey = 1;
  };
  class CRL : CR {
    giveLRRadio = 1;
  };
  class PI : CR {
    giveLRRadio = 1;
  };

  class MED : BASE {
    backpackItems[] += {MEDIC_MEDICAL};
    magazines[] += {
      MEDIC_SMOKES
    };
  };
};
