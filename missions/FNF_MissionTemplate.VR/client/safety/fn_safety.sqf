switch (_this) do {
  case true: {
    //Stop player from being able to fire weapon and throw grenades
    phx_safetyMuzzles = getArray (configFile >> "CfgWeapons" >> "Throw" >> "muzzles");
    phx_safeStartNoFire = player addAction ["", {}, nil, 0, false, true, "defaultAction", "
    {
      _this setWeaponReloadingTime [_this, _x, 1];
    } forEach phx_safetyMuzzles;
    "];

    //Disable ACE advanced throwing
    ace_advanced_throwing_enabled = false;

    //Make player invincible
    player allowDamage false;

    //Remove respawn button
    phx_safeStartNoRespawn = [{
      _ctrl = (findDisplay 49) displayCtrl 1010;
      _ctrl ctrlEnable false;
    } , 0.25, []] call CBA_fnc_addPerFrameHandler;
  };
  case false: {
    player removeAction phx_safeStartNoFire;
    ace_advanced_throwing_enabled = true;
    player allowDamage true;

    phx_safeStartNoRespawn call CBA_fnc_removePerFrameHandler;
    if (!isNil "phx_fortifyNoFire") then {
      player removeEventHandler ["FiredMan", phx_fortifyNoFire];
    };

    //Make typing in chat not possible after safe start ends unless player is logged-in admin
    if !(serverCommandAvailable "#kick") then {
      (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 in actionKeys 'Chat') then { true } else { false };"];
    };
  };
};
