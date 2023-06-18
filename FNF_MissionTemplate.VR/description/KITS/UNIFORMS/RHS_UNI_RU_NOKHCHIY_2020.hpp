#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_ARD_B_U_SF_Uniform_01"

#define VEST "V_TacVestIR_blk"
#define VEST_LEADER "rhs_6b45_off"
#define VEST_AR "rhs_6b45_mg"
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "rhsusf_opscore_bk_pelt", "rhsusf_opscore_bk", "UK3CB_ANP_B_H_6b27m_bala_BLK"
#define HELMET_CMDR "rhs_fieldcap_digi2"
#define HELMET_RECON "UK3CB_H_Shemag_blk"
#define HELMET_CREWMAN "UK3CB_H_Beanie_02_BLK"
#define HELMET_PILOT "rhs_zsh7a_mike_green_alt"

#define BACKPACK "B_AssaultPack_blk"
#define BACKPACK_RADIO "TFAR_mr3000_rhs"
#define BACKPACK_AR "rhs_tortila_emr"
#define BACKPACK_AT "rhs_tortila_emr"
#define BACKPACK_MEDIC "rhs_medic_bag"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_RU_NOKHCHIY_2020 {
  author = "Mazz38";
  description = "RU: Modern Chechen Forces Camouflage";

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
