#include "..\undef.hpp" // Reset defines

#define UNIFORM "rhsgref_uniform_specter", "UK3CB_CHD_B_U_CombatUniform_08", "UK3CB_CHD_B_U_CombatSmock_06", "UK3CB_CHD_B_U_CombatSmock_10", "UK3CB_CHD_B_U_CombatSmock_04", "UK3CB_CHD_B_U_CombatSmock_07"

#define VEST "rhs_6b23_6sh116_mixed", "rhs_6b23_6sh116_flora", "rhs_6b23_6sh92", "rhs_6b13_EMR_6sh92", "rhs_6b13_Flora_6sh92"
#define VEST_LEADER "rhs_6b23_6sh116_vog_mixed", "rhs_6b23_digi_6sh92_vog_headset"
#define VEST_AR "rhs_6b23_digi_vydra_3m"
#define VEST_MEDIC VEST
#define VEST_CREWMAN VEST
#define VEST_PILOT VEST

#define HELMET "rhs_6b7_1m_bala2_olive", "rhs_6b7_1m_bala1_olive", "rhs_6b7_1m_olive", "rhs_6b28_green_bala", "rhs_6b27m_green_bala", "rhs_6b26_bala_green"
#define HELMET_CMDR "rhs_cossack_papakha"
#define HELMET_RECON "rhs_beanie_green"
#define HELMET_CREWMAN "rhs_tsh4_ess_bala"
#define HELMET_PILOT "rhs_zsh7a_mike_green_alt"

#define BACKPACK "rhs_rk_sht_30_olive", "rhs_rk_sht_30_olive_engineer_empty"
#define BACKPACK_RADIO "TFAR_mr3000_rhs"
#define BACKPACK_AR "rhs_tortila_emr", "rhs_tortila_olive"
#define BACKPACK_AT "rhs_rpg_empty"
#define BACKPACK_MEDIC "rhs_medic_bag"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class RHS_UNI_RU_COSSACKS_2010 {
  author = "Mazz38";
  description = "RU: Modern Seperatist Cossack Forces Spectre Camouflage";

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
