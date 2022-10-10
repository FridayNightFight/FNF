#include "..\undef.hpp" // Reset defines

// put all rifle weapons
#define RIFLE "vn_xm177"
// put all mags for the weapons above -- only the compatible ones for the player's weapon will be given
#define RIFLE_MAG "vn_m16_20_mag:7","vn_m16_40_t_mag:4"
// give Riflemen extra mags
#define RIFLE_MAG_RI "vn_m16_20_mag:12","vn_m16_40_t_mag:7"

#define SIDEARM "vn_m1911"
#define SIDEARM_MAG "vn_m1911_mag:3"

// put all GL weapons
#define RIFLE_GL "vn_xm177_xm148"
#define RIFLE_GL_MAG RIFLE_MAG

// UGL types - these should be classnames of items compatible with RIFLE_GL
// note: "type" here, if using a definition, MUST not have quotes around it. only the classname.
#define UGL_MAGS(_type,_count) _type##:##_count
#define UGL_FRAG vn_40mm_m406_he_mag
#define UGL_SMOKEWHITE vn_40mm_m680_smoke_w_mag
#define UGL_FLAREWHITE vn_40mm_m583_flare_w_mag

// put all Carbine-style (shorter) weapons
#define CARBINE "vn_m14"
#define CARBINE_MAG "vn_m14_mag:12"
#define CARBINE_MAG_RI "vn_m14_mag:16"
#define CARBINE_MAG_CREW "vn_m14_mag:6"

#define SMG_RIFLE "vn_m3a1"
#define SMG_MAG "vn_m3a1_mag:8"
#define SMG_MAG_CREW "vn_m3a1_mag:4"

#define SHOTGUN "vn_m1897"
#define SHOTGUN_MAG "vn_m1897_fl_mag:6", "vn_m1897_buck_mag:6"

#define AR_RIFLE "vn_m63a_cdo"
#define AR_MAG "vn_m63a_150_mag:4"
#define AR_MAG_ASST "vn_m63a_150_mag:8"

#define AT_LAUNCHER VN_LAW(1)

#define MAT1_LAUNCHER VN_LAW(1)
#define MAT2_LAUNCHER VN_LAW(1)

#define DM_RIFLE RIFLE
#define DM_MAG RIFLE_MAG

#define MMG_RIFLE "vn_m60_shorty"
#define MMG_MAG "vn_m60_100_mag:4"
#define MMG_MAG_ASST "vn_m60_100_mag:8"

#define SPOTTER_RIFLE "vn_m45","vn_m3a1"
#define SPOTTER_MAG "vn_m45_mag:11","vn_m3a1_mag:8"

#define SNP_RIFLE "vn_m40a1_camo"
#define SNP_MAG "vn_m40a1_mag:12"


// [player getVariable "phxLoadout", (configProperties [_cfgPath, "true", true]) apply {configName _x}]

class VN_GEAR_US_SOG1970 {
  author = "Mazz38";
  description = "USA: Vietnam Era US Army SOG";

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
    magazines[] = {VN_B_BASE_GRENADES};
    items[] = {TOOLS,GRUNT_MEDICAL};
    linkedItems[] = {VN_B_LINKED_SOG};
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
    linkedItems[] += {VN_BINOCULARS};
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
          UGL_MAGS(UGL_FLAREWHITE,UGL_FLARECOUNT)
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
    magazines[] = {VN_B_SMOKE_GRENADES};
    items[] += {CE_TRIGGER,CE_DEFUSE};
    backpackItems[] += {CE_DETECTOR,CE_FORTIFYTOOL,SHOVEL};
    weaponChoices[] = {
      {{CARBINE},{CARBINE_MAG}},
      {{SHOTGUN},{SHOTGUN_MAG}}
    };
    explosiveChoices[] = {{VN_CE_SATCHEL},{VN_B_MINEAP},{VN_B_MINEAT},{VN_CE_DEMOCHARGE}};
    grenadeChoices[] = {{VN_B_CE_FRAG_GRENADES},{VN_B_CE_WP_GRENADES}};
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
      MEDIC_SMOKES
    };
  };
};
