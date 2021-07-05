phx_loadout_backpack = "B_FieldPack_cbr";

if (pRole == ROLE_AAR || pRole == ROLE_AM) then {
  phx_loadout_backpack = "B_Carryall_cbr";
};
if (pRole == ROLE_AT || pRole == ROLE_AAT || pRole == ROLE_CE) then {
  phx_loadout_backpack = "B_Kitbag_cbr";
};

if (pRole == ROLE_P) then {
  phx_loadout_headgear = "H_PilotHelmetHeli_O";
  phx_loadout_vest = "V_TacVest_brn";
};
if (pRole == ROLE_CR) then {
  phx_loadout_headgear = "H_HelmetCrew_I";
};
