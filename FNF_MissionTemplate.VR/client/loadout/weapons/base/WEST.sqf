phx_loadout_sidearm_weapon = "rhsusf_weap_glock17g4";
phx_loadout_sidearm_mag = "rhsusf_mag_17Rnd_9x19_JHP:2";

phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:4";
phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:7";

phx_loadout_rifle_gl_he = "1Rnd_HE_Grenade_shell:6";
phx_loadout_rifle_gl_smoke = "1Rnd_Smoke_Grenade_shell:3";
phx_loadout_rifle_gl_flare = "UGL_FlareWhite_F:3";

if (phx_loadout_hasUGL) then {
  phx_loadout_rifle_weapon = "rhs_weap_m4a1_blockII_M203_bk";
  phx_selector_weapons = [["rhs_weap_m16a4_carryhandle_M203"]];
} else {
  phx_loadout_rifle_weapon = "rhs_weap_m4a1_blockII_bk";
  phx_selector_weapons = [["rhs_weap_m16a4_carryhandle"]];
};
if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "rhs_weap_m249_pip_L";
  phx_loadout_rifle_mag = "rhsusf_200rnd_556x45_mixed_box:6";
};
if (pRole == ROLE_AAR) then {
  phx_loadout_aar_mag = "rhsusf_200rnd_556x45_mixed_box:5";
};
if (pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "rhs_weap_m240G";
  phx_loadout_rifle_mag = "rhsusf_100Rnd_762x51_m80a1epr:8";
};
if (pRole == ROLE_AM) then {
  phx_loadout_am_mag = "rhsusf_100Rnd_762x51_m80a1epr:6";
};
if (pRole == ROLE_RAT) then {
  phx_loadout_antitank_weapon = "rhs_weap_m72a7";
};
if (pRole == ROLE_MK) then {
  phx_loadout_rifle_weapon = "rhs_weap_sr25";
  phx_loadout_rifle_mag = "rhsusf_20Rnd_762x51_SR25_m62_Mag:4";
};
if (pRole == ROLE_P) then {
  phx_loadout_rifle_weapon = "rhsusf_weap_MP7A2";
  phx_loadout_rifle_mag = "rhsusf_mag_40Rnd_46x30_FMJ:4";
};

//Don't allow classes with non-rifleman weapon to switch weapons
if (phx_loadout_hasSpecial) then {
  phx_selector_weapons = [];
};
