#include "..\undef.hpp" // Reset defines

// put all rifle weapons
#define RIFLE "rhs_weap_l1a1"
// put all mags for the weapons above -- only the compatible ones for the player's weapon will be given
#define RIFLE_MAG "rhs_mag_20Rnd_762x51_m80_fnfal:7","rhs_mag_20Rnd_762x51_m62_fnfal:4"
// give Riflemen extra mags
#define RIFLE_MAG_RI "rhs_mag_20Rnd_762x51_m80_fnfal:12","rhs_mag_20Rnd_762x51_m62_fnfal:6"

#define SIDEARM "rhsusf_weap_glock17g4"
#define SIDEARM_MAG "rhsusf_mag_17Rnd_9x19_JHP:2"

// put all GL weapons
#define RIFLE_GL "rhs_weap_hk416d145_m320"
#define RIFLE_GL_MAG "rhs_mag_30Rnd_556x45_M855A1_Stanag:7", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red:4"

// UGL types - these should be classnames of items compatible with RIFLE_GL
// note: "type" here, if using a definition, MUST not have quotes around it. only the classname.
#define UGL_MAGS(_type,_count) _type##:##_count
#define UGL_FRAG 1Rnd_HE_Grenade_shell
#define UGL_SMOKEWHITE 1Rnd_Smoke_Grenade_shell
#define UGL_FLAREWHITE UGL_FlareWhite_F

// put all Carbine-style (shorter) weapons
#define CARBINE "rhs_weap_hk416d145"
#define CARBINE_MAG "rhs_mag_30Rnd_556x45_M855A1_Stanag:7", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red:4"
#define CARBINE_MAG_RI "rhs_mag_30Rnd_556x45_M855A1_Stanag:7", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red:4"
#define CARBINE_MAG_CREW "rhs_mag_30Rnd_556x45_M855A1_Stanag:4", "rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red:2"

#define SMG_RIFLE "rhsusf_weap_MP7A2"
#define SMG_MAG "rhsusf_mag_40Rnd_46x30_FMJ:8"
#define SMG_MAG_CREW "rhsusf_mag_40Rnd_46x30_FMJ:4"

#define AR_RIFLE "rhs_weap_minimi_para_railed"
#define AR_MAG "rhsusf_200rnd_556x45_mixed_box:6"
#define AR_MAG_ASST "rhsusf_200rnd_556x45_mixed_box:5"

#define AT_LAUNCHER M72LAW(1)

#define MAT1_LAUNCHER CARLG(2)
#define MAT2_LAUNCHER CARLG(2)

#define DM_RIFLE RIFLE
#define DM_MAG RIFLE_MAG

#define MMG_RIFLE "rhs_weap_fnmag"
#define MMG_MAG "rhsusf_100Rnd_762x51_m80a1epr:8"
#define MMG_MAG_ASST "rhsusf_100Rnd_762x51_m80a1epr:6"

#define SPOTTER_RIFLE "srifle_EBR_F", "rhsusf_weap_MP7A2"
#define SPOTTER_MAG "ACE_20Rnd_762x51_Mag_SD:11", "rhsusf_mag_40Rnd_46x30_FMJ:8"

#define SNP_RIFLE "rhs_weap_XM2010", "rhs_weap_XM2010_wd", "rhs_weap_XM2010_d", "rhs_weap_XM2010_sa"
#define SNP_MAG "rhsusf_5Rnd_300winmag_xm2010:12"

// [player getVariable "phxLoadout", (configProperties [_cfgPath, "true", true]) apply {configName _x}]

class RHS_GEAR_GR_GREEKFORCES_2010_L1A1 {
  author = "FNF";
  description = "GR: Greek Armed Forces L1A1 Kits";

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
    giveSideKey = 1;
    giveLRRadio = 1;
  };

  class SL : TL {};
  class SGT : SL {};
  class PL : SGT {};

  class ARA : BASE {
    magazines[] += {AR_MAG_ASST};
  };
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
  class MAT1 : BASE {
    defaultMAT[] = {MAT2_LAUNCHER};
  };
  class MATA2 : BASE {
    defaultMAT[] = {MAT2_LAUNCHER};
  };
  class MAT2 : BASE {
    defaultMAT[] = {MAT2_LAUNCHER};
  };

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
