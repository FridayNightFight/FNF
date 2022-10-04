#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_TKA_I_U_CombatUniform_03_TKA_Brush", "UK3CB_TKA_I_U_CombatUniform_02_TKA_Brush", "UK3CB_TKA_I_U_CombatUniform_01_TKA_Brush"

#define VEST "UK3CB_TKA_O_V_6b23_ml_Oli_TKA_Brush", "UK3CB_TKA_O_V_6b23_ML_6sh92_radio_Oli_TKA_Brush"
#define VEST_LEADER "UK3CB_TKA_O_V_6b23_ml_6sh92_vog_Oli_TKA_Brush"
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "UK3CB_TKA_O_H_6b7_1m_bala2_DES", "UK3CB_TKA_O_H_6b7_1m_bala1_TAN", "UK3CB_TKA_O_H_6b7_1m_ess_bala1_TAN"
#define HELMET_CMDR "UK3CB_TKA_B_H_Beret"
#define HELMET_RECON "UK3CB_H_Beanie_02_BRN"
#define HELMET_CREWMAN "UK3CB_ARD_B_H_Crew_Cap"
#define HELMET_PILOT "UK3CB_TKA_O_H_zsh7a_mike_Des"

#define BACKPACK "UK3CB_B_Alice_Medic_Bedroll_2_K", "UK3CB_B_Alice_Medic_Bedroll_K"
#define BACKPACK_RADIO "TFAR_anprc155_coyote"
#define BACKPACK_AR "UK3CB_B_Largepack_Des"
#define BACKPACK_AT "rhs_rpg_empty"
#define BACKPACK_MEDIC "UK3CB_B_Largepack_Med_Des"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_ID_TURKISH_ARMY_2010 {
  author = "Mazz38";
  description = "ID: Modern Turkish ARMY Desert Camouflage";

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
