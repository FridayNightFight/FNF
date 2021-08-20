phx_loadout_rifle_mag call phx_fnc_addGear;
phx_loadout_sidearm_mag call phx_fnc_addGear;

if (!phx_loadout_hasSpecial) then {phx_loadout_rifle_mag_tracer call phx_fnc_addGear};

switch (pRole) do {
  case ROLE_AAR: {phx_loadout_aar_mag call phx_fnc_addGear};
  case ROLE_AM: {phx_loadout_am_mag call phx_fnc_addGear};
  case ROLE_AT: {phx_loadout_mediumantitank_mag call phx_fnc_addGear};
  case ROLE_AAT: {phx_loadout_mediumantitank_mag call phx_fnc_addGear};
  case ROLE_RAT: {if (!isNil "phx_loadout_antitank_mag") then {phx_loadout_antitank_mag call phx_fnc_addGear}};
};

if ((phx_loadout_hasUGL || pRole == ROLE_GRIR)) then {{_x call phx_fnc_addGear} forEach phx_loadout_uglAmmo};
