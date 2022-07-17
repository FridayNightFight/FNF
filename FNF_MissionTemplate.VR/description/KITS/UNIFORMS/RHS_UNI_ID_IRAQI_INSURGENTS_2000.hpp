#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_MEI_B_U_Jeans_Tshirt_01", "UK3CB_MEE_O_U_06", "UK3CB_MEI_B_U_Jeans_Tshirt_05", "UK3CB_MEI_B_U_Jeans_Tshirt_12", "UK3CB_MEI_B_U_Jeans_Tshirt_04", "UK3CB_MEI_B_U_Pants_09", "UK3CB_ADC_C_Pants_U_21", "UK3CB_ADE_O_U_02_E", "UK3CB_CHC_C_U_COACH_04"

#define VEST "rhsgref_chicom"
#define VEST_LEADER VEST
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "UK3CB_H_Shemag_red_02", "UK3CB_H_Shemag_red", "UK3CB_TKA_I_H_SSh68_Khk", "UK3CB_H_Shemag_white", "UK3CB_H_Profiteer_Cap_01",
#define HELMET_CMDR "UK3CB_TKA_B_H_Beret"
#define HELMET_RECON "UK3CB_H_Woolhat_GRN", "UK3CB_H_Woolhat_KHK"
#define HELMET_CREWMAN "rhs_tsh4_bala"
#define HELMET_PILOT "H_Cap_headphones"

#define BACKPACK "B_TacticalPack_rgr"
#define BACKPACK_RADIO "TFAR_rt1523g_fabric"
#define BACKPACK_AR "B_Carryall_oli"
#define BACKPACK_AT "B_Carryall_oli"
#define BACKPACK_MEDIC "B_TacticalPack_rgr"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_ID_IRAQI_INSURGENTS_2000 {
  author = "Mazz38";
  description = "ID: 2000 IRAQI INSURGENTS Random Camouflage";

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
  class PL : SGT {
    headgear[] = {HELMET_CMDR};
  };

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
