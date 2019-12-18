phx_loadout_uniform = "rhs_uniform_emr_des_patchless";
phx_loadout_vest = "rhsgref_6b23_khaki_rifleman";
phx_loadout_backpack = "B_FieldPack_cbr";
phx_loadout_headgear = "rhs_6b7_1m_olive";
if (pRole == ROLE_CLS) then {
  phx_loadout_vest = "rhsgref_6b23_khaki_medic";
};
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_vest = "rhsgref_6b23_khaki_officer";
  if (!(_lrRadio isEqualTo "")) then {
    phx_loadout_backpack = _lrRadio;
  };
};
if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_vest = "rhsgref_6b23_khaki_nco";
};
if (pRole == ROLE_CE) then {
  phx_loadout_vest = "rhsgref_6b23_khaki";
  phx_loadout_backpack = "B_Kitbag_tan";
};
if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
  phx_loadout_backpack = "B_Kitbag_tan";
};
if (pRole == ROLE_MG || pRole == ROLE_AM) then {
  phx_loadout_backpack = "B_Carryall_cbr";
};
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_O";
  phx_loadout_vest = "rhsgref_6b23_khaki";
  phx_loadout_backpack = _lrRadio;
};
if (pRole == ROLE_CR) then {
  phx_loadout_headgear = "rhs_gssh18";
  phx_loadout_vest = "rhsgref_6b23_khaki";
  phx_loadout_backpack = "B_FieldPack_cbr";
};
if (pRole == ROLE_MK) then {
  phx_loadout_vest = "rhsgref_6b23_khaki_sniper";
};
