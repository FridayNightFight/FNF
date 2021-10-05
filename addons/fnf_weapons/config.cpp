/*
  Weapon configs
*/

class CfgPatches
{
  class fnf_weapons
  {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.1;
    requiredAddons[] = {"ace_compat_rhs_afrf3","ace_compat_rhs_usf3"};
  };
};

class CfgWeapons {

  // fix ACE_Compat for RPK use
  class rhs_weap_rpk_base;

  class rhs_weap_rpk74_base: rhs_weap_rpk_base {
    ACE_barrelLength = 590.00;
    ACE_barrelTwist = 195.072;
  };

  class rhs_weap_rpk74: rhs_weap_rpk74_base {};

  // allow NVG passthrough on primary sniper optic
  class ItemCore;

  class rhsusf_acc_sniper_base: ItemCore {
    class ItemInfo;
  };

  class rhsusf_acc_LEUPOLDMK4_2: rhsusf_acc_sniper_base {
    class ItemInfo: ItemInfo {
      class OpticsModes;
    };
  };

  class rhsusf_acc_premier: rhsusf_acc_LEUPOLDMK4_2 {
    class ItemInfo: ItemInfo {
      class OpticsModes: OpticsModes {
        class Snip;
      };
    };
  };
  
  class rhsusf_acc_M8541: rhsusf_acc_premier {
    class ItemInfo: ItemInfo {
      class OpticsModes: OpticsModes {
        class Snip: Snip {
            visionMode[] = {};
        };
      };
    };
  };
  class rhsusf_acc_m8541_wd: rhsusf_acc_M8541 {
    class ItemInfo: ItemInfo {
      class OpticsModes: OpticsModes {
        class Snip: Snip {
            visionMode[] = {};
        };
      };
    };
  };
  class rhsusf_acc_m8541_d: rhsusf_acc_M8541 {
    class ItemInfo: ItemInfo {
      class OpticsModes: OpticsModes {
        class Snip: Snip {
          visionMode[] = {};
        };
      };
    };
  };
};
