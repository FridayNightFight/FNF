player addWeapon phx_loadout_rifle_weapon;
player addWeapon phx_loadout_sidearm_weapon;

switch (pRole) do {
  case ROLE_RAT: {player addWeapon phx_loadout_antitank_weapon};
  case ROLE_AT: {
      player addWeapon phx_loadout_mediumantitank_weapon;
      player addSecondaryWeaponItem phx_loadout_mediumantitank_optic;
  };
  case ROLE_MK: {player addPrimaryWeaponItem phx_loadout_rifle_optic};
  case ROLE_RS: {
    _muzzleAcc = [phx_loadout_rifle_weapon, "muzzle"] call CBA_fnc_compatibleItems;
    _silencers = _muzzleAcc select {getNumber(configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "soundTypeIndex") > 0};
    if (count _silencers > 0) then {player addPrimaryWeaponItem (_silencers select 0)};

    _mags = [phx_loadout_rifle_weapon] call CBA_fnc_compatibleMagazines;
    _magsSubsonic = [];
    {
      _ammo = getText(configfile >> "CfgMagazines" >> _x >> "ammo");
      if (getNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_muzzleVelocities") # 0) < 600) then {
        _magsSubsonic pushBack _x;
      };
    } forEach _mags;
    systemChat _magsSubsonic;

  };

  ACE_muzzleVelocities[] = {300};
};

_addLaser = {{player addPrimaryWeaponItem _x} forEach ["rhs_acc_perst1ik", "rhsusf_acc_anpeq15A"];};
switch (typeName phx_addNVG) do {
  case "BOOL": {if (phx_addNVG) then {call _addLaser};};
  case "SIDE": {if (playerSide == phx_addNVG) then {call _addLaser};};
  case "ARRAY": {if (playerSide in phx_addNVG) then {call _addLaser};};
};
