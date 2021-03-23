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

_addLaser = {{player addPrimaryWeaponItem _x} forEach ["rhs_acc_perst1ik", "rhsusf_acc_anpeq15A"];};
switch (typeName phx_addNVG) do {
  case "BOOL": {if (phx_addNVG) then {call _addLaser};};
  case "SIDE": {if (playerSide == phx_addNVG) then {call _addLaser};};
  case "ARRAY": {if (playerSide in phx_addNVG) then {call _addLaser};};
};
