#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_LSM_B_U_CombatUniform_06"

#define VEST "rhs_chicom"
#define VEST_LEADER VEST
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "rhssaf_helmet_m97_olive_nocamo"
#define HELMET_CMDR "UK3CB_LSM_B_H_Field_Cap_WDL"
#define HELMET_RECON "UK3CB_LSM_B_H_BoonieHat_WDL"
#define HELMET_CREWMAN "rhs_tsh4_bala"
#define HELMET_PILOT "rhs_zsh7a_mike_green_alt"

#define BACKPACK "UK3CB_B_Bedroll_Backpack"
#define BACKPACK_RADIO "TFAR_rt1523g_fabric"
#define BACKPACK_AR "UK3CB_CHC_C_B_HIKER"
#define BACKPACK_AT "UK3CB_LSM_B_B_CARRYALL_WDL_01"
#define BACKPACK_MEDIC "B_FieldPack_oli"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_ANY_VIETNAMESE_2010 {
  author = "Mazz38";
  description = "VT: 2010 Vietnamese ARMY Woodland Camouflage";

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
