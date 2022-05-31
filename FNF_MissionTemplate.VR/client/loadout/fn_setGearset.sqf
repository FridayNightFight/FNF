#include "..\..\description\configDefs.hpp"

private "_gearset";

switch (playerSide) do {
  case west: {_gearset = phx_gearset_blufor};
  case east: {_gearset = phx_gearset_opfor};
  case independent: {_gearset = phx_gearset_indfor};
};

switch (_gearset) do {
  case GERMANY_EARLY: {pUniform = "UNIFORM_GERMANY_EARLY"; pWeapons = "WEAPONS_GERMANY_EARLY"};
  case GERMANY_LATE: {pUniform = "UNIFORM_GERMANY_LATE"; pWeapons = "WEAPONS_GERMANY_LATE"};
  case GERMANY_DAK: {pUniform = "UNIFORM_GERMANY_DAK"; pWeapons = "WEAPONS_GERMANY_EARLY"};
  case GERMANY_WINTER: {pUniform = "UNIFORM_GERMANY_WINTER"; pWeapons = "WEAPONS_GERMANY_EARLY"};
  case GERMANY_FSJ: {pUniform = "UNIFORM_GERMANY_FSJ"; pWeapons = "WEAPONS_GERMANY_PARA"};
  case GERMANY_STORMTROOPER: {pUniform = "UNIFORM_GERMANY_STORMTROOPER"; pWeapons = "WEAPONS_GERMANY_LATE"};

  case JAPAN: {pUniform = "UNIFORM_JAPAN"; pWeapons = "WEAPONS_JAPAN"};

  case SOVIET: {pUniform = "UNIFORM_SOVIET"; pWeapons = "WEAPONS_SOVIET"};
  case SOVIET_WINTER: {pUniform = "UNIFORM_SOVIET_WINTER"; pWeapons = "WEAPONS_SOVIET"};

  case USA_ARMY: {pUniform = "UNIFORM_USA_ARMY"; pWeapons = "WEAPONS_USA"};
  case USA_AIRBORNE: {pUniform = "UNIFORM_USA_AIRBORNE"; pWeapons = "WEAPONS_USA"};
  case USA_RANGERS: {pUniform = "UNIFORM_USA_RANGERS"; pWeapons = "WEAPONS_USA"};
  case USA_TORCH: {pUniform = "UNIFORM_USA_TORCH"; pWeapons = "WEAPONS_USA"};
  case USMC: {pUniform = "UNIFORM_USMC"; pWeapons = "WEAPONS_USA"};

  case BRITAIN_EARLY: {pUniform = "UNIFORM_BRITAIN_EARLY"; pWeapons = "WEAPONS_BRITAIN_EARLY"};
  case BRITAIN_DESERT: {pUniform = "UNIFORM_BRITAIN_DESERT"; pWeapons = "WEAPONS_BRITAIN_EARLY"};
  case BRITAIN_JUNGLE: {pUniform = "UNIFORM_BRITAIN_JUNGLE"; pWeapons = "WEAPONS_BRITAIN_EARLY"};
  case BRITAIN_LATE: {pUniform = "UNIFORM_BRITAIN_LATE"; pWeapons = "WEAPONS_BRITAIN_LATE"};
  case BRITAIN_PARA: {pUniform = "UNIFORM_BRITAIN_PARA"; pWeapons = "WEAPONS_BRITAIN_LATE"};

  case POLISH: {pUniform = "UNIFORM_POLISH"; pWeapons = "WEAPONS_POLISH"};
};
