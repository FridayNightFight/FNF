#include "..\undef.hpp" // Reset defines

#define UNIFORM "UK3CB_MEE_O_U_07_B", "UK3CB_MEE_O_U_07"

#define VEST "UK3CB_TKP_B_V_TacVest_Blk"
#define VEST_LEADER "UK3CB_TKP_B_V_TacVest_Blk"
#define VEST_AR "UK3CB_TKP_B_V_TacVest_Blk"
#define VEST_MEDIC "UK3CB_TKP_B_V_TacVest_Blk"
#define VEST_CREWMAN "UK3CB_TKP_B_V_TacVest_Blk"
#define VEST_PILOT "UK3CB_TKP_B_V_TacVest_Blk"

#define HELMET "UK3CB_ANP_B_H_6b27m_BLK", "UK3CB_ANP_B_H_6b27m_ess_BLK", "H_Bandanna_gry", "rhsusf_opscore_bk", "UK3CB_H_Beanie_02_BLK", "UK3CB_LSM_B_H_BoonieHat_BLK", "H_Cap_blk"
#define HELMET_CMDR "H_Beret_blk"
#define HELMET_RECON "H_Beret_blk"
#define HELMET_CREWMAN "rhsusf_opscore_bk_pelt"
#define HELMET_PILOT "rhsusf_hgu56p_black"

#define BACKPACK "UK3CB_B_Invisible"
#define BACKPACK_RADIO "TFAR_rt1523g_bwmod"
#define BACKPACK_AR "B_AssaultPack_blk"
#define BACKPACK_AT "UK3CB_B_Invisible"
#define BACKPACK_MEDIC "UK3CB_B_Invisible"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_GEN_POLICE_BLK_2020 {
  author = "Banks";
  description = "Police: Black Uniform";

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

  class AB: BASE {};

  class GR : BASE {};

  class GRIR : BASE {};

  class MGA : BASE {
    backpack[] = {BACKPACK_AR};
  };

  class MG : RI {
   
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
