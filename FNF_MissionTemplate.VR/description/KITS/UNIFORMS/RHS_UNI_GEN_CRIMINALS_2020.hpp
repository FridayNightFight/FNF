#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_CHC_C_U_ACTIVIST_03", "UK3CB_CHC_C_U_ACTIVIST_01", "UK3CB_CHC_C_U_ACTIVIST_04", "UK3CB_CHC_C_U_ACTIVIST_02", "UK3CB_CHC_C_U_COACH_04"

#define VEST "UK3CB_V_Pouch"
#define VEST_LEADER VEST 
#define VEST_AR VEST 
#define VEST_MEDIC VEST 
#define VEST_CREWMAN VEST 
#define VEST_PILOT VEST 

#define HELMET "UK3CB_H_Woolhat_BLK", "H_Cap_blk", "H_Bandanna_gry", "UK3CB_H_Woolhat_CBR", "UK3CB_H_Woolhat_GRN", "H_Hat_brown", ""
#define HELMET_CMDR "UK3CB_H_Woolhat_BLK"
#define HELMET_RECON "UK3CB_H_Woolhat_BLK"
#define HELMET_CREWMAN "H_HelmetCrew_I"
#define HELMET_PILOT "rhsusf_hgu56p_mask_green", "rhsusf_hgu56p_visor_mask_green"

#define BACKPACK "UK3CB_B_Invisible"
#define BACKPACK_RADIO "UK3CB_CW_SOV_O_LATE_B_ASS_BERGEN_Radio"
#define BACKPACK_AR "rhs_tortila_black"
#define BACKPACK_AT "UK3CB_B_Invisible"
#define BACKPACK_MEDIC "UK3CB_B_Invisible"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_GEN_CRIMINALS_2020 {
  author = "Banks";
  description = "Criminals: Organised Crime Gang Uniform";

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
