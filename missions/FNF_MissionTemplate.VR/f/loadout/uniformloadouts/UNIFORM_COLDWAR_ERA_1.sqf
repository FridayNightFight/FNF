phx_loadout_uniform = "rhsgref_uniform_woodland_olive";
phx_loadout_vest = "rhs_vest_commander";
phx_loadout_backpack = "B_FieldPack_oli";
phx_loadout_headgear = "rhs_ssh68";
if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  if (!(_lrRadio isEqualTo "")) then {
    phx_loadout_backpack = _lrRadio;
  };
};
if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_O";
  phx_loadout_backpack = _lrRadio;
};
if (pRole == ROLE_CLS) then {
  phx_loadout_backpack = "B_Kitbag_rgr";
};
if (pRole == ROLE_CR) then {
  phx_loadout_headgear = "rhs_gssh18";
  phx_loadout_backpack = "B_FieldPack_oli";
};
if (pRole == ROLE_CE) then {
  phx_loadout_backpack = "rhssaf_kitbag_md2camo";
};
if (pRole == ROLE_AR || pRole == ROLE_AAR) then {
  phx_loadout_backpack = "B_Carryall_oli";
};
if (pRole == ROLE_MG || pRole == ROLE_AM) then {
  phx_loadout_backpack = "B_Carryall_oli";
};
