#include "..\undef.hpp" // Reset defines

#define UNIFORM "rhsgref_uniform_para_ttsko_urban"

#define VEST "rhsgref_6b23_ttsko_mountain_rifleman"
#define VEST_LEADER "rhsgref_6b23_ttsko_mountain_officer"
#define VEST_AR "rhsgref_6b23_ttsko_mountain_rifleman"
#define VEST_MEDIC "rhsgref_6b23_ttsko_mountain_medic"
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "rhsgref_ssh68_ttsko_dark", "rhs_ssh68_2"
#define HELMET_CMDR "H_Bandanna_khk_hs"
#define HELMET_RECON "rhs_beanie_green"
#define HELMET_CREWMAN "rhs_tsh4_ess_bala"
#define HELMET_PILOT "rhs_zsh7a_mike_green_alt"

#define BACKPACK "rhs_assault_umbts", "rhs_assault_umbts_engineer_empty"
#define BACKPACK_RADIO "TFAR_rt1523g_sage"
#define BACKPACK_AR "rhs_tortila_olive", "rhs_tortila_olive"
#define BACKPACK_AT "rhs_tortila_olive"
#define BACKPACK_MEDIC "rhs_assault_umbts_engineer_empty"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_ANY_UKRAINIAN_ARMY_2014 {
  author = "Mazz38";
  description = "UA: Modern Ukrainian ARMY URBAN Camouflage";

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
