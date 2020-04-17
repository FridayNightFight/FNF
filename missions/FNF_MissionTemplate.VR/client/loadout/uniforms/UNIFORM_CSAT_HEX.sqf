phx_loadout_uniform = "U_O_CombatUniform_ocamo";
phx_loadout_vest = "V_PlateCarrier2_blk";
phx_loadout_backpack = "B_AssaultPack_ocamo";
phx_loadout_headgear = "H_HelmetSpecO_ocamo";
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_vest = "V_PlateCarrierSpec_blk";
  if (!(_lrRadio isEqualTo "")) then {
    _lrRadio = "tf_mr3000";
    phx_loadout_backpack = _lrRadio;
  };
};
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_O";
  phx_loadout_vest = "V_TacVest_brn";
  phx_loadout_backpack = _lrRadio;
};
if (pRole == ROLE_CR) then {
  phx_loadout_headgear = "H_HelmetCrew_O";
  phx_loadout_backpack = "B_AssaultPack_ocamo";
};
if (pRole == ROLE_MK) then {
  phx_loadout_vest = "V_Chestrig_khk";
  phx_loadout_uniform = "U_O_FullGhillie_sard";
  phx_loadout_backpack = "";
  phx_loadout_headgear = "";
};
if (pRole == ROLE_MG || pRole == ROLE_AM) then {
  phx_loadout_backpack = "B_Carryall_khk";
};
