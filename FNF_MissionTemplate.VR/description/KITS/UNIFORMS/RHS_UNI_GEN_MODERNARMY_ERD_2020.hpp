#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_CHD_B_U_CombatUniform_08"

#define VEST "rhsgref_TacVest_ERDL"
#define VEST_LEADER "rhsgref_TacVest_ERDL"
#define VEST_AR "rhsgref_TacVest_ERDL"
#define VEST_MEDIC "rhsgref_TacVest_ERDL"
#define VEST_CREWMAN "rhsgref_TacVest_ERDL"
#define VEST_PILOT "rhsgref_TacVest_ERDL"

#define HELMET "rhsgref_helmet_pasgt_erdl"
#define HELMET_CMDR "UK3CB_LSM_B_H_Field_Cap_WDL"
#define HELMET_RECON "UK3CB_LSM_B_H_Field_Cap_WDL"
#define HELMET_CREWMAN "H_HelmetCrew_I"
#define HELMET_PILOT "rhsusf_hgu56p_mask_green", "rhsusf_hgu56p_visor_mask_green"

#define BACKPACK "UK3CB_LDF_B_B_ASS_WDL"
#define BACKPACK_RADIO "UK3CB_B_B_Backpack_Radio_Chem_OLI"
#define BACKPACK_AR "UK3CB_LNM_B_B_CARRYALL_WDL_03"
#define BACKPACK_AT "UK3CB_LNM_B_B_CARRYALL_WDL_03"
#define BACKPACK_MEDIC "UK3CB_LDF_B_B_ASS_WDL"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_GEN_MODERNARMY_ERD_2020 {
  author = "Banks";
  description = "Modern Army: Generic Military ERDL Camoflage";

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
