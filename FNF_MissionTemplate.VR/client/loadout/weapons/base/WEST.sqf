phx_loadout_sidearm_weapon = "rhsusf_weap_glock17g4";
phx_loadout_sidearm_mag = "rhsusf_mag_17Rnd_9x19_JHP:2";

phx_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:4";
phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:7";

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
if (pRole == ROLE_GRIR) then {
  phx_loadout_sidearm_weapon = "rhs_weap_M320";
  phx_loadout_sidearm_mag = "";
};
if (pRole == ROLE_RS) then {
  phx_loadout_rifle_weapon = "srifle_EBR_F"; // for subsonic ammo
  phx_loadout_rifle_mag = "ACE_20Rnd_762x51_Mag_SD:11";
  phx_selector_weapons = [
    ["rhsusf_weap_MP7A2", "rhsusf_mag_40Rnd_46x30_FMJ:8"]
  ];
};
if (pRole == ROLE_SNP) then {
  phx_loadout_rifle_weapon = "rhs_weap_XM2010";
  phx_loadout_rifle_mag = "rhsusf_5Rnd_300winmag_xm2010:12";
  phx_selector_weapons = [
    ["rhs_weap_XM2010_wd", "rhsusf_5Rnd_300winmag_xm2010:12"],
    ["rhs_weap_XM2010_d", "rhsusf_5Rnd_300winmag_xm2010:12"],
    ["rhs_weap_XM2010_sa", "rhsusf_5Rnd_300winmag_xm2010:12"]
  ];
};
if (pRole == ROLE_P) then {
  phx_loadout_rifle_weapon = "rhsusf_weap_MP7A2";
  phx_loadout_rifle_mag = "rhsusf_mag_40Rnd_46x30_FMJ:4";
};
