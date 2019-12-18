phx_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm_bakelite_tracer:4";
phx_loadout_rifle_mag = "rhs_30Rnd_762x39mm_bakelite:7";
if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_rifle_weapon = "rhs_weap_akmn_gp25";
  phx_loadout_rifle_gl_he = "rhs_VOG25:6";
  phx_loadout_rifle_gl_smoke = "rhs_GRD40_White:3";
  phx_loadout_rifle_gl_flare = "rhs_VG40OP_white:3";
  phx_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm_bakelite:7";
  phx_loadout_rifle_mag = "rhs_30Rnd_762x39mm_bakelite_tracer:4";
} else { phx_loadout_rifle_weapon = "rhs_weap_akmn"; };
if (pRole == ROLE_AR) then {
  phx_loadout_automaticrifle_weapon = "rhs_weap_pkm";
  phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR_green:5";
};
if (pRole == ROLE_AAR) then {
  phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR_green:4";
};
if (pRole == ROLE_MG) then {
  phx_loadout_mmg_weapon = "rhs_weap_pkp";
  phx_loadout_mmg_mag = "rhs_100Rnd_762x54mmR_green:4";
};
if (pRole == ROLE_AM) then {
  phx_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm_bakelite_tracer:5";
  phx_loadout_rifle_mag = "rhs_30Rnd_762x39mm_bakelite:4";
  phx_loadout_mmg_mag = "rhs_100Rnd_762x54mmR_green:4";
};
if (pRole == ROLE_RAT) then {
  phx_loadout_antitank_weapon = "rhs_weap_rpg7";
  phx_loadout_antitank_mag = "rhs_rpg7_PG7VL_mag";
};
if (pRole == ROLE_AT) then {
  phx_loadout_mediumantitank_weapon = "launch_RPG32_green_F";
  phx_loadout_mediumantitank_mag = "RPG32_F:1";
};
if (pRole == ROLE_AAT) then {
  phx_loadout_mediumantitank_mag = "RPG32_F";
};
if (pRole == ROLE_MK) then {
  phx_loadout_rifle_weapon = "rhs_weap_svdp_npz";
  phx_loadout_rifle_mag = "ACE_10Rnd_762x54_Tracer_mag:9";
  phx_loadout_rifle_optic = "optic_SOS";
};
phx_loadout_flare = "rhs_weap_rsp30_white:3";
