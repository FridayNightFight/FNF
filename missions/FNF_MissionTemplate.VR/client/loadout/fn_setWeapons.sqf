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

switch (pWeapons) do {
    case WEAPONS_AKMN_PKM_PKP_RPG7_RPG32: {
      #include "weapons\WEAPONS_AKMN_PKM_PKP_RPG7_RPG32.sqf"
    };
    case WEAPONS_RANDOM: {
      #include "weapons\WEAPONS_RANDOM.sqf"
    };
    case WEAPONS_CUSTOM_1: {
      #include "weapons\WEAPONS_CUSTOM_1.sqf"
    };
    case WEAPONS_CUSTOM_2: {
      #include "weapons\WEAPONS_CUSTOM_2.sqf"
    };
    case WEAPONS_CUSTOM_3: {
      #include "weapons\WEAPONS_CUSTOM_3.sqf"
    };
    case WEAPONS_UNARMED: {
      #include "weapons\WEAPONS_UNARMED.sqf"
    };
    default {};
};
