#include "cfgLoadouts.hpp"

phx_loadout_aid call phx_fnc_addGear;
phx_loadout_smoke call phx_fnc_addGear;
phx_loadout_grenade call phx_fnc_addGear;
phx_loadout_maptools call phx_fnc_addGear;

switch (pRole) do {
  case ROLE_CE: {
    phx_loadout_explosives call phx_fnc_addGear;
    phx_loadout_defusalkit call phx_fnc_addGear;
    phx_loadout_trigger call phx_fnc_addGear;
    phx_loadout_entrenching call phx_fnc_addGear;
    phx_loadout_detector call phx_fnc_addGear;
  };
  case ROLE_MGTL: {
    phx_loadout_entrenching call phx_fnc_addGear;
  };
  case ROLE_CLS: {
    [phx_loadout_PAK, "backpack"] call phx_fnc_addGear;
    [phx_loadout_bandage, "backpack"] call phx_fnc_addGear;
    [phx_loadout_morphine, "backpack"] call phx_fnc_addGear;
    [phx_loadout_epinephrine, "backpack"] call phx_fnc_addGear;
    [phx_loadout_blood, "backpack"] call phx_fnc_addGear;
  };
};

if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL || pRole == ROLE_MK || pRole == ROLE_SP) then {
  player addWeapon phx_loadout_vector;
};

if (pRole == ROLE_AAR || pRole == ROLE_AAT || pRole == ROLE_AM || pRole == ROLE_CR) then {
  player addWeapon phx_loadout_binocular;
};

if (pRole == ROLE_MK) then {phx_loadout_sswt call phx_fnc_addGear;};

if (pRole == ROLE_PL || pRole == ROLE_SL) then {
  phx_loadout_unitLevel = 2;
};
if (pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_unitLevel = 1;
};
