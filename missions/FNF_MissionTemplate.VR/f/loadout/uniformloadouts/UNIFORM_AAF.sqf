phx_loadout_uniform = "U_I_CombatUniform";
phx_loadout_vest = "V_PlateCarrier1_rgr";
phx_loadout_backpack = "B_AssaultPack_rgr";
phx_loadout_headgear = "H_HelmetSpecB";
if (pRole == ROLE_CLS) then {
  phx_loadout_vest = "V_PlateCarrier2_rgr";
};
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_vest = "V_PlateCarrierSpec_rgr";
  if (!(_lrRadio isEqualTo "")) then {
    _lrRadio = "tf_anprc155";
    phx_loadout_backpack = _lrRadio;
  };
};
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_B";
  phx_loadout_vest = "V_TacVest_oli";
  phx_loadout_backpack = _lrRadio;
};
if (pRole == ROLE_CR) then {
  phx_loadout_headgear = "H_HelmetCrew_I";
  phx_loadout_backpack = "B_AssaultPack_rgr";
};
if (pRole == ROLE_MK) then {
  phx_loadout_vest = "V_Chestrig_rgr";
  phx_loadout_uniform = "U_I_FullGhillie_lsh";
  phx_loadout_backpack = "";
  phx_loadout_headgear = "";
};
if (pRole == ROLE_MG || pRole == ROLE_AM) then {
  phx_loadout_backpack = "B_Carryall_oli";
};
