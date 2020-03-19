phx_loadout_uniform = "rhs_uniform_m88_patchless";
phx_loadout_vest = "rhs_6b23_ML_engineer";
phx_loadout_backpack = "rhs_assault_umbts";
phx_loadout_headgear = "rhs_6b27m_ml";
if (pRole == ROLE_CLS) then {
  phx_loadout_vest = "rhs_6b23_ML_medic";
  phx_loadout_backpack = "B_FieldPack_khk";
};
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_vest = "rhs_6b23_ML_crewofficer";
  if (!(_lrRadio isEqualTo "")) then {
    phx_loadout_backpack = _lrRadio;
  };
};
if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_vest = "rhs_6b23_ML_crew";
};
if (pRole == ROLE_CE) then {
  phx_loadout_vest = "rhs_6b23_ML_rifleman";
  phx_loadout_backpack = "B_Kitbag_tan";
};
if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
  phx_loadout_backpack = "B_Carryall_cbr";
};
if (pRole == ROLE_MG || pRole == ROLE_AM) then {
  phx_loadout_backpack = "B_Carryall_cbr";
};
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_O";
  phx_loadout_vest = "rhs_6b23_ML_engineer";
  phx_loadout_backpack = _lrRadio;
};
if (pRole == ROLE_CR) then {
  phx_loadout_headgear = "rhs_gssh18";
  phx_loadout_vest = "rhs_6b23_ML_engineer";
  phx_loadout_backpack = "rhs_assault_umbts";
};
if (pRole == ROLE_MK) then {
  phx_loadout_vest = "rhs_6b23_ML_sniper";
};
if (pRole == ROLE_AT || pRole == ROLE_AAT) then {
  phx_loadout_backpack = "B_FieldPack_khk";
};
