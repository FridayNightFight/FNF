#include "cfgLoadouts.hpp"

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

if !(pWeapons in ["WEAPONS_M4A1_BLOCK_M249_M240G_M136_GUST", "WEAPONS_AK74M_PKM_PKP_RPG7_RPG32", "WEAPONS_AKMN_PKM_PKP_RPG7_RPG32"]) then {
  _incStr = "client\loadout\weapons\" + pWeapons + ".sqf";

  call compile preprocessFileLineNumbers _incStr;
};
