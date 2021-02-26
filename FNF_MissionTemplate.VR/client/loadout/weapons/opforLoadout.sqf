//Base loadout function call for OPFOR players - other weapon sets overwrite this

giveOPFORLoadout = {
  phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_plum_green:4";
  phx_loadout_rifle_mag = "rhs_30Rnd_545x39_7N10_AK:7";
  phx_loadout_sidearm_weapon = "rhs_weap_pya";
  phx_loadout_sidearm_mag = "rhs_mag_9x19_17:2";
  if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
    phx_loadout_rifle_weapon = "rhs_weap_ak74m_gp25";
    phx_loadout_rifle_gl_he = "rhs_VOG25:6";
    phx_loadout_rifle_gl_smoke = "rhs_GRD40_White:3";
    phx_loadout_rifle_gl_flare = "rhs_VG40OP_white:3";
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
  if (pRole == ROLE_MK) then {
    phx_loadout_rifle_weapon = "rhs_weap_svdp_npz";
    phx_loadout_rifle_mag = "ACE_10Rnd_762x54_Tracer_mag:9";
  };
  if (pRole == ROLE_P) then {
    phx_loadout_rifle_weapon = "rhs_weap_aks74un";
    phx_loadout_rifle_mag = "rhs_30Rnd_545x39_7N10_AK:4";
  };
};
