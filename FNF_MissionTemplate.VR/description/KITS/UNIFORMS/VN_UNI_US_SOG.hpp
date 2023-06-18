#include "..\undef.hpp" // Reset defines

#define UNIFORM "vn_b_uniform_sog_01_02", "vn_b_uniform_sog_02_02", "vn_b_uniform_sog_02_05", "vn_b_uniform_sog_01_05", "vn_b_uniform_macv_06_02", "vn_b_uniform_macv_04_02"

#define UNIFORM_PILOT "vn_b_uniform_k2b_02_03"

#define VEST "vn_b_vest_usarmy_02", "vn_b_vest_usarmy_03"
#define VEST_LEADER "vn_b_vest_sog_01"
#define VEST_TL "vn_b_vest_usarmy_13"
#define VEST_AR "vn_b_vest_sog_04"
#define VEST_DM "vn_b_vest_usarmy_04"
#define VEST_CE "vn_b_vest_sog_03"
#define VEST_MEDIC "vn_b_vest_sog_02"
#define VEST_CREWMAN "vn_b_vest_usarmy_04"
#define VEST_PILOT "vn_b_vest_aircrew_01"

#define HELMET "vn_b_headband_02", "vn_b_boonie_01_02", "vn_b_boonie_05_02", "vn_b_boonie_04_02", "vn_b_boonie_03_02", "vn_b_boonie_02_02"
#define HELMET_LEADER "vn_b_beret_01_06"
#define HELMET_CREWMAN "vn_b_helmet_t56_02_01"
#define HELMET_PILOT "vn_b_helmet_svh4_01_01"

#define BACKPACK "vn_b_pack_01_02"
#define BACKPACK_RADIO "vn_b_pack_trp_04_02"
#define BACKPACK_AR "vn_b_pack_trp_01"
#define BACKPACK_AT "vn_b_pack_trp_03"
#define BACKPACK_CE "vn_b_pack_05_02"
#define BACKPACK_DM "vn_b_pack_04_02"
#define BACKPACK_MEDIC "vn_b_pack_lw_07"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class VN_UNI_US_SOG {
  author = "Mazz38";
  description = "USA: Vietnam Era US Army SOG";

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
    headgear[] = {HELMET_LEADER};
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

  class SNP : BASE {
    vest[] = {VEST_DM};
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
