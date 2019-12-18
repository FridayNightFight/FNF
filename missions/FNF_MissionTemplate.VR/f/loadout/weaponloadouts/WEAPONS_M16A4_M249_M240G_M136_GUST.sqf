if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_rifle_weapon = "rhs_weap_m16a4_carryhandle_M203";
} else { phx_loadout_rifle_weapon = "rhs_weap_m16a4_carryhandle"; };
if (pRole == ROLE_MK) then {
  phx_loadout_rifle_weapon = "rhs_weap_sr25";
  phx_loadout_rifle_mag = "rhsusf_20Rnd_762x51_SR25_m62_Mag:4";
  phx_loadout_rifle_optic = "optic_SOS";
};
