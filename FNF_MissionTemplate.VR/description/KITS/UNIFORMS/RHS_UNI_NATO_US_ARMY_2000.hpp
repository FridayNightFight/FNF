#include "..\undef.hpp" // Reset defines

#define UNIFORM "rhsgref_uniform_3color_desert"

#define VEST "UK3CB_CW_US_B_LATE_V_PASGT_Rif_Vest"
#define VEST_LEADER VEST
#define VEST_AR "UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest"
#define VEST_MEDIC "UK3CB_CW_US_B_LATE_V_PASGT_Medic_Vest"
#define VEST_CREWMAN "UK3CB_CW_US_B_LATE_V_PASGT_Crew_Vest"
#define VEST_PILOT "UK3CB_V_Pilot_Vest"

#define HELMET "UK3CB_CW_US_B_LATE_H_PASGT_01_WDL", "rhsgref_helmet_pasgt_3color_desert"
#define HELMET_CMDR "UK3CB_CW_US_B_LATE_H_JNR_OFF_Patrol_Cap_WDL_01"
#define HELMET_RECON "rhsusf_protech_helmet_rhino_ess"
#define HELMET_CREWMAN "rhsusf_cvc_green_helmet"
#define HELMET_PILOT "UK3CB_H_Pilot_Helmet"

#define BACKPACK "UK3CB_CW_US_B_LATE_B_RIF"
#define BACKPACK_RADIO "UK3CB_B_B_Radio_Backpack"
#define BACKPACK_AR "rhsgref_hidf_alicepack"
#define BACKPACK_AT "rhsgref_hidf_alicepack"
#define BACKPACK_MEDIC "UK3CB_B_US_Medic_Backpack"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_NATO_US_ARMY_2000 {
  author = "Mazz38";
  description = "USA: 2000s American ARMY Iraqi Freedom Camouflage";

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
    uniform[] = {"UK3CB_CW_US_B_LATE_U_JNR_OFFICER_Uniform_01_WDL"};
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
    uniform[] = {"UK3CB_CW_US_B_LATE_U_H_Pilot_Uniform_01_NATO"};
  };

  class MED : BASE {
    vest[] = {VEST_MEDIC};
    backpack[] = {BACKPACK_MEDIC};
  };
};
