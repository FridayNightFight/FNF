#include "..\undef.hpp" // Reset defines

#define UNIFORM "vn_b_uniform_macv_06_07", "vn_b_uniform_macv_05_07", "vn_b_uniform_macv_04_07", "vn_b_uniform_macv_03_07"

#define UNIFORM_PILOT "vn_b_uniform_heli_01_01"

#define VEST "vn_b_vest_usarmy_02", "vn_b_vest_usarmy_03", "vn_b_vest_usarmy_14"
#define VEST_LEADER "vn_b_vest_usarmy_09"
#define VEST_TL "vn_b_vest_usarmy_13"
#define VEST_AR "vn_b_vest_usarmy_06"
#define VEST_DM "vn_b_vest_usarmy_04"
#define VEST_MEDIC "vn_b_vest_usarmy_07"
#define VEST_CREWMAN "vn_b_vest_usarmy_04"
#define VEST_PILOT VEST

#define HELMET "vn_b_helmet_m1_06_01", "vn_b_helmet_m1_07_01", "vn_b_helmet_m1_03_01", "vn_b_helmet_m1_02_01", "vn_b_helmet_m1_08_01"
#define HELMET_CREWMAN "vn_b_helmet_t56_02_01"
#define HELMET_PILOT "vn_b_helmet_svh4_01_01"

#define BACKPACK "vn_b_pack_trp_02_02"
#define BACKPACK_RADIO "vn_b_pack_trp_04_02"
#define BACKPACK_AR "vn_b_pack_lw_05"
#define BACKPACK_AT "vn_b_pack_lw_04"
#define BACKPACK_CE "vn_b_pack_trp_03_02"
#define BACKPACK_DM "vn_b_pack_lw_03"
#define BACKPACK_MEDIC "vn_b_pack_lw_07"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class VN_UNI_US_MACV {
  author = "Mazz38";
  description = "USA: Vietnam Era US Army MACV";

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
  };

  class CRL : CR {
    backpack[] = {BACKPACK_RADIO};
  };

  class PI : BASE {
    uniform[] = {UNIFORM_PILOT};
    vest[] = {VEST_PILOT};
    headgear[] = {HELMET_PILOT};
    backpack[] = {BACKPACK_RADIO};
  };

  class MED : BASE {
    vest[] = {VEST_MEDIC};
    backpack[] = {BACKPACK_MEDIC};
  };
};
