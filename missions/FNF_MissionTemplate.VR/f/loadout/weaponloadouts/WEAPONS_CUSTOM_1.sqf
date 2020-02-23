/*
For magazines, use the format "MAGAZINE_CLASSNAME:NUMBER_OF_MAGS"
example:
phx_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:9"; //mag classname of "rhs_mag_30Rnd_556x45_M855A1_Stanag", with 9 magazines
*/

phx_loadout_rifle_weapon = "";
phx_loadout_rifle_mag_tracer = "";
phx_loadout_rifle_mag = "";

phx_loadout_sidearm_weapon = "";
phx_loadout_sidearm_mag = "";

phx_loadout_rifle_gl_he = "";
phx_loadout_rifle_gl_smoke = "";
phx_loadout_rifle_gl_flare = "";

phx_loadout_automaticrifle_weapon = "";
phx_loadout_automaticrifle_mag = "";

phx_loadout_mmg_weapon = "";
phx_loadout_mmg_mag = "";

phx_loadout_antitank_weapon = "";
phx_loadout_antitank_mag = "";

phx_loadout_mediumantitank_weapon = "";
phx_loadout_mediumantitank_optic = "";
phx_loadout_mediumantitank_mag = "";

phx_loadout_rifle_optic = ""; //Only used by marksman role

phx_loadout_flare = "";

allowedWeapons = []; //Weapons that can be selected in the gear selector. Leave blank for none.

/*
//Uncomment this block to add optics that players can select from.
//Either leave it in this scope for it to be applied to every player, or move it to the switch cases below to apply to a specific class.

[] spawn {
  waitUntil {!isNil "allowedOptics"};
  allowedOptics pushBack "OPTIC_CLASSNAME";
};
*/

//Use if you want to customize more
switch (pRole) do {
  case ROLE_PL: {}; //Platoon leader
  case ROLE_CLS: {}; //Medic
  case ROLE_SL: {}; //Squad leader
  case ROLE_TL: {}; //Team leader
  case ROLE_AR: {}; //Automatic rifleman
  case ROLE_AAR: {}; //Assistant automatic rifleman
  case ROLE_RAT: {}; //Rifleman (LAT)
  case ROLE_CE: {}; //Combat engineer
  case ROLE_R: {}; //Rifleman
  case ROLE_MG: {}; //Machinegunner
  case ROLE_AM: {}; //Ammo man
  case ROLE_MGTL: {}; //Machine gun team leader
  case ROLE_AT: {}; //Anti-tank
  case ROLE_AAT: {}; //Assistant anti-tank
  case ROLE_P: {}; //Pilot
  case ROLE_CR: {}; //Crewman
  case ROLE_MK: {}; //Marksman
};
