#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_GAF_B_U_CombatUniform_01_DIGI", "UK3CB_GAF_B_U_CombatUniform_02_DIGI", "UK3CB_GAF_B_U_CombatUniform_03_DIGI", "UK3CB_GAF_B_U_SF_CombatSmock_07_MULTICAM_OLIVE", "UK3CB_GAF_B_U_SF_CombatSmock_04_MULTICAM_OLIVE"

#define VEST "UK3CB_GAF_B_MBAV_RIFLEMAN_DIGI", "rhsusf_mbav_rifleman", "UK3CB_GAF_B_MBAV_RIFLEMAN_DIGI_OLI"
#define VEST_LEADER VEST
#define VEST_AR "UK3CB_GAF_B_MBAV_MG_TAN_02", "UK3CB_GAF_B_MBAV_MG_TAN_01", "UK3CB_GAF_B_MBAV_MG_OLI_02", "UK3CB_GAF_B_MBAV_MG_OLI_01", "UK3CB_GAF_B_MBAV_MG_DIGI_02", "UK3CB_GAF_B_MBAV_MG_DIGI_03"
#define VEST_MEDIC "UK3CB_GAF_B_MBAV_MEDIC_DIGI_OLI_02", "UK3CB_GAF_B_MBAV_MEDIC_DIGI_OLI_03"
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "UK3CB_GAF_B_H_Opscore_Mar_OLI_02", "UK3CB_GAF_B_H_Opscore_Mar_OLI_01", "UK3CB_GAF_B_H_Opscore_Mar_TAN_01", "UK3CB_GAF_B_H_Opscore_Mar_TAN_02", "rhsusf_ach_helmet_camo_ocp"
#define HELMET_CMDR "rhsusf_patrolcap_ocp"
#define HELMET_RECON "rhs_Booniehat_ocp"
#define HELMET_CREWMAN "rhsusf_cvc_ess"
#define HELMET_PILOT "rhsusf_hgu56p_visor_mask_green"

#define BACKPACK "UK3CB_GAF_B_B_RIF_DIGI", "UK3CB_GAF_B_B_RIF_OLI", "UK3CB_GAF_B_B_RIF_TAN"
#define BACKPACK_RADIO "TFAR_rt1523g_big_bwmod"
#define BACKPACK_AR "UK3CB_GAF_B_B_ENG_DIGI"
#define BACKPACK_AT "UK3CB_GAF_B_B_ENG_DIGI"
#define BACKPACK_MEDIC "UK3CB_GAF_B_B_RIF_MED_DIGI", "UK3CB_GAF_B_B_RIF_MED_OLI", "UK3CB_GAF_B_B_RIF_MED_TAN"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_NATO_GROZOVIAN_2020 {
  author = "Mazz38";
  description = "GZ: Modern NATO Backed Grozovian Ruthenian ARMY GAF DIGITAL Camouflage";

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
