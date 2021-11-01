#include "..\undef.hpp" // Reset defines

#define UNIFORM "rhsgref_uniform_tigerstripe"

#define VEST "rhsusf_mbav_rifleman"
#define VEST_LEADER "rhsusf_mbav_grenadier"
#define VEST_AR "rhsusf_mbav_mg"
#define VEST_MEDIC "rhsusf_mbav_medic"
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "rhsusf_opscore_mar_ut"
#define HELMET_CMDR "H_Beret_blk"
#define HELMET_RECON "H_Booniehat_oli"
#define HELMET_CREWMAN "rhsusf_cvc_green_ess"
#define HELMET_PILOT "rhsusf_hgu56p_visor_mask_skull"

#define BACKPACK "B_AssaultPack_blk"
#define BACKPACK_RADIO "TFAR_rt1523g_black"
#define BACKPACK_AR "B_Carryall_oli"
#define BACKPACK_AT "B_Carryall_oli"
#define BACKPACK_MEDIC "rhs_medic_bag"


class RHS_UNI_ID_NAVSOG_2010 {
  author = "Mazz38";
  description = "INDEPENDENT FACTION: 2010 PHILIPPINE Naval Special Operations Command Tigerstripe Camouflage";

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
  };

  class MED : BASE {
    vest[] = {VEST_MEDIC};
    backpack[] = {BACKPACK_MEDIC};
  };
};
