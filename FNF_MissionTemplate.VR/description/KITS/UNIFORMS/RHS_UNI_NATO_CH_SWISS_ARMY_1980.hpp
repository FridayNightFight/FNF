#include "..\undef.hpp" // Reset defines

#define UNIFORM "rhsgref_uniform_alpenflage"

#define VEST "rhsgref_alice_webbing"
#define VEST_LEADER VEST
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT "UK3CB_V_Pilot_Vest"

#define HELMET "UK3CB_MDF_B_H_M1", "UK3CB_MDF_B_H_M1_ALT"
#define HELMET_CMDR "UK3CB_NFA_B_H_M88_Field_Cap_ALP"
#define HELMET_RECON "rhsgref_hat_m43cap_heer"
#define HELMET_CREWMAN "H_HelmetCrew_I"
#define HELMET_PILOT "UK3CB_H_Pilot_Helmet"

#define BACKPACK "UK3CB_B_Bedroll_Backpack"
#define BACKPACK_RADIO "UK3CB_B_B_Radio_Backpack"
#define BACKPACK_AR "rhsgref_hidf_alicepack"
#define BACKPACK_AT "rhsgref_hidf_alicepack"
#define BACKPACK_MEDIC "B_FieldPack_oli"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_NATO_CH_SWISS_ARMY_1980 {
  author = "Mazz38";
  description = "CH: 1980s Swiss ARMY Alpenflage Camouflage";

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
    uniform[] = {"UK3CB_CW_US_B_LATE_U_H_Pilot_Uniform_01_NATO"};
  };

  class MED : BASE {
    vest[] = {VEST_MEDIC};
    backpack[] = {BACKPACK_MEDIC};
    headgear[] = {"UK3CB_MDF_B_H_M1_MED", "UK3CB_MDF_B_H_M1_ALT_MED"};
  };
};
