phx_loadout_uniform = "rhs_uniform_g3_blk";
phx_loadout_vest = "V_PlateCarrier2_blk";
phx_loadout_backpack = "B_AssaultPack_blk";
phx_loadout_headgear = "rhsusf_opscore_bk_pelt";
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  if (!(_lrRadio isEqualTo "")) then {
    phx_loadout_backpack = _lrRadio;
  };
};
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_B";
  phx_loadout_vest = "V_PlateCarrier1_blk";
  phx_loadout_backpack = _lrRadio;
};
if (pRole == ROLE_P) then {
  phx_loadout_backpack = "B_FieldPack_blk";
};
if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
  phx_loadout_backpack = "B_FieldPack_blk";
};
if (pRole == ROLE_MG || pRole == ROLE_AM) then {
  phx_loadout_backpack = "B_FieldPack_blk";
};
