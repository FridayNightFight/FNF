#include "..\undef.hpp" // Reset defines

// put all rifle weapons
#define RIFLE "vn_sks", "vn_type56"
// put all mags for the weapons above -- only the compatible ones for the player's weapon will be given
#define RIFLE_MAG "vn_sks_mag:9","vn_sks_t_mag:6","vn_type56_mag:7","vn_type56_t_mag:4"
// give Riflemen extra mags
#define RIFLE_MAG_RI "vn_sks_mag:14","vn_sks_t_mag:9","vn_type56_mag:12","vn_type56_t_mag:7"

#define SIDEARM "vn_tt33"
#define SIDEARM_MAG "vn_tt33_mag:3"

// put all GL weapons
#define RIFLE_GL "vn_sks_gl"
#define RIFLE_GL_MAG RIFLE_MAG

// UGL types - these should be classnames of items compatible with RIFLE_GL
// note: "type" here, if using a definition, MUST not have quotes around it. only the classname.
#define UGL_MAGS(_type,_count) _type##:##_count
#define UGL_FRAG vn_22mm_m60_frag_mag
#define UGL_SMOKEWHITE vn_22mm_m22_smoke_mag
#define UGL_FLAREWHITE vn_22mm_lume_mag

// put all Carbine-style (shorter) weapons
#define CARBINE "vn_m4956"
#define CARBINE_MAG "vn_m4956_10_mag:12"
#define CARBINE_MAG_RI "vn_m4956_10_mag:16"
#define CARBINE_MAG_CREW "vn_m4956_10_mag:6"

#define SMG_RIFLE "vn_mat49"
#define SMG_MAG "vn_mat49_mag:11"
#define SMG_MAG_CREW "vn_mat49_mag:4"

#define SHOTGUN "vn_izh54"
#define SHOTGUN_MAG "vn_izh54_mag:16"

#define AR_RIFLE "vn_k50m"
#define AR_MAG "vn_ppsh41_71_t_mag:8"
#define AR_MAG_ASST "vn_ppsh41_71_t_mag:6"

#define AT_LAUNCHER VN_RPG7(2)

#define MAT1_LAUNCHER VN_RPG7(3)
#define MAT2_LAUNCHER VN_RPG7(3)

#define DM_RIFLE RIFLE
#define DM_MAG RIFLE_MAG

#define MMG_RIFLE "vn_pk"
#define MMG_MAG "vn_pk_100_mag:12"
#define MMG_MAG_ASST "vn_pk_100_mag:10"

#define SPOTTER_RIFLE "vn_m45","vn_m3a1"
#define SPOTTER_MAG "vn_m45_mag:11","vn_m3a1_mag:8"

#define SNP_RIFLE "vn_m9130"
#define SNP_MAG "vn_m38_mag:12"


// [player getVariable "phxLoadout", (configProperties [_cfgPath, "true", true]) apply {configName _x}]

class VN_GEAR_NVA_VC1970 {
  author = "Mazz38";
  description = "NVA: North Vietnamese Army 1970";

  class BASE {
    backpackItems[] = {};
    launchers[] = {};
    sidearms[] = {
      {{SIDEARM},{SIDEARM_MAG}}
    };
    weaponChoices[] = {
      {{RIFLE},{RIFLE_MAG}},
      {{CARBINE},{CARBINE_MAG}}
    };
    magazines[] = {VN_O_BASE_GRENADES};
    items[] = {TOOLS,GRUNT_MEDICAL};
    linkedItems[] = {VN_O_LINKED};
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
      VN_LEADER_SMOKES
    };
    linkedItems[] += {VN_BINOCULARS};
    giveSideKey = 1;
    giveLRRadio = 1;
  };

  class SL : TL {};
  class SGT : TL {};
  class PL : TL {};

  class ARA : BASE {
    magazines[] += {AR_MAG_ASST};
  };
  class AR : ARA {
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
          UGL_MAGS(UGL_FLAREWHITE,2)
        }
      }
    };
  };

  class MGA : BASE {
    backpackItems[] += {MMG_MAG_ASST,TRIPOD,SHOVEL};
    linkedItems[] += {VN_BINOCULARS};
  };

  class MG : BASE {
    weaponChoices[] = {
      {{MMG_RIFLE},{MMG_MAG}}
    };
  };

  class CE : BASE {
    magazines[] = {VN_O_SMOKE_GRENADES};
    items[] += {CE_TRIGGER,CE_DEFUSE};
    backpackItems[] += {CE_DETECTOR,CE_FORTIFYTOOL,SHOVEL};
    weaponChoices[] = {
      {{CARBINE},{CARBINE_MAG}},
      {{SHOTGUN},{SHOTGUN_MAG}}
    };
    explosiveChoices[] = {{VN_CE_SATCHEL},{VN_O_MINEAP},{VN_O_MINEAT},{VN_O_MINEAT_TRIPWIRE},{VN_CE_DEMOCHARGE}};
    grenadeChoices[] = {{VN_O_CE_FRAG_GRENADES},{VN_O_CE_INCEN_GRENADES}};
  };

  class LAT : BASE {
    launchers[] = {AT_LAUNCHER};
  };

  class MATA1 : BASE {
    defaultMAT[] = {MAT1_LAUNCHER};
    linkedItems[] += {VN_BINOCULARS};
  };
  class MAT1 : MATA1 {};
  class MATA2 : BASE {
    defaultMAT[] = {MAT2_LAUNCHER};
    linkedItems[] += {VN_BINOCULARS};
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
      {{SMG_RIFLE},{SMG_MAG_CREW}}
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
      VN_MEDIC_SMOKES
    };
  };
};
