#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_MDF_B_U_SF_Uniform_01_CE"

#define VEST "UK3CB_MDF_B_V_TacVest_LIZ"
#define VEST_LEADER VEST
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "H_HelmetB_camo", "H_HelmetSpecB_paint1"
#define HELMET_CMDR "UK3CB_ADP_B_H_Beret"
#define HELMET_RECON "UK3CB_TKA_B_H_BoonieHat_WDL"
#define HELMET_CREWMAN "rhsusf_cvc_green_alt_helmet"
#define HELMET_PILOT "rhsusf_hgu56p_visor_mask_skull"

#define BACKPACK "B_Kitbag_cbr"
#define BACKPACK_RADIO "TFAR_rt1523g_big_bwmod"
#define BACKPACK_AR "B_Carryall_cbr"
#define BACKPACK_AT "B_Carryall_cbr"
#define BACKPACK_MEDIC "B_FieldPack_cbr"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_NATO_FRANCE_2010 {
  author = "Mazz38";
  description = "NATO: Modern French ARMY CE Camouflage";

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
    uniform[] = {"UK3CB_MDF_B_U_CombatUniform_Ghillie_CE"};
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
