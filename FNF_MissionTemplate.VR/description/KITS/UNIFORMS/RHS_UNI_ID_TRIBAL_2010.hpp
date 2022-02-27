#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_TKM_B_U_01", "UK3CB_TKM_B_U_01_B", "UK3CB_TKM_B_U_01_C", "UK3CB_TKC_C_U_03_E", "UK3CB_TKC_C_U_06_E", "UK3CB_TKC_C_U_01_E"

#define VEST "rhs_chicom_khk"
#define VEST_LEADER VEST
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "UK3CB_TKM_O_H_Turban_01_1", "UK3CB_TKM_O_H_Turban_03_1", "UK3CB_TKM_O_H_Turban_04_1", "UK3CB_TKM_O_H_Turban_05_1", "UK3CB_TKM_B_H_Turban_03_1", "UK3CB_TKM_B_H_Turban_04_1"
#define HELMET_CMDR "UK3CB_TKM_O_H_Turban_02_1"
#define HELMET_RECON "UK3CB_H_Mil_Turban_Wrap"
#define HELMET_CREWMAN "UK3CB_H_Mil_Turban_Wrap"
#define HELMET_PILOT "UK3CB_H_Mil_Turban_Wrap"

#define BACKPACK "rhs_sidor"
#define BACKPACK_RADIO "TFAR_rt1523g_fabric"
#define BACKPACK_AR "B_Carryall_oli"
#define BACKPACK_AT "rhs_rpg_empty"
#define BACKPACK_MEDIC "UK3CB_TKP_I_B_ASS_MED_TAN"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_ID_TRIBAL_2010 {
  author = "Mazz38";
  description = "ID: 2010 Tribal Militia";

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
