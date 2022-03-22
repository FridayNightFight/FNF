#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_TKA_I_U_CombatUniform_02_OLI"

#define VEST "rhsgref_alice_webbing"
#define VEST_LEADER VEST
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT "UK3CB_V_Pilot_Vest"

#define HELMET "rhsgref_helmet_M1_liner"
#define HELMET_CMDR "UK3CB_TKA_I_H_Patrolcap_OLI"
#define HELMET_RECON "rhsgref_hat_m43cap_heer"
#define HELMET_CREWMAN "H_HelmetCrew_I"
#define HELMET_PILOT "UK3CB_H_Pilot_Helmet"

#define BACKPACK "UK3CB_B_Alice_K"
#define BACKPACK_RADIO "UK3CB_B_B_Radio_Backpack"
#define BACKPACK_AR "rhsgref_hidf_alicepack"
#define BACKPACK_AT "rhsgref_hidf_alicepack"
#define BACKPACK_MEDIC "B_FieldPack_oli"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_NATO_DE_WESTGERMAN_1980 {
  author = "Mazz38";
  description = "DE: 1980s West German ARMY Feldgrau Camouflage";

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
    headgear[] = {"UK3CB_MDF_B_H_M1_MED"};
  };
};
