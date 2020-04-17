phx_loadout_rifle_mag_tracer = "30Rnd_65x39_caseless_green_mag_Tracer:4";
phx_loadout_rifle_mag = "30Rnd_65x39_caseless_green:7";
if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_rifle_weapon = "arifle_Katiba_GL_F";
  phx_loadout_rifle_gl_he = "1Rnd_HE_Grenade_shell:6";
  phx_loadout_rifle_gl_smoke = "1Rnd_Smoke_Grenade_shell:3";
  phx_loadout_rifle_gl_flare = "UGL_FlareWhite_F:3";
  phx_loadout_rifle_mag_tracer = "30Rnd_65x39_caseless_green_mag_Tracer:7";
  phx_loadout_rifle_mag = "30Rnd_65x39_caseless_green:4";
} else { phx_loadout_rifle_weapon = "arifle_Katiba_F"; };
if (pRole == ROLE_AR) then {
  phx_loadout_automaticrifle_weapon = "LMG_Zafir_F";
  phx_loadout_automaticrifle_mag = "150Rnd_762x54_Box_Tracer:6";
};
if (pRole == ROLE_AAR) then {
  phx_loadout_automaticrifle_mag = "150Rnd_762x54_Box_Tracer:3";
};
if (pRole == ROLE_MG) then {
  phx_loadout_mmg_weapon = "LMG_Zafir_F";
  phx_loadout_mmg_mag = "150Rnd_762x54_Box_Tracer:6";
};
if (pRole == ROLE_AM) then {
  phx_loadout_rifle_mag_tracer = "30Rnd_65x39_caseless_green_mag_Tracer:5";
  phx_loadout_rifle_mag = "30Rnd_65x39_caseless_green:4";
  phx_loadout_mmg_mag = "150Rnd_762x54_Box_Tracer:3";
};
if (pRole == ROLE_RAT) then {
  phx_loadout_antitank_weapon = "launch_RPG32_F";
  phx_loadout_antitank_mag = "RPG32_F";
};
if (pRole == ROLE_AT) then {
  phx_loadout_mediumantitank_weapon = "launch_O_Titan_short_F";
  phx_loadout_mediumantitank_mag = "Titan_AT:1";
};
if (pRole == ROLE_AAT) then {
  phx_loadout_mediumantitank_mag = "Titan_AT";
};
if (pRole == ROLE_MK) then {
  phx_loadout_rifle_weapon = "srifle_GM6_camo_F";
  phx_loadout_rifle_mag = "5Rnd_127x108_Mag:5";
  phx_loadout_rifle_optic = "optic_SOS";
};
phx_loadout_flare = "ACE_HandFlare_White:3";
