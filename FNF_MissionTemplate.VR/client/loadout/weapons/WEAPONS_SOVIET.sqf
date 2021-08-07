#include "WEAPONS_RU.sqf"

if (!phx_loadout_hasSpecial) then {
  switch (selectRandom [1,2]) do {
    case 1: {
      phx_loadout_rifle_weapon = "rhs_weap_ak74n";
      phx_loadout_rifle_mag = "rhs_30Rnd_545x39_7N6M_AK:7";
      phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green:4";
    };
    case 2: {
      phx_loadout_rifle_weapon = "rhs_weap_akmn";
      phx_loadout_rifle_mag = "rhs_30Rnd_762x39mm_polymer:7";
      phx_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm_polymer_tracer:4";
    };
  };
};

if (pRole == ROLE_MG) then {
  phx_loadout_rifle_weapon = "rhs_weap_pkm";
};

if (phx_loadout_hasUGL) then {
  phx_loadout_rifle_weapon = "rhs_weap_ak74n_gp25_npz";
  phx_loadout_rifle_mag = "rhs_30Rnd_545x39_7N6M_AK:7";
  phx_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green:4";
};
