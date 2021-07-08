//Backpack
if (!phx_loadout_backpack_lock) then {
  phx_loadout_backpack = "B_TacticalPack_oli";

  if (pRole == ROLE_CLS) then {
    phx_loadout_backpack = "B_FieldPack_oli";
  };
  if (pRole == ROLE_AAR || pRole == ROLE_AM) then {
    phx_loadout_backpack = "B_Carryall_khk";
  };
  if (pRole == ROLE_AT || pRole == ROLE_AAT || pRole == ROLE_CE) then {
    phx_loadout_backpack = "B_Kitbag_rgr";
  };
};

//Headgear
if (!phx_loadout_headgear_lock) then {
  if (pRole == ROLE_P) then {
    phx_loadout_headgear = "H_PilotHelmetHeli_O";
  };
  if (pRole == ROLE_CR) then {
    phx_loadout_headgear = "H_HelmetCrew_I";
  };
};

//Vest
if (!phx_loadout_vest_lock) then {
  if (pRole == ROLE_P) then {
    phx_loadout_vest = "V_TacVest_oli";
  };
};
