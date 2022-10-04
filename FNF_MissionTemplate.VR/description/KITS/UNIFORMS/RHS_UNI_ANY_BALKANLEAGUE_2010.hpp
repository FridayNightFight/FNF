#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_ADE_O_U_04_F", "UK3CB_ADE_O_U_04_F", "UK3CB_ADE_O_U_04_C", "UK3CB_ADE_O_U_04", "UK3CB_ADE_O_U_04_D", "UK3CB_ADE_O_U_02_F"

#define VEST "V_TacVest_blk", "V_HarnessO_gry"
#define VEST_LEADER "V_HarnessOGL_gry"
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "UK3CB_ANP_B_H_6b27m_bala_GREY", "UK3CB_ANP_B_H_6b27m_ess_bala_GREY", "UK3CB_ANP_B_H_6b27m_GREY", "UK3CB_TKA_I_H_SSh68_Grey"
#define HELMET_CMDR "UK3CB_ADA_B_H_Off_Beret"
#define HELMET_RECON "UK3CB_H_Beanie_02_GRY"
#define HELMET_CREWMAN "rhs_tsh4_ess_bala"
#define HELMET_PILOT "UK3CB_H_Crew_Helmet"

#define BACKPACK "UK3CB_B_Small_Pack"
#define BACKPACK_RADIO "UK3CB_CW_SOV_O_LATE_B_ASS_BERGEN_Radio"
#define BACKPACK_AR "rhs_tortila_grey"
#define BACKPACK_AT "rhs_tortila_grey"
#define BACKPACK_MEDIC "UK3CB_B_TacticalPack_Med_Oli"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_ANY_BALKANLEAGUE_2010 {
  author = "Mazz38";
  description = "BDL: Fictional Balkan Defense League DUCK HUNTER Camouflage";

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
