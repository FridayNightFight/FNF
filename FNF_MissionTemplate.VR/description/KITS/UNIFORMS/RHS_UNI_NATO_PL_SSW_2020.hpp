#include "..\undef.hpp" // Reset defines

#define UNIFORM "rhs_uniform_g3_rgr"

#define VEST "UK3CB_LDF_B_V_RIF_ALT_Vest_KKZ10_OLI"
#define VEST_LEADER "UK3CB_LDF_B_V_SL_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_GREN_Vest_KKZ10_OLI"
#define VEST_AR "UK3CB_LDF_B_V_MG_Vest_KKZ10_OLI"
#define VEST_MEDIC "UK3CB_LDF_B_V_MD_Vest_KKZ10_OLI"
#define VEST_CREWMAN "UK3CB_LDF_B_V_CREW_Vest_KKZ10_OLI"
#define VEST_PILOT "UK3CB_LDF_B_V_CREW_Vest_KKZ10_OLI"

#define HELMET "rhsusf_opscore_rg_cover"
#define HELMET_CMDR "UK3CB_LSM_B_H_Field_Cap_OLI"
#define HELMET_RECON "UK3CB_LSM_B_H_BoonieHat_OLI"
#define HELMET_CREWMAN "H_HelmetCrew_I"
#define HELMET_PILOT "rhsusf_hgu56p_mask_green", "rhsusf_hgu56p_visor_mask_green"

#define BACKPACK "UK3CB_B_US_Backpack"
#define BACKPACK_RADIO "UK3CB_B_B_Backpack_Radio_Chem_OLI"
#define BACKPACK_AR "B_Carryall_oli"
#define BACKPACK_AT "B_Carryall_oli"
#define BACKPACK_MEDIC "UK3CB_B_Backpack_Med_OLI"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_NATO_PL_SSW_2020 {
  author = "Mazz38";
  description = "PL: Modern Polish Military Intelligence Service SPECIAL FORCES Olive Camouflage";

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
