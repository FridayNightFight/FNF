phx_loadout_uniform = "U_B_Wetsuit";
phx_loadout_vest = "V_RebreatherB";
phx_loadout_backpack = "B_AssaultPack_blk";
phx_loadout_headgear = "";
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  if (!(_lrRadio isEqualTo "")) then {
    phx_loadout_backpack = _lrRadio;
  };
};
if (pRole == ROLE_P) then {
  phx_loadout_uniform = "rhssaf_uniform_heli_pilot";
  phx_loadout_vest = "V_TacVest_blk";
  phx_loadout_headgear = "H_PilotHelmetHeli_B";
  phx_loadout_backpack = _lrRadio;
};
