#include "..\undef.hpp" // Reset defines

#define UNIFORM "vn_o_uniform_vc_mf_01_07", "vn_o_uniform_vc_02_04", "vn_o_uniform_vc_04_04", "vn_o_uniform_vc_03_07", "vn_o_uniform_vc_reg_12_10", "vn_o_uniform_vc_reg_12_09"
#define UNIFORM_LEADER "vn_o_uniform_nva_army_01_03"
#define UNIFORM_PILOT UNIFORM
#define UNIFORM_SNP "vn_o_uniform_nva_army_06_04"

#define VEST "vn_o_vest_vc_02", "vn_o_vest_vc_01"
#define VEST_LEADER "vn_o_vest_07"
#define VEST_TL "vn_o_vest_01"
#define VEST_AR "vn_o_vest_03"
#define VEST_MG "vn_b_vest_sog_01"
#define VEST_DM "vn_o_vest_01"
#define VEST_CE "vn_o_vest_08"
#define VEST_MEDIC "vn_o_vest_06"
#define VEST_SNP "vn_o_vest_01"
#define VEST_CREWMAN "vn_o_vest_02"
#define VEST_PILOT "vn_o_vest_05"

#define HELMET "vn_c_conehat_02", "vn_c_conehat_01", "vn_o_helmet_vc_02", "rhs_ssh68", "vn_o_helmet_vc_03", "vn_o_boonie_vc_02_01"
#define HELMET_SNP "vn_o_helmet_nva_04"
#define HELMET_CREWMAN HELMET
#define HELMET_PILOT HELMET

#define BACKPACK "vn_o_pack_01","vn_o_pack_02"
#define BACKPACK_RADIO "vn_o_pack_t884_01"
#define BACKPACK_AR BACKPACK
#define BACKPACK_AT "vn_o_pack_03"
#define BACKPACK_CE "vn_o_pack_05"
#define BACKPACK_DM BACKPACK
#define BACKPACK_MEDIC BACKPACK
#define BACKPACK_CREWMAN BACKPACK
#define BACKPACK_PILOT BACKPACK


class VN_UNI_NVA_Vietcong {
  author = "Mazz38";
  description = "North Vietnam: Guerrilla Warfare";

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
    uniform[] = {UNIFORM_LEADER};
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

  class GR : BASE {};

  class GRIR : BASE {};

  class MGA : BASE {};

  class MG : MGA {
    vest[] = {VEST_MG};
  };

  class CE : BASE {
    vest[] = {VEST_CE};
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
    uniform[] = {UNIFORM_SNP};
    vest[] = {VEST_SNP};
    helmet[] = {HELMET_SNP};
  };

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
