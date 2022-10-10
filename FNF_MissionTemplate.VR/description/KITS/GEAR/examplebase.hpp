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
#define UGL_FRAG 1Rnd_HE_Grenade_shell
#define UGL_SMOKEWHITE 1Rnd_Smoke_Grenade_shell
#define UGL_FLAREWHITE UGL_FlareWhite_F

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

#define AT_LAUNCHER "vn_m72"
#define AT_MAG "vn_m72_mag:1"

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

class VN_US_SOG1970 {
  author = "YourNameHere";
  description = "FactionOrCountry: This is a loadout description";

  defaultMAT[] = {
    {CARLG,1},
    {STINGER,1}
  };

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
    magazines[] = {BASE_GRENADES};
    items[] = {TOOLS,GRUNT_MEDICAL};
    linkedItems[] = {LINKED};
    attachments[] = {};
    launcherAttachments[] = {};
    explosiveChoices[] = {};
    grenadeChoices[] = {};
    giveSideKey = 0; // 0 for no key, 1 for side key, 2 for GLOBAL key
    giveSilencer = 0; // 0 for no silencer, 1 to equip silencer on primary weapon
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
    weaponChoices[] = {
      {{SMG_RIFLE},{SMG_MAG_CREW}},
      {{CARBINE},{CARBINE_MAG}},
      {{SHOTGUN},{SHOTGUN_MAG}}
    };
    explosiveChoices[] = {{CE_SATCHEL},{CE_MINEAP},{CE_MINEAT},{CE_DEMOCHARGE}};
    grenadeChoices[] = {{CE_FRAG_GRENADES},{CE_INCEN_GRENADES}};
  };

  class LAT : BASE {
    launchers[] = {AT_LAUNCHER};
    magazines[] = {AT_MAG};
  };
  class MATA: BASE {};
  class MAT1 : MATA {};
  class MAT2 : MATA {};

  class RIS : BASE {
    weaponChoices[] = {
      {{SPOTTER_RIFLE},{SPOTTER_MAG}}
    };
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
  };

    class CR : BASE {
    weaponChoices[] = {
      {{SMG_RIFLE},{SMG_MAG_CREW}}
    };
    giveSideKey = 1;
  };
  class CRL : CR {};
  class PI : CR {};

  class MED : BASE {
    backpackItems[] = {MEDIC_MEDICAL};
    magazines[] += {
      MEDIC_SMOKES
    };
  };
};
