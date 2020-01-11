phx_loadout_uniform = "rhs_uniform_emr_patchless";
phx_loadout_vest = "rhs_6b23_digi_6sh92_spetsnaz2";
phx_loadout_backpack = "rhs_assault_umbts";
phx_loadout_headgear = "rhs_6b27m_digi_ess";
if (pRole == ROLE_CLS) then {
  phx_loadout_vest = "rhs_6b23_digi_medic";
};
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_vest = "rhs_6b23_digi_6sh92_headset_mapcase";
  if (!(_lrRadio isEqualTo "")) then {
    phx_loadout_backpack = _lrRadio;
  };
};
if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_vest = "rhs_6b23_digi_6sh92_Vog_Radio_Spetsnaz";
};
if (pRole == ROLE_CE) then {
  phx_loadout_vest = "rhs_6b23_digi_rifleman";
  phx_loadout_backpack = "B_Kitbag_rgr";
};
if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
  phx_loadout_backpack = "B_Kitbag_rgr";
};
if (pRole == ROLE_MG || pRole == ROLE_AM) then {
  phx_loadout_backpack = "B_Carryall_oli";
};
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_O";
  phx_loadout_vest = "rhs_6b23_digi";
  phx_loadout_backpack = _lrRadio;
};
if (pRole == ROLE_CR) then {
  phx_loadout_headgear = "rhs_gssh18";
  phx_loadout_vest = "rhs_6b23_digi";
  phx_loadout_backpack = "rhs_assault_umbts";
};
if (pRole == ROLE_MK) then {
  phx_loadout_vest = "rhs_6b23_digi_sniper";
};