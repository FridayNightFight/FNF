#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_FIA_B_U_M10_CombatUniform_VEG01_01", "UK3CB_FIA_B_U_M10_CombatUniform_VEG01_02"

#define VEST "rhsusf_mbav_rifleman", "UK3CB_GAF_B_MBAV_RIFLEMAN_DIGI_OLI"
#define VEST_LEADER VEST
#define VEST_AR "rhsusf_mbav_mg"
#define VEST_MEDIC "rhsusf_mbav_medic"
#define VEST_CREWMAN "rhsusf_plateframe_light"
#define VEST_PILOT "rhsusf_plateframe_light"

#define HELMET "H_HelmetB_camo"
#define HELMET_CMDR "UK3CB_H_MilCap_VEG"
#define HELMET_RECON "UK3CB_H_BoonieHat_VEG"
#define HELMET_CREWMAN "H_HelmetCrew_I"
#define HELMET_PILOT "rhsusf_hgu56p_visor_mask_tan"

#define BACKPACK "UK3CB_B_Kitbag_VEG"
#define BACKPACK_RADIO "TFAR_rt1523g_bwmod"
#define BACKPACK_AR "UK3CB_GAF_B_B_ENG_OLI"
#define BACKPACK_AT "UK3CB_GAF_B_B_ENG_OLI"
#define BACKPACK_MEDIC "B_FieldPack_oli"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_NATO_ITALIAN_ARMY_2020 {
  author = "Mazz38";
  description = "IT: Modern Italian ARMY Vegetato Camouflage";

  class BASE {
    uniform[] = {UNIFORM};
    vest[] = {VEST};
    headgear[] = {HELMET};
    backpack[] = {BACKPACK};
  };

  class RI : BASE {};

  class TL : BASE {
    vest[] = {VEST_LEADER};
    backpack[] = {BACKPACK_RADIO};
  };

  class SL : TL {};
  class SGT : SL {};
  class PL : SGT {};

  class ARA : BASE {
    backpack[] = {BACKPACK_AR};
  };
  class AR : ARA {
    vest[] = {VEST_AR};
  };

  class AB: BASE {};

  class GR : BASE {};

  class GRIR : BASE {};

  class MGA : BASE {
    backpack[] = {BACKPACK_AR};
  };

  class MG : MGA {
    backpack[] = {BACKPACK_AR};
  };

  class CE : BASE {};

  class LAT : BASE {};

  class MATA1 : BASE {
    backpack[] = {BACKPACK_AT};
  };
  class MAT1 : MATA1 {};
  class MATA2 : BASE {
    backpack[] = {BACKPACK_AT};
  };
  class MAT2 : MATA2 {};

  class RIS : BASE {
    headgear[] = {HELMET_RECON};
  };

  class DM : BASE {};

  class SNP : BASE {
    headgear[] = {HELMET_RECON};
    uniform[] = {UNIFORM};
  };

  class CR : BASE {
    uniform[] = {UNIFORM};
    vest[] = {VEST_CREWMAN};
    headgear[] = {HELMET_CREWMAN};
  };

  class CRL : CR {
    backpack[] = {BACKPACK_RADIO};
  };

  class PI : BASE {
    vest[] = {VEST_PILOT};
    headgear[] = {HELMET_PILOT};
    backpack[] = {BACKPACK_RADIO};
  };

  class MED : BASE {
    vest[] = {VEST_MEDIC};
    backpack[] = {BACKPACK_MEDIC};
  };
};
