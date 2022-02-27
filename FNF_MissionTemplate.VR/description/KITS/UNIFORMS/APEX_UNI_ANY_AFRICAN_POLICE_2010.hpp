#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_ADP_B_U_CombatUniform_DPM_GRY", "UK3CB_ADP_B_U_QRF_CombatUniform_GRY"

#define VEST "rhsgref_chestrig", "V_TacVest_gen_F"
#define VEST_LEADER "rhsgref_otv_khaki"
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "rhssaf_helmet_m97_olive_nocamo"
#define HELMET_CMDR "UK3CB_ADP_B_H_Beret"
#define HELMET_RECON "UK3CB_ABP_B_H_Patrolcap_UCC"
#define HELMET_CREWMAN "UK3CB_ABP_B_H_Patrolcap_UCC"
#define HELMET_PILOT "UK3CB_TKA_O_H_zsh7a_mike_Des"

#define BACKPACK "B_AssaultPack_sgg"
#define BACKPACK_RADIO "TFAR_rt1523g_sage"
#define BACKPACK_AR "B_Carryall_oucamo"
#define BACKPACK_AT "rhs_rpg_empty"
#define BACKPACK_MEDIC "B_FieldPack_oucamo"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class APEX_UNI_ANY_AFRICAN_POLICE_2010 {
  author = "Mazz38";
  description = "ANY: Modern African POLICE Desert Camouflage";

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
  };

  class MED : BASE {
    vest[] = {VEST_MEDIC};
    backpack[] = {BACKPACK_MEDIC};
  };
};
