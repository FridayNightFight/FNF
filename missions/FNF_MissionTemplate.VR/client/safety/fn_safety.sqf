//Make player invincible
player allowDamage false;

//Heal player if they were damaged on start
[player] call ace_medical_treatment_fnc_fullHealLocal;

//Stop player from being able to fire weapon and throw grenades
phx_safetyMuzzles = getArray (configFile >> "CfgWeapons" >> "Throw" >> "muzzles");

//Disable ACE advanced throwing
[] spawn {
  waitUntil {!isNil "ace_advanced_throwing_enabled"};
  sleep 2;
  ace_advanced_throwing_enabled = false;
};

//Allow ACE placing
phx_acePlacing = [{
  if ((missionNamespace getVariable ["ace_explosives_placeaction",0] == -1) || (missionNamespace getVariable ["acex_fortify_isPlacing",0] == -1) || (player getVariable ["ace_dragging_iscarrying",false]) || (player getVariable ["ace_dragging_isdragging",false]) || (player getVariable ["ace_trenches_isplacing",false])) then {
    if (!isNil "phx_safeStartNoFire") then {
      player removeAction phx_safeStartNoFire;
      phx_safeStartNoFire = nil;
    };
  } else {
    if (isNil "phx_safeStartNoFire") then {
      phx_safeStartNoFire = player addAction ["", {}, nil, 0, false, true, "defaultAction", "
      {
        _this setWeaponReloadingTime [_this, _x, 1];
      } forEach phx_safetyMuzzles;
      "];
    };
  };

  if (!phx_safetyEnabled) then {[_this select 1] call CBA_fnc_removePerFrameHandler};
} , 0] call CBA_fnc_addPerFrameHandler;


[] spawn {
  waitUntil {!phx_safetyEnabled};

  [phx_acePlacing] call CBA_fnc_removePerFrameHandler;
  player removeAction phx_safeStartNoFire;
  ace_advanced_throwing_enabled = true;
  player allowDamage true;

  if (!isNil "leadAction") then {
    player removeAction leadAction;
  };

  //Make typing in chat not possible after safe start ends unless player is logged-in admin or staff
  46 call phx_fnc_disableTyping;

  //Remove gear selector
  [(typeOf player), 1, ["ACE_SelfActions","Gear_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;

  //Check if player goes afk during mission
  if (!isNil "phx_idleKill") then {
    if (phx_idleKill) then {
      [] spawn phx_fnc_afkCheck;
    };
  };
};
