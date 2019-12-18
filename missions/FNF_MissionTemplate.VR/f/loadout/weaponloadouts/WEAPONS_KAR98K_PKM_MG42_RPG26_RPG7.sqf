phx_loadout_rifle_mag_tracer = "";
phx_loadout_rifle_mag = "rhsgref_5Rnd_792x57_kar98k:10";
phx_loadout_rifle_weapon = "rhs_weap_kar98k";
if (pRole == ROLE_AR) then {
  phx_loadout_automaticrifle_weapon = "rhs_weap_pkm";
  phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR_green:4";
};
if (pRole == ROLE_AAR) then {
  phx_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR_green:3";
};
if (pRole == ROLE_MG) then {
  phx_loadout_mmg_weapon = "rhs_weap_mg42";
  phx_loadout_mmg_mag = "rhsgref_296Rnd_792x57_SmE_belt:2";
};
if (pRole == ROLE_AM) then {
  phx_loadout_mmg_mag = "rhsgref_296Rnd_792x57_SmE_belt:2";
};
if (pRole == ROLE_RAT) then {
  phx_loadout_antitank_weapon = "rhs_weap_rpg26";
  phx_loadout_antitank_mag = "";
};
if (pRole == ROLE_CE) then {
  phx_loadout_explosives = "IEDUrbanBig_Remote_Mag:2";
  phx_loadout_explosives_1 = "APERSTripMine_Wire_Mag";
};
if (pRole == ROLE_AT) then {
  phx_loadout_mediumantitank_weapon = "rhs_weap_rpg7";
  phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7V_mag:3";
};
if (pRole == ROLE_AAT) then {
  phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7V_mag:2";
};
if (pRole == ROLE_MK) then {
  phx_loadout_rifle_weapon = "rhs_weap_m76";
  phx_loadout_rifle_mag = "rhssaf_10Rnd_792x57_m76_tracer:5";
  phx_loadout_rifle_optic = "rhs_acc_pso1m2";
};
phx_loadout_flare = "ACE_HandFlare_White:3";
