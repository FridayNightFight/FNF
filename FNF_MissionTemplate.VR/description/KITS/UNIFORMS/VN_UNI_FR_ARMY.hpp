#include "..\undef.hpp" // Reset defines

#define UNIFORM "rhsgref_uniform_TLA_1", "rhsgref_uniform_TLA_2"

#define UNIFORM_PILOT "vn_b_uniform_sog_01_01"

#define VEST "vn_b_vest_usarmy_02", "vn_b_vest_usarmy_03"
#define VEST_LEADER "vn_b_vest_usarmy_09"
#define VEST_TL "vn_b_vest_usarmy_13"
#define VEST_AR "vn_b_vest_usarmy_06"
#define VEST_DM "vn_b_vest_usarmy_04"
#define VEST_MEDIC "vn_b_vest_usarmy_07"
#define VEST_CREWMAN "vn_b_vest_usarmy_11"
#define VEST_PILOT VEST

#define HELMET "vn_i_helmet_m1_02_01", "vn_i_helmet_m1_03_01", "vn_b_helmet_m1_10_01", "vn_b_helmet_m1_11_01", "vn_b_helmet_m1_12_01", "vn_b_helmet_m1_12_01"
#define HELMET_CREWMAN "vn_b_helmet_m1_01_01"
#define HELMET_PILOT "vn_b_boonie_01_01"

#define BACKPACK "vn_b_pack_trp_02_02"
#define BACKPACK_RADIO "vn_b_pack_trp_04_02"
#define BACKPACK_AR "vn_b_pack_lw_05"
#define BACKPACK_AT "vn_b_pack_lw_04"
#define BACKPACK_CE "vn_b_pack_trp_03_02"
#define BACKPACK_DM "vn_b_pack_lw_01"
#define BACKPACK_MEDIC "vn_b_pack_lw_07"
#define BACKPACK_CREWMAN BACKPACK
#define BACKPACK_PILOT BACKPACK


class VN_UNI_FR_ARMY {
  author = "Mazz38";
  description = "USA: Vietnam Era French Army";

  class BASE {
    uniform[] = {UNIFORM};
    vest[] = {VEST};
    headgear[] = {HELMET};
    backpack[] = {BACKPACK};
  };

  class RI : BASE {};

  class TL : BASE {
    vest[] = {VEST_TL};
    backpack[] = {BACKPACK_RADIO};
  };

  class SL : TL {
    vest[] = {VEST_LEADER};
  };
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

  class MGA : BASE {};

  class MG : MGA {
    vest[] = {VEST_AR};
  };

  class CE : BASE {
    backpack[] = {BACKPACK_CE};
  };

  class LAT : BASE {};

  class MATA1 : BASE {
    backpack[] = {BACKPACK_AT};
  };
  class MAT1 : MATA1 {};
  class MATA2 : BASE {
    backpack[] = {BACKPACK_AT};
  };
  class MAT2 : MATA2 {};

  class RIS : BASE {};

  class DM : BASE {
    vest[] = {VEST_DM};
    backpack[] = {BACKPACK_DM};
  };

  class SNP : BASE {};

  class CR : BASE {
    uniform[] = {UNIFORM};
    vest[] = {VEST_CREWMAN};
    headgear[] = {HELMET_CREWMAN};
    backpack[] = {BACKPACK_CREWMAN};
  };

  class CRL : CR {
    backpack[] = {BACKPACK_RADIO};
  };

  class PI : BASE {
    uniform[] = {UNIFORM_PILOT};
    vest[] = {VEST_PILOT};
    headgear[] = {HELMET_PILOT};
    backpack[] = {BACKPACK_PILOT};
  };

  class MED : BASE {
    vest[] = {VEST_MEDIC};
    backpack[] = {BACKPACK_MEDIC};
  };
};
