//Backpack
if (!phx_loadout_backpack_lock) then {
  phx_loadout_backpack = "B_FieldPack_blk";

  if (pRole == ROLE_CLS) then {
    phx_loadout_backpack = "rhs_medic_bag";
  };

  if (pRole == ROLE_AAR || pRole == ROLE_AM || pRole == ROLE_CE || pRole == ROLE_AAT) then {
    phx_loadout_backpack = "rhs_tortila_blk";
  };
};

//Headgear
if (!phx_loadout_headgear_lock) then {
  if (pRole == ROLE_P) then {
    phx_loadout_headgear = "H_PilotHelmetHeli_O";
  };
  if (pRole == ROLE_CR) then {
    phx_loadout_headgear = "rhssaf_helmet_m97_black_nocamo";
  };
};

//Vest
if (!phx_loadout_vest_lock) then {
  if (pRole == ROLE_P) then {
    phx_loadout_vest = "V_TacVest_khk";
  };
};
