#include "cfgLoadouts.hpp"

phx_loadout_rifle_mag call phx_fnc_addGear;
phx_loadout_sidearm_mag call phx_fnc_addGear;

if (pRole != ROLE_AR && pRole != ROLE_MG && pRole != ROLE_MK && pRole != ROLE_P) then {
  phx_loadout_rifle_mag_tracer call phx_fnc_addGear;
};

switch (pRole) do {
  case ROLE_AAR: {
    phx_loadout_aar_mag call phx_fnc_addGear;
  };
  case ROLE_AM: {
    phx_loadout_am_mag call phx_fnc_addGear;
  };
  case ROLE_AT: {
    phx_loadout_mediumantitank_mag call phx_fnc_addGear;
  };
  case ROLE_AAT: {
    phx_loadout_mediumantitank_mag call phx_fnc_addGear;
  };
  case ROLE_RAT: {
    if (!isNil "phx_loadout_antitank_mag") then {phx_loadout_antitank_mag call phx_fnc_addGear};
  };
};

if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
  phx_loadout_rifle_gl_he call phx_fnc_addGear;
  phx_loadout_rifle_gl_smoke call phx_fnc_addGear;
  phx_loadout_rifle_gl_flare call phx_fnc_addGear;
};
