/*This is a base weapon set. Standard Russian military loadout. Other sets can use this as a base.*/

phx_loadout_sidearm_weapon = "rhs_weap_pya";
phx_loadout_sidearm_mag = "rhs_mag_9x19_17:2";

phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_plum_green:4";
phx_loadout_rifle_mag = "rhs_30Rnd_545x39_7N10_AK:7";

if (phx_loadout_hasUGL) then {
  phx_loadout_rifle_weapon = "rhs_weap_ak74m_gp25";
} else {
  phx_loadout_rifle_weapon = "rhs_weap_ak74m";
};
if (pRole == ROLE_AR) then {
  phx_loadout_rifle_weapon = "rhs_weap_pkm";
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
if (pRole == ROLE_RS) then {
  phx_selector_weapons = [
    ["rhs_weap_aks74un", "rhs_45Rnd_545X39_7U1_AK:8"]
  ];
};
if (pRole == ROLE_SNP) then {
  phx_loadout_rifle_weapon = "rhs_weap_t5000";
  phx_loadout_rifle_mag = "rhs_5Rnd_338lapua_t5000:12";
};
if (pRole == ROLE_P) then {
  phx_loadout_rifle_weapon = "rhs_weap_aks74un";
  phx_loadout_rifle_mag = "rhs_30Rnd_545x39_7N10_AK:4";
};