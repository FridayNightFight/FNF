phx_loadout_uniform = "rhs_uniform_FROG01_d";
phx_loadout_vest = "rhsusf_spc_rifleman";
phx_loadout_backpack = "rhsusf_assault_eagleaiii_coy";
phx_loadout_headgear = "rhsusf_lwh_helmet_marpatd_ess";
if (pRole == ROLE_CLS) then {
  phx_loadout_vest = "rhsusf_spc_corpsman";
};
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_vest = "rhsusf_spc_squadleader";
  if (!(_lrRadio isEqualTo "")) then {
    phx_loadout_backpack = _lrRadio;
  };
};
if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_vest = "rhsusf_spc_teamleader";
};
if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
  phx_loadout_vest = "rhsusf_spc_iar";
  phx_loadout_backpack = "B_Kitbag_tan";
};
if (pRole == ROLE_CE) then {
  phx_loadout_vest = "rhsusf_spc_light";
  phx_loadout_backpack = "B_Kitbag_tan";
};
if (pRole == ROLE_MG || pRole == ROLE_AM) then {
  phx_loadout_vest = "rhsusf_spc_mg";
  phx_loadout_backpack = "B_Carryall_cbr";
};
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_B";
  phx_loadout_vest = "rhsusf_spc";
  phx_loadout_backpack = _lrRadio;
};
if (pRole == ROLE_CR) then {
  phx_loadout_headgear = "rhsusf_lwh_helmet_marpatd_headset";
  phx_loadout_vest = "rhsusf_spc_crewman";
  phx_loadout_backpack = "rhsusf_assault_eagleaiii_coy";
};
if (pRole == ROLE_MK) then {
  phx_loadout_vest = "rhsusf_spc_marksman";
};
