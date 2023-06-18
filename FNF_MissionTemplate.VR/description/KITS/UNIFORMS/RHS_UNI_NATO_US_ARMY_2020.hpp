#include "..\undef.hpp" // Reset defines

#define UNIFORM "rhs_uniform_acu_oefcp"

#define VEST "rhsusf_iotv_ocp_Rifleman"
#define VEST_LEADER "rhsusf_iotv_ocp_Teamleader"
#define VEST_AR "rhsusf_iotv_ocp_SAW"
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "rhsusf_ach_helmet_headset_ess_ocp"
#define HELMET_CMDR "rhsusf_patrolcap_ocp"
#define HELMET_RECON "rhs_Booniehat_ocp"
#define HELMET_CREWMAN "rhsusf_cvc_green_ess"
#define HELMET_PILOT "rhsusf_hgu56p_visor_mask"

#define BACKPACK "rhsusf_assault_eagleaiii_ocp"
#define BACKPACK_RADIO "TFAR_rt1523g"
#define BACKPACK_AR "B_Carryall_mcamo"
#define BACKPACK_AT "B_Carryall_mcamo"
#define BACKPACK_MEDIC "B_Kitbag_mcamo"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_NATO_US_ARMY_2020 {
  author = "Mazz38";
  description = "USA: Modern American ARMY Multicam Camouflage";

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