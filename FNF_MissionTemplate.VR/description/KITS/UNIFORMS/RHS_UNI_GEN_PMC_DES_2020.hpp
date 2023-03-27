#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_ADM_B_U_Shirt_Pants_01_BRN_CC", "UK3CB_ADM_B_U_Shirt_Pants_01_BRN_TCC", "UK3CB_ADM_B_U_Shirt_Pants_01_BRN_DDPM"

#define VEST "UK3CB_KRG_B_V_TacVest_DES", "UK3CB_KRG_B_V_TacVest_DES_DIGI", "V_TacVest_khk", "UK3CB_ADA_B_V_TacVest_KHK", "rhsusf_plateframe_machinegunner", "V_BandollierB_khk"
#define VEST_LEADER VEST
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "UK3CB_ABP_B_H_6b27m_DES", "UK3CB_ABP_B_H_6b27m_ess_DES", "rhsusf_ach_bare_des_headset", "H_Bandanna_sand", "H_Watchcap_cbr", "H_MilCap_gry"
#define HELMET_CMDR "H_Cap_tan"
#define HELMET_RECON "UK3CB_ADA_B_H_BoonieHat_CC"
#define HELMET_CREWMAN "H_HelmetCrew_I"
#define HELMET_PILOT "rhsusf_hgu56p_mask_green", "rhsusf_hgu56p_visor_mask_green"

#define BACKPACK "UK3CB_TKA_B_B_ASS"
#define BACKPACK_RADIO "UK3CB_B_B_Backpack_Radio_Chem"
#define BACKPACK_AR "B_Carryall_cbr"
#define BACKPACK_AT "B_Carryall_cbr"
#define BACKPACK_MEDIC "UK3CB_KRG_B_B_FieldPack_SF_MED"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_GEN_PMC_DES_2020 {
  author = "Mallen/Banks";
  description = "PMC: Modern Private Military Company Desert Camouflage";

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
