#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_ANA_B_U_CombatUniform_01_GCAM", "UK3CB_ANA_B_U_CombatUniform_Shortsleeve_01_GCAM", "UK3CB_ANA_B_U_CombatUniform_02_GCAM", "UK3CB_ANA_B_U_CombatUniform_Shortsleeve_02_GCAM"

#define VEST "UK3CB_ANA_B_V_RFL_Vest_GCAM_01", "UK3CB_ANA_B_V_RFL_Vest_TAN_01"
#define VEST_LEADER "UK3CB_ANA_B_V_SL_Vest_GCAM_01", "UK3CB_ANA_B_V_SL_Vest_TAN_01"
#define VEST_AR "UK3CB_ANA_B_V_MG_Vest_GCAM_01", "UK3CB_ANA_B_V_MG_Vest_TAN_01"
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT "V_TacVest_oli"

#define HELMET "UK3CB_ANA_B_H_MICH_BARE_DES", "UK3CB_ANA_B_H_MICH_BARE_DES_Headset"
#define HELMET_CMDR "UK3CB_ANA_B_H_Patrolcap_spec4ce"
#define HELMET_RECON "H_Booniehat_mcamo"
#define HELMET_CREWMAN "H_HelmetCrew_I"
#define HELMET_PILOT "UK3CB_H_Pilot_Helmet"

#define BACKPACK "UK3CB_ANA_B_B_RIF"
#define BACKPACK_RADIO "UK3CB_B_B_Backpack_Radio_Chem"
#define BACKPACK_AR "B_Carryall_cbr"
#define BACKPACK_AT "B_Carryall_cbr"
#define BACKPACK_MEDIC "UK3CB_B_Backpack_Med"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_NATO_AFGH_APU_2020 {
  author = "Mazz38";
  description = "AFGH: Modern Afghan AFGHANISTAN PARTNERING UNIT Ghost Kilo Camouflage";

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
    uniform[] = {"UK3CB_ANA_B_U_H_Pilot_DES"};
  };

  class MED : BASE {
    vest[] = {VEST_MEDIC};
    backpack[] = {BACKPACK_MEDIC};
  };
};
