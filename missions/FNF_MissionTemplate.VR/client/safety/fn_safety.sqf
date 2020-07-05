//Make player invincible
player allowDamage false;

//Heal player if they were damaged on start
[objNull, player] call ace_medical_treatment_fnc_fullHeal;

//Stop player from being able to fire weapon and throw grenades
phx_safetyMuzzles = getArray (configFile >> "CfgWeapons" >> "Throw" >> "muzzles");
phx_safeStartNoFire = player addAction ["", {}, nil, 0, false, true, "defaultAction", "
{
  _this setWeaponReloadingTime [_this, _x, 1];
} forEach phx_safetyMuzzles;
"];

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
} , 0.1, []] call CBA_fnc_addPerFrameHandler;

waitUntil {!phx_safetyEnabled};

[phx_acePlacing] call CBA_fnc_removePerFrameHandler;
player removeAction phx_safeStartNoFire;
ace_advanced_throwing_enabled = true;
player allowDamage true;

if (!isNil "leadAction") then {
  player removeAction leadAction;
};

//Make typing in chat not possible after safe start ends unless player is logged-in admin
if !(serverCommandAvailable "#kick") then {
  (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 in actionKeys 'Chat') then { true } else { false };"];
};

[(typeOf player), 1, ["ACE_SelfActions","Gear_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
