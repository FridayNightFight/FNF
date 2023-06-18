#include "..\undef.hpp" // Reset defines

#define UNIFORM "vn_b_uniform_aus_04_01", "vn_b_uniform_aus_10_01", "vn_b_uniform_aus_03_01", "vn_b_uniform_aus_06_01"

#define UNIFORM_PILOT "vn_b_uniform_heli_01_01"

#define VEST "vn_b_vest_anzac_01", "vn_b_vest_anzac_02", "vn_b_vest_usarmy_14"
#define VEST_LEADER "vn_b_vest_anzac_07"
#define VEST_TL "vn_b_vest_anzac_04"
#define VEST_AR "vn_b_vest_anzac_05"
#define VEST_DM "vn_b_vest_usarmy_04"
#define VEST_MEDIC "vn_b_vest_anzac_06"
#define VEST_CREWMAN "vn_b_vest_usarmy_04"
#define VEST_PILOT VEST

#define HELMET "vn_b_boonie_06_01", "vn_b_boonie_08_02", "vn_b_boonie_07_02", "vn_b_boonie_08_01", "vn_b_boonie_07_01", "vn_b_boonie_06_02"
#define HELMET_CREWMAN "vn_b_helmet_t56_02_01"
#define HELMET_PILOT "vn_b_helmet_svh4_01_01"

#define BACKPACK "vn_b_pack_p44_02"
#define BACKPACK_RADIO "vn_b_pack_trp_04_02"
#define BACKPACK_AR "vn_b_pack_pfield_02"
#define BACKPACK_AT "vn_b_pack_pfield_01"
#define BACKPACK_CE "vn_b_pack_p08_03"
#define BACKPACK_DM "vn_b_pack_p08_02"
#define BACKPACK_MEDIC "vn_b_pack_p08_01"
#define BACKPACK_CREWMAN BACKPACK_RADIO
#define BACKPACK_PILOT BACKPACK_RADIO


class VN_UNI_AUS_ANZAC {
  author = "Mazz38";
  description = "AUS: Vietnam Era Australia ANZAC";

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
