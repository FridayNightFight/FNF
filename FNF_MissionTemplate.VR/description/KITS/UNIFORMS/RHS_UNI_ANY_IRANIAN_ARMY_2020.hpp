#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_KRG_O_U_CombatUniform_01_DDPM", "UK3CB_KRG_B_U_CombatUniform_02_DDPM"

#define VEST "UK3CB_TKA_B_V_GA_LITE_WDL"
#define VEST_LEADER "UK3CB_TKA_B_V_GA_HEAVY_WDL"
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT "UK3CB_V_Pilot_Vest"

#define HELMET "UK3CB_KRG_O_H_6b27m_DES"
#define HELMET_CMDR "UK3CB_KRG_B_H_Beret_OFF"
#define HELMET_RECON "UK3CB_KRG_B_H_BoonieHat_DDPM"
#define HELMET_CREWMAN "UK3CB_ARD_B_H_Crew_Cap_Ess"
#define HELMET_PILOT "UK3CB_KRG_O_H_hgu56p_tan"

#define BACKPACK "B_Kitbag_cbr"
#define BACKPACK_RADIO "UK3CB_B_O_Alice_Radio_Backpack"
#define BACKPACK_AR "UK3CB_LSM_B_B_CARRYALL_KHK"
#define BACKPACK_AT "UK3CB_LSM_B_B_CARRYALL_KHK"
#define BACKPACK_MEDIC "UK3CB_KRG_O_B_FieldPack_MED"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_ANY_IRANIAN_ARMY_2020 {
  author = "Mazz38";
  description = "ANY: Modern Iranian Forces ARID LEAF Camouflage";

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
    uniform[] = {"UK3CB_KRG_B_U_Officer_01_DDPM"};
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
    uniform[] = {"UK3CB_KRG_B_U_Crew_Uniform_02_DDPM"};
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
    uniform[] = {"UK3CB_KRG_B_U_H_Pilot_Uniform_01"};
  };

  class MED : BASE {
    vest[] = {VEST_MEDIC};
    backpack[] = {BACKPACK_MEDIC};
  };
};
