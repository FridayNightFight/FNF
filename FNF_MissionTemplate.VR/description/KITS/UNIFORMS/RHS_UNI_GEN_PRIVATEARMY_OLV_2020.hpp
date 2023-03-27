#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_CW_US_B_Early_U_CombatUniform_01_OLI", "UK3CB_CW_US_B_Early_U_CombatUniform_02_OLI", "UK3CB_CW_US_B_Early_U_CombatUniform_03_OLI"

#define VEST "V_BandollierB_oli"
#define VEST_LEADER "V_BandollierB_oli"
#define VEST_AR "V_BandollierB_oli"
#define VEST_MEDIC "V_BandollierB_oli"
#define VEST_CREWMAN "V_BandollierB_oli"
#define VEST_PILOT "V_BandollierB_oli"

#define HELMET "UK3CB_TKA_I_H_SSh68_Oli", "UK3CB_LSM_B_H_SSh68_OLI"
#define HELMET_CMDR "UK3CB_TKA_I_H_Patrolcap_OLI"
#define HELMET_RECON "UK3CB_TKA_I_H_Patrolcap_OLI"
#define HELMET_CREWMAN "H_HelmetCrew_I"
#define HELMET_PILOT "rhsusf_hgu56p_mask_green", "rhsusf_hgu56p_visor_mask_green"

#define BACKPACK "UK3CB_KDF_B_B_Sidor_RIF_OLI"
#define BACKPACK_RADIO "UK3CB_B_B_Backpack_Radio_Chem_OLI"
#define BACKPACK_AR "UK3CB_B_TacticalPack_Oli"
#define BACKPACK_AT "UK3CB_B_TacticalPack_Oli"
#define BACKPACK_MEDIC "UK3CB_KDF_B_B_Sidor_MD_OLI"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_GEN_PRIVATEARMY_OLV_2020 {
  author = "Banks";
  description = "Private Army: Generic Military Olive Camoflage";

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
