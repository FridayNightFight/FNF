//Backpack
phx_loadout_backpack = "B_AssaultPack_cbr";

if (pRole == ROLE_CLS) then {
  phx_loadout_backpack = "B_FieldPack_cbr";
};
if (pRole == ROLE_AAR || pRole == ROLE_AM) then {
  phx_loadout_backpack = "B_Carryall_cbr";
};
if (pRole == ROLE_AT || pRole == ROLE_AAT || pRole == ROLE_CE) then {
  phx_loadout_backpack = "B_Kitbag_cbr";
};

//Headgear
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_B";
};
if (pRole == ROLE_CR) then {
  phx_loadout_headgear = "rhsusf_cvc_alt_helmet";
};

//Vest
if (pRole == ROLE_P) then {
  phx_loadout_vest = "rhsusf_plateframe_light";
};
