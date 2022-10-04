#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_ADE_O_U_02", "UK3CB_ADE_O_U_02_B"

#define VEST "rhs_chicom_khk"
#define VEST_LEADER "rhs_chicom_khk"
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "UK3CB_ABP_B_H_6b27m_DES", "UK3CB_ADA_B_H_6b27m_DPP"
#define HELMET_CMDR "UK3CB_ADE_O_H_Turban_01_1"
#define HELMET_RECON "UK3CB_H_Turban_Facewrap_01_Blk"
#define HELMET_CREWMAN "UK3CB_H_Beanie_02_BLK"
#define HELMET_PILOT "UK3CB_H_Beanie_02_BLK"

#define BACKPACK "UK3CB_B_TacticalPack_Oli"
#define BACKPACK_RADIO "TFAR_rt1523g_sage"
#define BACKPACK_AR "UK3CB_B_Largepack_Des"
#define BACKPACK_AT "rhs_rpg_empty"
#define BACKPACK_MEDIC "UK3CB_UN_B_B_ASS"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_ID_AFRICAN_MILITIA_2010 {
  author = "Mazz38";
  description = "ID: Modern African MILITIA Desert Camouflage";

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
