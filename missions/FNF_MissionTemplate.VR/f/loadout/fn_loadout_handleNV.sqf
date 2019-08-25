player unlinkItem "NVGoggles";
player unlinkItem "NVGoggles_OPFOR";
player unlinkItem "NVGoggles_INDEP";

_nightvision = "phx_loadout_nightvision" call BIS_fnc_getParamValue;
phx_loadout_nvgAttachment = "";

if !(_nightvision isEqualTo -1) then {
  switch (_nightvision) do {
    case 0: {
      _nvg = (assignedItems player) select 4;
      player unlinkItem _nvg;
    };
    case 1: {
      player linkItem "ACE_NVG_Gen4";
      switch (side player) do {
        case east: {
          phx_loadout_nvgAttachment = "rhs_acc_perst1ik";
          if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
            phx_loadout_nvgAttachment = "rhs_acc_perst1ik_ris";
          };
        };
        case west: {
          phx_loadout_nvgAttachment = "ACE_acc_pointer_green";
        };
        case independent: {
          phx_loadout_nvgAttachment =  "acc_pointer_IR";
        };
      };
    };
    case 2: {
      if (side player == east) then {
        player linkItem "ACE_NVG_Gen4";
        phx_loadout_nvgAttachment = "rhs_acc_perst1ik";
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          phx_loadout_nvgAttachment = "rhs_acc_perst1ik_ris";
        };
      };
    };
    case 3: {
      if (side player == west) then {
        player linkItem "ACE_NVG_Gen4";
        phx_loadout_nvgAttachment = "ACE_acc_pointer_green";
      };
    };
    case 4: {
      if (side player == independent) then {
        player linkItem "ACE_NVG_Gen4";
        phx_loadout_nvgAttachment =  "acc_pointer_IR";
      };
    };
  };
};

player addPrimaryWeaponItem phx_loadout_nvgAttachment;
