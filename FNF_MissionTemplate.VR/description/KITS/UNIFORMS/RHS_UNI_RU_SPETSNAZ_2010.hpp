#include "..\undef.hpp" // Reset defines

#define UNIFORM "rhs_uniform_gorka_r_g_gloves", "rhs_uniform_gorka_r_y_gloves"

#define VEST "rhs_vydra_3m"
#define VEST_LEADER VEST
#define VEST_AR VEST
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "rhs_altyn_bala", "rhs_altyn_novisor_bala", "rhs_altyn_novisor_ess_bala"
#define HELMET_CMDR "rhs_beanie"
#define HELMET_RECON "rhs_beanie_green"
#define HELMET_CREWMAN "rhs_tsh4_ess_bala"
#define HELMET_PILOT "rhs_zsh7a_mike_green_alt"

#define BACKPACK "rhs_rk_sht_30_olive"
#define BACKPACK_RADIO "TFAR_mr3000_rhs"
#define BACKPACK_AR "rhs_tortila_olive"
#define BACKPACK_AT "rhs_tortila_olive"
#define BACKPACK_MEDIC "rhs_medic_bag"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_RU_SPETSNAZ_2010 {
  author = "Mazz38";
  description = "RU: Modern Russian Spetsnaz Gorka";

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
  };

  class MED : BASE {
    vest[] = {VEST_MEDIC};
    backpack[] = {BACKPACK_MEDIC};
  };
};
