#include "..\undef.hpp" // Reset defines

#define UNIFORM "rhs_uniform_cu_ocp"

#define VEST "rhsusf_iotv_ocp_Rifleman"
#define VEST_LEADER "rhsusf_iotv_ocp_Grenadier"
#define VEST_AR "rhsusf_iotv_ocp_SAW"
#define VEST_MEDIC "rhsusf_iotv_ocp_Medic"
#define VEST_CREWMAN "rhsusf_spcs_ocp_crewman"
#define VEST_PILOT "rhsusf_plateframe_light"

#define HELMET "rhsusf_ach_helmet_headset_ess_ocp_alt"
#define HELMET_CREWMAN "rhsusf_cvc_alt_helmet"
#define HELMET_PILOT "rhsusf_hgu56p_visor_tan"

#define BACKPACK "B_AssaultPack_cbr"
#define BACKPACK_RADIO "TFAR_rt1523g_black"
#define BACKPACK_AR "B_Carryall_cbr"
#define BACKPACK_AT "B_Kitbag_cbr"
#define BACKPACK_MEDIC "B_FieldPack_cbr"


class RHS_UNI_US_ARMY_OCP {
  author = "FNF";
  description = "USA: US ARMY OCP Camouflage";

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

  class MGA : BASE {};

  class MG : MGA {};

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

  class RIS : BASE {};

  class DM : BASE {};

  class SNP : BASE {};

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
  };

  class MED : BASE {
    vest[] = {VEST_MEDIC};
    backpack[] = {BACKPACK_MEDIC};
  };
};
