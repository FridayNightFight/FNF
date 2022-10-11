#include "..\undef.hpp" // Reset defines

#define UNIFORM "rhs_uniform_g3_mc"

#define VEST "rhsusf_spc_patchless_radio", "rhsusf_spc_patchless", "rhsusf_mbav_rifleman", "rhsusf_mbav_light"
#define VEST_LEADER "rhsusf_spcs_ocp_squadleader"
#define VEST_AR "rhs_6b23_digi_vydra_3m"
#define VEST_MEDIC "rhsusf_iotv_ocp_Medic", "rhsusf_mbav_medic"
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "rhsusf_opscore_mc_cover", "rhsusf_opscore_mc", "rhsusf_ach_helmet_camo_ocp"
#define HELMET_CMDR "rhsusf_patrolcap_ocp"
#define HELMET_RECON "rhs_Booniehat_ocp"
#define HELMET_CREWMAN "rhsusf_cvc_ess"
#define HELMET_PILOT "rhsusf_hgu56p_visor_mask_green"

#define BACKPACK "B_Kitbag_rgr", "B_Kitbag_sgg", "B_Kitbag_tan", "B_Kitbag_mcamo"
#define BACKPACK_RADIO "TFAR_mr3000_multicam"
#define BACKPACK_AR "B_Carryall_mcamo", "B_Carryall_cbr"
#define BACKPACK_AT "B_Carryall_mcamo"
#define BACKPACK_MEDIC "B_FieldPack_cbr", "B_TacticalPack_mcamo"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_NATO_UKRAINIAN_2010 {
  author = "Mazz38";
  description = "UA: Modern Ukrainian ARMY Multicam Camouflage";

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
