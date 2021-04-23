phx_loadout_sidearm_weapon = "hgun_P07_F";
phx_loadout_sidearm_mag = "16Rnd_9x21_Mag:2";

phx_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm_polymer_tracer:4";
phx_loadout_rifle_mag = "rhs_30Rnd_762x39mm_polymer:7";

if (phx_loadout_hasUGL) then {
  phx_loadout_rifle_weapon = "rhs_weap_akmn_gp25";
} else {
  phx_loadout_rifle_weapon = "rhs_weap_akmn";
};
if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "rhs_weap_rpk74m";
  phx_loadout_rifle_mag = "rhs_100Rnd_762x54mmR_green:8";
};
if (pRole == ROLE_AAR) then {
  phx_loadout_aar_mag = "rhs_100Rnd_762x54mmR_green:4";
};
if (pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "rhs_weap_pkp";
  phx_loadout_rifle_mag = "rhs_100Rnd_762x54mmR_green:8";
};
if (pRole == ROLE_AM) then {
  phx_loadout_am_mag = "rhs_100Rnd_762x54mmR_green:7";
};
if (pRole == ROLE_RAT) then {
  phx_loadout_antitank_weapon = "rhs_weap_rpg26";
};
if (pRole == ROLE_MK) then {
  phx_loadout_rifle_weapon = "rhs_weap_svdp_npz";
  phx_loadout_rifle_mag = "ACE_10Rnd_762x54_Tracer_mag:9";
};
if (pRole == ROLE_P) then {
  phx_loadout_rifle_weapon = "rhs_weap_aks74un";
  phx_loadout_rifle_mag = "rhs_30Rnd_545x39_7N10_AK:4";
};

//Don't allow classes with non-rifleman weapon to switch weapons
if (phx_loadout_hasSpecial) then {
  phx_selector_weapons = [];
};
