#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_TKP_I_U_CIB_CombatUniform_DBLU"

#define VEST "V_TacVest_blk_POLICE"
#define VEST_LEADER "V_TacVest_blk_POLICE"
#define VEST_AR "V_TacVest_blk_POLICE"
#define VEST_MEDIC "V_TacVest_blk_POLICE"
#define VEST_CREWMAN "V_TacVest_blk_POLICE"
#define VEST_PILOT "V_TacVest_blk_POLICE"

#define HELMET "UK3CB_TKA_O_H_6b27m_Blue", "UK3CB_TKA_O_H_6b27m_ESS_Blue", "H_Bandanna_blu", "H_Cap_blu", "H_MilCap_blue"
#define HELMET_CMDR "UK3CB_UN_B_H_Beret"
#define HELMET_RECON "UK3CB_UN_B_H_Beret"
#define HELMET_CREWMAN "H_HelmetCrew_I"
#define HELMET_PILOT "rhsusf_hgu56p_mask_green", "rhsusf_hgu56p_visor_mask_green"

#define BACKPACK "UK3CB_B_Invisible"
#define BACKPACK_RADIO "TFAR_rt1523g_black"
#define BACKPACK_AR "UK3CB_B_Invisible"
#define BACKPACK_AT "UK3CB_B_Invisible"
#define BACKPACK_MEDIC "UK3CB_B_Invisible"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_GEN_POLICE_BLU_2020 {
  author = "Banks";
  description = "Police: Blue Uniform";

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
  class PL : SGT {headgear[] = {HELMET_CMDR};};

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
