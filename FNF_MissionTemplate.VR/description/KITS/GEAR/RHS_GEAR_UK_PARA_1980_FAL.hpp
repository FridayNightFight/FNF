#include "..\undef.hpp" // Reset defines

// put all rifle weapons
#define RIFLE "UK3CB_FNFAL_PARA"
// put all mags for the weapons above -- only the compatible ones for the player's weapon will be given
#define RIFLE_MAG "rhs_mag_20Rnd_762x51_m80_fnfal:7","UK3CB_FNFAL_20rnd_762x51_R:4"
// give Riflemen extra mags
#define RIFLE_MAG_RI "rhs_mag_20Rnd_762x51_m80_fnfal:12","UK3CB_FNFAL_20rnd_762x51_R:6"

#define SIDEARM "UK3CB_BHP"
#define SIDEARM_MAG "UK3CB_BHP_9_13Rnd:2"

// put all GL weapons
#define RIFLE_GL "UK3CB_M16A2_UGL"
#define RIFLE_GL_MAG "rhs_mag_30Rnd_556x45_M855A1_Stanag:7","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:4"

// UGL types - these should be classnames of items compatible with RIFLE_GL
// note: "type" here, if using a definition, MUST not have quotes around it. only the classname.
#define UGL_MAGS(_type,_count) _type##:##_count
#define UGL_FRAG 1Rnd_HE_Grenade_shell
#define UGL_SMOKEWHITE 1Rnd_Smoke_Grenade_shell
#define UGL_FLAREWHITE UGL_FlareWhite_F

// put all Carbine-style (shorter) weapons
#define CARBINE "UK3CB_M16_Carbine"
#define CARBINE_MAG "rhs_mag_30Rnd_556x45_M855A1_Stanag:7","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:4"
#define CARBINE_MAG_RI "rhs_mag_30Rnd_556x45_M855A1_Stanag:12","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:6"
#define CARBINE_MAG_CREW "rhs_mag_30Rnd_556x45_M855A1_Stanag:4","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:2"

#define SMG_RIFLE "UK3CB_Sten"
#define SMG_MAG "UK3CB_Sten_34Rnd_Magazine:8"
#define SMG_MAG_CREW "UK3CB_Sten_34Rnd_Magazine:4"

#define AR_RIFLE "UK3CB_Bren"
#define AR_MAG "UK3CB_Bren_30Rnd_762x51_Magazine_R:16"
#define AR_MAG_ASST "UK3CB_Bren_30Rnd_762x51_Magazine_R:12"

#define AT_LAUNCHER M72LAW(1)

#define MAT1_LAUNCHER CARLG(2,0)
#define MAT2_LAUNCHER CARLG(2,0)

#define DM_RIFLE "UK3CB_M14DMR"
#define DM_MAG "UK3CB_DMR_20rnd_762x51:8", "UK3CB_DMR_20rnd_762x51_R:4"

#define MMG_RIFLE "rhs_weap_fnmag"
#define MMG_MAG "rhsusf_100Rnd_762x51_m80a1epr:12"
#define MMG_MAG_ASST "rhsusf_100Rnd_762x51_m80a1epr:10"

#define SPOTTER_RIFLE "rhs_weap_m14", "rhs_weap_m3a1_specops"
#define SPOTTER_MAG "ACE_20Rnd_762x51_Mag_SD:11", "rhsgref_30rnd_1143x23_M1911B_SMG:8"

#define SNP_RIFLE "rhs_weap_m24sws"
#define SNP_MAG "rhsusf_5Rnd_762x51_m118_special_Mag:12"

// [player getVariable "phxLoadout", (configProperties [_cfgPath, "true", true]) apply {configName _x}]

class RHS_GEAR_UK_PARA_1980_FAL {
  author = "Mazz38";
  description = "United Kingdom: UK PARA FAL Kits";

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
          UGL_MAGS(UGL_FLAREWHITE,2)
        }
      }
    };
    items[] += {};
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