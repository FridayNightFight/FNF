#include "..\undef.hpp" // Reset defines

#define UNIFORM "rhssaf_uniform_m10_digital_desert"

#define VEST "rhssaf_vest_md12_digital_desert"
#define VEST_LEADER VEST
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "rhssaf_helmet_m97_black_nocamo_black_ess"
#define HELMET_CMDR "H_Beret_blk"
#define HELMET_RECON "H_ShemagOpen_khk"
#define HELMET_CREWMAN "rhs_tsh4"
#define HELMET_PILOT "rhs_zsh7a_mike_alt"

#define BACKPACK "B_Kitbag_cbr"
#define BACKPACK_RADIO "TFAR_anprc155_coyote"
#define BACKPACK_AR "B_Carryall_khk"
#define BACKPACK_AT "B_Carryall_khk"
#define BACKPACK_MEDIC "rhs_medic_bag"


class RHS_UNI_ID_MEC_2010 {
  author = "Mazz38";
  description = "INDEPENDENT FACTION: 2010 Middle Eastern Coalition ARMY Desert Camouflage";

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
