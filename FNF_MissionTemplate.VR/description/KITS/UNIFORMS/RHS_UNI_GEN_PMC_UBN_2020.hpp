#include "..\undef.hpp" // Reset defines

#define UNIFORM "rhs_uniform_abu"

#define VEST "UK3CB_AAF_B_V_TacVest_DIGI_BLK", "V_PlateCarrier1_blk", "UK3CB_AAF_O_V_Eagle_CREW_DIGI_BLK", "UK3CB_TKA_B_V_GA_LITE_BLK", "rhsusf_iotv_ucp_SAW", "V_HarnessOGL_gry", "V_BandollierB_blk"
#define VEST_LEADER VEST
#define VEST_AR "UK3CB_AAF_B_V_TacVest_DIGI_BLK"
#define VEST_MEDIC "rhsusf_iotv_ucp_Medic"
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST
#define VEST_GREN "rhsusf_iotv_ucp_Grenadier"

#define HELMET "UK3CB_ANP_B_H_6b27m_GREY", "UK3CB_ANP_B_H_6b27m_ess_GREY", "rhsusf_ach_helmet_headset_ucp", "H_Bandanna_surfer_blk", "rhssaf_bandana_digital_desert", "UK3CB_H_Beanie_02_BLK", "UK3CB_H_Beanie_02_GRY", "UK3CB_LSM_B_H_BoonieHat_BLK", "rhsusf_opscore_bk"
#define HELMET_CMDR "UK3CB_LSM_B_H_Field_Cap_BLK"
#define HELMET_RECON "UK3CB_ADA_B_H_BoonieHat_CC"
#define HELMET_CREWMAN "H_HelmetCrew_I"
#define HELMET_PILOT "rhsusf_hgu56p_mask_green", "rhsusf_hgu56p_visor_mask_green"

#define BACKPACK "B_FieldPack_oucamo"
#define BACKPACK_RADIO "UK3CB_B_B_Backpack_Radio_Chem"
#define BACKPACK_AR "B_Carryall_oucamo"
#define BACKPACK_AT "B_Carryall_cbr"
#define BACKPACK_MEDIC "B_Carryall_oucamo"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_GEN_PMC_UBN_2020 {
  author = "Mallen/Banks";
  description = "PMC: Modern Private Military Company Urban Camouflage";

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

  class GR : BASE {
  vest[] = {VEST_GREN};

  };

  class GRIR : GR {};

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
