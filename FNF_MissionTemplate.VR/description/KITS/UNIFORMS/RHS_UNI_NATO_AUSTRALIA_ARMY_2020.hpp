#include "..\undef.hpp" // Reset defines

#define UNIFORM "rhs_uniform_g3_mc"

#define VEST "rhsusf_iotv_ocp_Rifleman"
#define VEST_LEADER "rhsusf_iotv_ocp_Squadleader", "rhsusf_iotv_ocp_Teamleader"
#define VEST_AR "rhsusf_iotv_ocp_SAW"
#define VEST_MEDIC "rhsusf_iotv_ocp_Medic"
#define VEST_CREWMAN "rhsusf_iotv_ocp_Repair"
#define VEST_PILOT "UK3CB_V_Pilot_Vest_MTP"

#define HELMET "rhsusf_ach_helmet_camo_ocp"
#define HELMET_CMDR "rhsusf_patrolcap_ocp"
#define HELMET_RECON "UK3CB_LNM_B_H_BoonieHat_MULTICAM"
#define HELMET_CREWMAN "rhsusf_cvc_ess"
#define HELMET_PILOT "rhsusf_hgu56p_visor_mask_tan"

#define BACKPACK "B_AssaultPack_mcamo", "B_AssaultPack_cbr"
#define BACKPACK_RADIO "TFAR_rt1523g"
#define BACKPACK_AR "B_Carryall_mcamo"
#define BACKPACK_AT "B_Carryall_mcamo"
#define BACKPACK_MEDIC "UK3CB_KRG_B_B_FieldPack_SF_MED"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_NATO_AUSTRALIA_ARMY_2020 {
  author = "Mazz38";
  description = "AUS: Modern Australia ARMY Multicam Camouflage";

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
