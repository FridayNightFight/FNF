#include "cfgLoadouts.hpp"

player addWeapon phx_loadout_rifle_weapon;
player addWeapon phx_loadout_sidearm_weapon;

switch (pRole) do {
  case ROLE_RAT: {
    player addWeapon phx_loadout_antitank_weapon;
  };
  case ROLE_AT: {
      player addWeapon phx_loadout_mediumantitank_weapon;
      player addSecondaryWeaponItem phx_loadout_mediumantitank_optic;
  };
  case ROLE_MK: {
    player addPrimaryWeaponItem phx_loadout_rifle_optic;
  };
};
