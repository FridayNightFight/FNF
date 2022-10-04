#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_CW_SOV_O_Early_U_Spetsnaz_Uniform_01_Ghillie_KHK"

#define VEST "UK3CB_V_CW_Chestrig"
#define VEST_LEADER VEST
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT "rhsgref_6b23_khaki"

#define HELMET "rhsgref_M56", "rhs_ssh68_2"
#define HELMET_CMDR "rhs_headband"
#define HELMET_RECON "UK3CB_CW_US_B_LATE_H_BoonieHat_WDL_01"
#define HELMET_CREWMAN "rhs_tsh4_bala"
#define HELMET_PILOT "rhs_zsh7a_mike"

#define BACKPACK "UK3CB_LSM_B_B_Sidor_TIG_STRIPE_02_RIF"
#define BACKPACK_RADIO "UK3CB_B_O_Tactical_Backpack_Radio"
#define BACKPACK_AR "B_Carryall_khk"
#define BACKPACK_AT "rhs_rpg_empty"
#define BACKPACK_MEDIC "rhs_medic_bag"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_ANY_VIETNAMESE_JUNGLE_CAMO_1980 {
  author = "Mazz38";
  description = "VT: 1980s Vietnamese jungle Camo";

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
    uniform[] = {"UK3CB_CW_SOV_O_Early_U_H_Pilot_Uniform_01_KHK"};
  };

  class MED : BASE {
    vest[] = {VEST_MEDIC};
    backpack[] = {BACKPACK_MEDIC};
  };
};
