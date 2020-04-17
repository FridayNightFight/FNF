phx_loadout_uniform = "rhs_uniform_cu_ocp";
phx_loadout_vest = "rhsusf_iotv_ocp_Rifleman";
phx_loadout_backpack = "rhsusf_assault_eagleaiii_ocp";
phx_loadout_headgear = "rhsusf_ach_helmet_ocp";
if (pRole == ROLE_CLS) then {
  phx_loadout_vest = "rhsusf_iotv_ocp_Medic";
};
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_vest = "rhsusf_iotv_ocp_Squadleader";
  if (!(_lrRadio isEqualTo "")) then {
    phx_loadout_backpack = _lrRadio;
  };
};
if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_vest = "rhsusf_iotv_ocp_Teamleader";
};
if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
  phx_loadout_backpack = "B_Kitbag_mcamo";
};
if (pRole == ROLE_CE) then {
  phx_loadout_vest = "rhsusf_iotv_ocp_Repair";
  phx_loadout_backpack = "B_Kitbag_mcamo";
};
if (pRole == ROLE_MG || pRole == ROLE_AM) then {
  phx_loadout_vest = "rhsusf_iotv_ocp_SAW";
  phx_loadout_backpack = "B_Carryall_mcamo";
};
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_B";
  phx_loadout_vest = "rhsusf_spc";
  phx_loadout_backpack = _lrRadio;
};
if (pRole == ROLE_CR) then {
  phx_loadout_headgear = "rhsusf_lwh_helmet_marpatwd_headset_blk";
  phx_loadout_vest = "rhsusf_iotv_ocp_Repair";
  phx_loadout_backpack = "rhsusf_assault_eagleaiii_ocp";
};
if (pRole == ROLE_MK) then {
  phx_loadout_vest = "rhsusf_spcs_ocp_sniper";
};
if (pRole == ROLE_AT) then {
  phx_loadout_backpack = "B_FieldPack_cbr";
};
