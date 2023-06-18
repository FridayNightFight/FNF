#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_ADM_B_U_Shirt_Pants_01_GRN_WDL_ALT", "UK3CB_ADM_B_U_Shirt_Pants_01_GRN_WDL"

#define VEST "UK3CB_LDF_B_V_TacVest_GEO", "rhs_6b23", "UK3CB_V_Pouch", "UK3CB_LDF_B_V_CREW_Vest_KKZ10_OLI", "UK3CB_LDF_B_V_GREN_Vest_KKZ10_OLI", "UK3CB_ADA_B_V_MBAV_OLI"
#define VEST_LEADER VEST
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "UK3CB_ADA_B_H_6b27m_OLI", "UK3CB_ADA_B_H_6b27m_ESS_OLI", "rhsusf_ach_bare", "rhsgref_hat_M1951", "UK3CB_H_Shemag_oli", "rhs_6b26_bala_green", "H_Bandanna_khk_hs", "rhs_beanie_green", "rhsusf_bowman_cap", "rhsusf_opscore_fg"
#define HELMET_CMDR "UK3CB_LSM_B_H_Field_Cap_OLI"
#define HELMET_RECON "UK3CB_LSM_B_H_BoonieHat_OLI"
#define HELMET_CREWMAN "H_HelmetCrew_I"
#define HELMET_PILOT "rhsusf_hgu56p_mask_green", "rhsusf_hgu56p_visor_mask_green"

#define BACKPACK "UK3CB_B_US_Backpack"
#define BACKPACK_RADIO "UK3CB_B_B_Backpack_Radio_Chem_OLI"
#define BACKPACK_AR "B_Carryall_oli"
#define BACKPACK_AT "B_Carryall_oli"
#define BACKPACK_MEDIC "UK3CB_B_US_Backpack"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_GEN_PMC_OLV_2020 {
  author = "Banks/Mallen";
  description = "PMC: Modern Private Military Company Olive Camouflage";

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
