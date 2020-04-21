//Make player invincible
player allowDamage false;

//Stop player from being able to fire weapon and throw grenades
phx_safetyMuzzles = getArray (configFile >> "CfgWeapons" >> "Throw" >> "muzzles");
phx_safeStartNoFire = player addAction ["", {}, nil, 0, false, true, "defaultAction", "
{
  _this setWeaponReloadingTime [_this, _x, 1];
} forEach phx_safetyMuzzles;
"];

//Remove respawn button
phx_safeStartNoRespawn = [{
  _ctrl = (findDisplay 49) displayCtrl 1010;
  _ctrl ctrlEnable false;
} , 0.25, []] call CBA_fnc_addPerFrameHandler;

//Disable ACE advanced throwing
[] spawn {
  waitUntil {!isNil "ace_advanced_throwing_enabled"};
  uiSleep 2;
  ace_advanced_throwing_enabled = false;
};

waitUntil {!phx_safetyEnabled};

player removeAction phx_safeStartNoFire;
ace_advanced_throwing_enabled = true;
player allowDamage true;

phx_safeStartNoRespawn call CBA_fnc_removePerFrameHandler;
if (!isNil "phx_fortifyNoFire") then {
  player removeEventHandler ["FiredMan", phx_fortifyNoFire];
};

if (!isNil "leadAction") then {
  player removeAction leadAction;
};

//Make typing in chat not possible after safe start ends unless player is logged-in admin
if !(serverCommandAvailable "#kick") then {
  (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 in actionKeys 'Chat') then { true } else { false };"];
};

[(typeOf player), 1, ["ACE_SelfActions","Gear_Selector"]] call ace_interact_menu_fnc_removeActionFromClass;
