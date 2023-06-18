#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_AAF_B_U_CombatUniform_DIGI_GRN", "UK3CB_AAF_B_U_CombatUniform_Shortsleeve_Digi_Mix_01", "UK3CB_AAF_B_U_CombatUniform_Digi_Mix_01", "UK3CB_AAF_B_U_CombatUniform_Shortsleeve_DIGI_GRN", "UK3CB_AAF_B_U_CombatUniform_Shortsleeve_Digi_Mix_02", "UK3CB_AAF_B_U_CombatUniform_Digi_Mix_02"

#define VEST "UK3CB_AAF_O_V_Eagle_RIF_DIGI_GRN", "UK3CB_AAF_I_V_Falcon_2_DIGI_GRN"
#define VEST_LEADER "UK3CB_AAF_O_V_Eagle_SL_DIGI_GRN", "UK3CB_AAF_I_V_Falcon_3_DIGI_GRN"
#define VEST_AR "UK3CB_AAF_O_V_Eagle_MG_DIGI_GRN"
#define VEST_MEDIC "UK3CB_AAF_O_V_Eagle_MED_DIGI_GRN", "UK3CB_AAF_I_V_Falcon_9_DIGI_GRN"
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "UK3CB_AAF_I_H_MKVI_Helmet_B_GRN", "UK3CB_AAF_I_H_MKVI_Helmet_A_GRN", "UK3CB_AAF_I_H_MKVI_Helmet_B_BRN", "H_HelmetIA"
#define HELMET_CMDR "UK3CB_AAF_B_H_Beret_Army"
#define HELMET_RECON "H_Booniehat_dgtl"
#define HELMET_CREWMAN "H_HelmetCrew_I"
#define HELMET_PILOT "H_CrewHelmetHeli_I"

#define BACKPACK "UK3CB_AAF_B_B_FIELDPACK_DIGI_GRN"
#define BACKPACK_RADIO "TFAR_anprc155"
#define BACKPACK_AR "UK3CB_AAF_B_B_CARRYALL_DIGI_GRN"
#define BACKPACK_AT "UK3CB_AAF_B_B_CARRYALL_DIGI_GRN"
#define BACKPACK_MEDIC "B_AssaultPack_dgtl"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_ID_AAF_2020 {
  author = "Mazz38";
  description = "AAF: Modern Altis Armed Forces DIGITAL Camouflage";

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
    uniform[] = {"UK3CB_AAF_B_U_Officer_DIGI_GRN"};
  };

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
    uniform[] = {"UK3CB_TKA_B_U_CombatUniform_Ghillie_DES_MARPAT"};
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
