//Backpack
phx_loadout_backpack = "B_FieldPack_cbr";

if (pRole == ROLE_CLS) then {
  phx_loadout_backpack = "rhs_medic_bag";
};
if (pRole == ROLE_AAR || pRole == ROLE_AM || pRole == ROLE_CE || pRole == ROLE_AAT) then {
  phx_loadout_backpack = "B_Carryall_cbr";
};

//Headgear
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_O";
};
if (pRole == ROLE_CR) then {
  phx_loadout_headgear = "rhs_tsh4";
};

//Vest
if (pRole == ROLE_P) then {
  phx_loadout_vest = "V_TacVest_khk";
};
