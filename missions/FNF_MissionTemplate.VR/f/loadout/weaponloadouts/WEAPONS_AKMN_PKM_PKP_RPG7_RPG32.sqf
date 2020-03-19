phx_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm_polymer_tracer:4";
phx_loadout_rifle_mag = "rhs_30Rnd_762x39mm_polymer:7";
if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_rifle_weapon = "rhs_weap_akmn_gp25";
  phx_loadout_rifle_gl_he = "rhs_VOG25:6";
  phx_loadout_rifle_gl_smoke = "rhs_GRD40_White:3";
  phx_loadout_rifle_gl_flare = "rhs_VG40OP_white:3";
  phx_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm_polymer_tracer:7";
  phx_loadout_rifle_mag = "rhs_30Rnd_762x39mm_polymer:4";
  allowedWeapons = ["rhs_weap_ak103_gp25","rhs_weap_ak103_gp25_npz"];
} else {
  phx_loadout_rifle_weapon = "rhs_weap_akmn";
  allowedWeapons = ["rhs_weap_ak103","rhs_weap_ak103_npz","rhs_weap_ak104","rhs_weap_ak104_npz"];
};
phx_loadout_flare = "rhs_weap_rsp30_white:3";
