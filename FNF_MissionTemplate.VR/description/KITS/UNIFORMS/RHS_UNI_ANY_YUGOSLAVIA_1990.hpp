#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_TKA_I_U_CombatUniform_02_GREY"

#define VEST "rhs_suspender_AK8_chestrig"
#define VEST_LEADER VEST
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "rhssaf_helmet_m59_85_nocamo"
#define HELMET_CMDR "rhssaf_beret_green"
#define HELMET_RECON "H_Watchcap_camo"
#define HELMET_CREWMAN "rhs_tsh4_ess_bala"
#define HELMET_PILOT "rhs_gssh18"

#define BACKPACK "UK3CB_B_Bedroll_Backpack"
#define BACKPACK_RADIO "UK3CB_B_O_Tactical_Backpack_Radio"
#define BACKPACK_AR "UK3CB_B_Largepack"
#define BACKPACK_AT "rhs_rpg_empty"
#define BACKPACK_MEDIC "UK3CB_TKP_O_B_ASS_BLK"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_ANY_YUGOSLAVIA_1990 {
  author = "Mazz38";
  description = "YU: 1990s Yugoslavia ARMY Olive VSR Camouflage";

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
