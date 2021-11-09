#include "..\undef.hpp" // Reset defines

// put all rifle weapons
#define RIFLE "rhs_weap_m21a"
// put all mags for the weapons above -- only the compatible ones for the player's weapon will be given
#define RIFLE_MAG "rhsgref_30rnd_556x45_m21:8","rhsgref_30rnd_556x45_m21_t:10"
// give Riflemen extra mags
#define RIFLE_MAG_RI "rhsgref_30rnd_556x45_m21:12","rhsgref_30rnd_556x45_m21_t:12"

#define SIDEARM "rhs_weap_cz99"
#define SIDEARM_MAG "rhssaf_mag_15Rnd_9x19_FMJ:2"

// put all GL weapons
#define RIFLE_GL "rhs_weap_m21a_pbg40"
#define RIFLE_GL_MAG RIFLE_MAG

// UGL types - these should be classnames of items compatible with RIFLE_GL
// note: "type" here, if using a definition, MUST not have quotes around it. only the classname.
#define UGL_MAGS(_type,_count) _type##:##_count
#define UGL_FRAG rhs_VOG25
#define UGL_SMOKEWHITE rhs_GRD40_White
#define UGL_FLAREWHITE rhs_VOG25P

// put all Carbine-style (shorter) weapons
#define CARBINE "rhs_weap_m21s"
#define CARBINE_MAG RIFLE_MAG
#define CARBINE_MAG_RI RIFLE_MAG_RI
#define CARBINE_MAG_CREW "rhsgref_30rnd_556x45_m21:4","rhsgref_30rnd_556x45_m21_t:2"

#define SMG_RIFLE "rhs_weap_savz58v_ris"
#define SMG_MAG "rhs_30Rnd_762x39mm_Savz58:8"
#define SMG_MAG_CREW "rhs_30Rnd_762x39mm_Savz58_tracer:4"

#define AR_RIFLE "rhs_weap_m84"
#define AR_MAG "rhs_100Rnd_762x54mmR:6"
#define AR_MAG_ASST "rhs_100Rnd_762x54mmR:5"

#define AT_LAUNCHER M72LAW(1)

#define MAT1_LAUNCHER CARLG(2,0)
#define MAT2_LAUNCHER CARLG(2,0)

#define DM_RIFLE RIFLE
#define DM_MAG RIFLE_MAG

#define MMG_RIFLE "rhs_weap_fnmag"
#define MMG_MAG "rhsusf_100Rnd_762x51:8"
#define MMG_MAG_ASST "rhsusf_100Rnd_762x51_m62_tracer:6"

#define SPOTTER_RIFLE "rhs_weap_m14_rail", "rhs_weap_asval_npz"
#define SPOTTER_MAG "ACE_20Rnd_762x51_Mag_SD:11", "rhs_20rnd_9x39mm_SP6:11"

#define SNP_RIFLE "rhs_weap_m24sws"
#define SNP_MAG "rhsusf_5Rnd_762x51_m118_special_Mag:12"

// [player getVariable "phxLoadout", (configProperties [_cfgPath, "true", true]) apply {configName _x}]

class RHS_GEAR_SERBIAN_ARMY_2010_M21 {
  author = "FNF";
  description = "CS: 2010 Serbian ARMY M21 Kits";

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
    giveLRRadio = 1;
  };

  class SL : TL {};
  class SGT : SL {};
  class PL : SGT {};

  class ARA : BASE {
    magazines[] += {AR_MAG_ASST};
  };
  class AR : ARA {
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
