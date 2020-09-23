#include "cfgLoadouts.hpp"
#include "..\..\shared\definitions.hpp"

#include "weapons\bluforLoadout.sqf"
#include "weapons\opforLoadout.sqf"
#include "weapons\indforLoadout.sqf"

switch (playerSide) do {
  case east: {pWeapons = phx_opforWeapons};
  case west: {pWeapons = phx_bluforWeapons};
  case independent: {pWeapons = phx_indforWeapons};
  case civilian: {pWeapons = phx_civWepaons};
};

switch (playerSide) do {
  case east: {call giveOPFORLoadout};
  case west: {call giveBLUFORLoadout};
  case independent: {call giveINDFORLoadout};
};

if (pRole == ROLE_AT || pRole == ROLE_AAT) then {
  _at = "";
  switch (playerSide) do {
    case east: {_at = phx_redAT};
    case west: {_at = phx_bluAT};
    case independent: {_at = phx_grnAT};
  };

  phx_loadout_mediumantitank_weapon = _at;
  phx_loadout_mediumantitank_optic = "";
  phx_loadout_mediumantitank_mag_1 = "";

  switch (phx_loadout_mediumantitank_weapon) do {
    case CARLG: {
      phx_loadout_mediumantitank_optic = "rhs_optic_maaws";
      phx_loadout_mediumantitank_mag = "rhs_mag_maaws_HEAT:3";
    };
    case RPG32: {
      phx_loadout_mediumantitank_mag = "RPG32_F:3";
    };
    case RPG7: {
      phx_loadout_mediumantitank_optic = "rhs_acc_pgo7v3";
      phx_loadout_mediumantitank_mag = "rhs_rpg7_PG7VL_mag:5";
    };
    case TITAN: {
      phx_loadout_mediumantitank_mag = "Titan_AT:2";
    };
    case NLAW: {
      phx_loadout_mediumantitank_mag = "NLAW_F";
      if (pRole == ROLE_AAT) then {
        phx_loadout_mediumantitank_mag = "";
      };
    };
    case METIS: {
      phx_loadout_mediumantitank_mag = "Vorona_HEAT:3";
    };
    case STINGER: {
      phx_loadout_mediumantitank_mag = "rhs_fim92_mag";
    };
    case IGLA: {
      phx_loadout_mediumantitank_mag = "rhs_mag_9k38_rocket";
    };
  };
};

switch (pWeapons) do {
  case "WEAPONS_M4A1_BLOCK_M249_M240G_M136": {call giveBLUFORLoadout};
  case "WEAPONS_AK74M_PKM_PKP_RPG7": {call giveOPFORLoadout};
  case "WEAPONS_AKMN_PKM_PKP_RPG7": {call giveINDFORLoadout};
};

if !(pWeapons in ["WEAPONS_M4A1_BLOCK_M249_M240G_M136", "WEAPONS_AK74M_PKM_PKP_RPG7", "WEAPONS_AKMN_PKM_PKP_RPG7"]) then {
  _incStr = "client\loadout\weapons\" + pWeapons + ".sqf";

  call compile preprocessFileLineNumbers _incStr;
};
