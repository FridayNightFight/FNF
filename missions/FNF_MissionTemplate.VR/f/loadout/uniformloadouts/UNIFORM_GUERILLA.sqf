phx_loadout_uniform = selectRandom ["U_BG_Guerilla2_2", "U_BG_Guerilla2_1", "U_BG_Guerilla2_3", "U_BG_Guerilla3_1", "U_C_HunterBody_grn", "U_BG_Guerilla_6_1"];
phx_loadout_vest = "rhsgref_otv_khaki";
phx_loadout_backpack = "rhs_sidor";
phx_loadout_headgear = "";
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_uniform = "U_BG_leader";
  if (!(_lrRadio isEqualTo "")) then {
    phx_loadout_backpack = _lrRadio;
  };
};
if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_uniform = "U_BG_leader";
};
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_B";
  phx_loadout_backpack = _lrRadio;
};
if (pRole == ROLE_CLS) then {
  phx_loadout_backpack = "B_AssaultPack_rgr";
};
if (pRole == ROLE_CR) then {
  phx_loadout_headgear = "rhs_gssh18";
  phx_loadout_backpack = "rhs_sidor";
};
if (pRole == ROLE_CE) then {
  phx_loadout_backpack = "B_Kitbag_rgr";
};
if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
  phx_loadout_backpack = "B_Carryall_oli";
};
if (pRole == ROLE_MG || pRole == ROLE_AM) then {
  phx_loadout_backpack = "B_Carryall_oli";
};
if (pRole == ROLE_AT || pRole == ROLE_AAT) then {
  phx_loadout_backpack = "B_FieldPack_oli";
};
