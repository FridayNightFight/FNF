phx_loadout_uniform = "rhs_uniform_emr_patchless";
phx_loadout_vest = "rhs_6b23_digi_6sh92";
phx_loadout_backpack = "rhs_assault_umbts";
phx_loadout_headgear = "rhs_6b27m_digi";
if (pRole == ROLE_CLS) then {
  phx_loadout_vest = "rhs_6b23_digi_medic";
};
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_vest = "rhs_6b23_digi_6sh92_vog_headset";
  if (!(_lrRadio isEqualTo "")) then {
    phx_loadout_backpack = _lrRadio;
  };
};
if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_vest = "rhs_6b23_digi_6sh92_vog_headset";
};
if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
  phx_loadout_backpack = "B_Kitbag_sgg";
};
if (pRole == ROLE_MG) then {
  phx_loadout_backpack = "B_FieldPack_oli";
};
if (pRole == ROLE_AM) then {
  phx_loadout_backpack = "B_Kitbag_sgg";
};
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_O";
  phx_loadout_vest = "rhs_6b23_digi";
  phx_loadout_backpack = _lrRadio;
};
if (pRole == ROLE_CR) then {
  phx_loadout_vest = "rhs_6b23_digi_crew";
  phx_loadout_backpack = "";
};
if (pRole == ROLE_MK) then {
  phx_loadout_vest = "rhs_6b23_digi_sniper";
};
if (pRole == ROLE_AT || pRole == ROLE_AAT) then {
  phx_loadout_backpack = "B_FieldPack_oli";
};
if (pRole == ROLE_CE) then {
  phx_loadout_backpack = "B_FieldPack_oli";
};
