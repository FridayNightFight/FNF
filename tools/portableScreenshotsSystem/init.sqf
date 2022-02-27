/*
  These files can be loaded into a mission to equip units with FNF loadouts. Intended for screenshot purposes only.

  Friday Night Fight
  Contact: Indigo#6290
*/


if !(fileExists "kitHash.txt") exitWith {hint "Failed to load kit hash! Missing file"};
KITS = [call compile (loadFile "kitHash.txt"), true] call CBA_fnc_deserializeNamespace;

// kitHash is from v3.2.0 of primary framework

// CONFIGURE THESE
loadoutSetChoice_west = "rhs_uni_nato_ger_bundeswehr_2010 | rhs_gear_nato_bundeswehr_2010_g36";
loadoutSetChoice_east = "rhs_uni_ru_spetsnaz_2010 | rhs_gear_ru_army_2010_ak74m";
loadoutSetChoice_guer = "rhs_uni_id_insurgents_2000 | rhs_gear_id_insurgents_2000_ak74n";

/*
  KIT CHOICES
  "rhs_uni_id_navsog_2010 | rhs_gear_id_navsog_2010_m16a4"
  "rhs_uni_ru_spetsnaz_2010 | rhs_gear_ru_army_2010_ak74m"
  "rhs_uni_ru_army_1980 | rhs_gear_ru_army_1980_ak74"
  "rhs_uni_nato_greekforces_2010 | rhs_gear_nato_greekforces_2010_l1a1"
  "rhs_uni_ru_ratnik_2020 | rhs_gear_ru_army_2010_ak74m"
  "rhs_uni_nato_ger_bundeswehr_2010 | rhs_gear_nato_bundeswehr_2010_g36"
  "rhs_uni_nato_us_army_2020 | rhs_gear_us_army_2010_m16a4"
  "rhs_uni_nato_us_marines_desert_2010 | rhs_gear_us_marines_2020_m27"
  "rhs_uni_nato_france_2010 | rhs_gear_nato_france_2010_famas"
  "rhs_uni_id_tribal_2010 | rhs_gear_id_tribal_2010_akmn"
  "rhs_uni_any_czechforces_2010 | rhs_gear_any_czechforces_2010_vz58"
  "rhs_uni_ru_ratnik_d_2020 | rhs_gear_ru_army_2010_ak74m"
  "rhs_uni_nato_de_westgerman_1980 | rhs_gear_nato_westgerman_1980_g3"
  "rhs_uni_nato_us_army_1980 | rhs_gear_us_army_1980_m16a1"
  "rhs_uni_nato_ukrainian_2010 | rhs_gear_nato_ukrainian_2010_ak74uuk"
  "rhs_uni_nato_us_navy_2010 | rhs_gear_us_navy_2010_mk18"
  "rhs_uni_any_yugoslavia_2000 | rhs_gear_any_yugoslavia_2000_m70"
  "rhs_uni_id_african_militia_2010 | rhs_gear_id_african_militia_2010_akmn"
  "rhs_uni_any_croatian_2010 | rhs_gear_any_croatian_2010_vhs"
  "rhs_uni_id_rebels_2010 | rhs_gear_id_rebels_2010_akmn"
  "rhs_uni_id_turkish_army_2010 | rhs_gear_id_turkish_2010_hk33a2"
  "rhs_uni_nato_us_marines_woodland_2010 | rhs_gear_us_marines_2020_m27"
  "rhs_uni_nato_us_rangers_2020 | rhs_gear_us_rangers_2010_scar"
  "apex_uni_any_african_police_2010 | rhs_gear_any_african_police_2010_famas"
  "rhs_uni_id_insurgents_2000 | rhs_gear_id_insurgents_2000_ak74n"
  "rhs_uni_any_serbianforces_2010 | rhs_gear_any_serbian_army_2010_m21"
  "rhs_uni_ru_cossacks_2010 | rhs_gear_ru_army_2010_ak74m"
  "rhs_uni_id_iraqi_army_2000 | rhs_gear_id_iraqi_army_2000_akmn"
  "rhs_uni_id_mec_2010 | rhs_gear_id_mec_2010_ak103"
*/

loadoutSet_west = createHashMapFromArray (KITS getVariable [loadoutSetChoice_west, []]);
loadoutSet_east = createHashMapFromArray (KITS getVariable [loadoutSetChoice_east, []]);
loadoutSet_guer = createHashMapFromArray (KITS getVariable [loadoutSetChoice_guer, []]);

{
  private _mySideLoadout = missionNamespace getVariable [
    format["loadoutSet_%1", (side _x) call BIS_fnc_sideNameUnlocalized],
    "rhs_uni_id_african_militia_2010 | rhs_gear_id_african_militia_2010_akmn"
  ];
  private _unitLoadout = _mySideLoadout get (_x getVariable ["fnfLoadout", "BASE"]);
  _x setUnitLoadout _unitLoadout;
} forEach (entities [["CAManBase"], [], true, false]);


/*
  UNIT ROLES (i.e. "SL", "TL", "AR")

  include the following in unit inits to have their kits applied based on side and choices above
  this setVariable ["fnfLoadout", "SL"];

  ["PL",["Platoon Leader","LIEUTENANT"]],
  ["SGT",["Platoon Sergeant","SERGEANT"]],
  ["SL",["Squad Leader","SERGEANT"]],
  ["TL",["Team Leader","CORPORAL"]],
  ["AR",["Autorifleman","PRIVATE"]],
  ["ARA",["Asst. Autorifleman","PRIVATE"]],
  ["GR",["Grenadier","PRIVATE"]],
  ["GRIR",["Sr. Grenadier","CORPORAL"]],
  ["MG",["Machine Gunner","PRIVATE"]],
  ["MGA",["Asst. Machine Gunner","PRIVATE"]],
  ["CE",["Combat Engineer","PRIVATE"]],
  ["LAT",["AT Rifleman","PRIVATE"]],
  ["MAT1",["AT Specialist","PRIVATE"]],
  ["MATA1",["Asst. AT Specialist","PRIVATE"]],
  ["MAT2",["AT Specialist","PRIVATE"]],
  ["MATA2",["Asst. AT Specialist","PRIVATE"]],
  ["RI",["Rifleman","PRIVATE"]],
  ["RIS",["Sr. Rifleman","CORPORAL"]],
  ["DM",["Marksman","PRIVATE"]],
  ["SNP",["Sniper","CORPORAL"]],
  ["CRL",["Vehicle Cmdr","SERGEANT"]],
  ["CR",["Crewman","CORPORAL"]],
  ["PI",["Pilot","LIEUTENANT"]],
  ["MED",["Medic","CORPORAL"]],
  ["SHQAUX",["Crew/Wpn Operator","PRIVATE"]],
  ["BASE",["Crew/Wpn Operator","PRIVATE"]]
*/