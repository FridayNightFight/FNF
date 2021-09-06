//Backpack
phx_loadout_backpack = "B_AssaultPack_blk";

if (pRole == ROLE_CLS) then {
  phx_loadout_backpack = "B_FieldPack_blk";
};

if (pRole == ROLE_AT || pRole == ROLE_AAT || pRole == ROLE_CE || pRole == ROLE_AAR || pRole == ROLE_AM) then {
  phx_loadout_backpack = "rhs_tortila_black";
};

//Headgear
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "rhsusf_hgu56p_visor_white";
};
if (pRole == ROLE_CR) then {
  phx_loadout_headgear = "rhssaf_helmet_m97_black_nocamo";
};

//Vest
if (pRole == ROLE_P) then {
  phx_loadout_vest = "V_TacVest_blk";
};
