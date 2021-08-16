/*
Creates a safety for the player. Restricts shooting and throwing grenades.
Removed at safe start end.
*/

//Make player invincible
player allowDamage false;

call phx_fnc_handleSafetyVics; //Make vehicles invincible until safety ends

//Heal player if they were damaged on start
[player] call ace_medical_treatment_fnc_fullHealLocal;

//Stop player from being able to fire weapon and throw grenades
phx_safetyMuzzles = getArray (configFile >> "CfgWeapons" >> "Throw" >> "muzzles");

[{missionNamespace getVariable ["ace_advanced_throwing_enabled",false]}, {ace_advanced_throwing_enabled = false}] call CBA_fnc_waitUntilAndExecute;

//Allow ACE placing and other actions that rely on left mouse button
phx_acePlacing = [{
  if (
    (missionNamespace getVariable ["ace_explosives_placeaction",0] == -1) ||
    (missionNamespace getVariable ["acex_fortify_isPlacing",0] == -1) ||
    (player getVariable ["ace_dragging_iscarrying",false]) ||
    (player getVariable ["ace_dragging_isdragging",false]) ||
    (player getVariable ["ace_trenches_isplacing",false]) ||
    (player getVariable ["ace_tripod_adjusting",false])
  ) then {
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

  if (isManualFire vehicle player) then {
    player action ["manualFireCancel", vehicle player];
  };

  if (!phx_safetyEnabled) then {[_this select 1] call CBA_fnc_removePerFrameHandler};
} , 0] call CBA_fnc_addPerFrameHandler;

[{!phx_safetyEnabled}, {
  [phx_acePlacing] call CBA_fnc_removePerFrameHandler;
  player removeAction phx_safeStartNoFire;
  ace_advanced_throwing_enabled = true;
  player allowDamage true;

  call phx_fnc_showTimeOnMap; //Show time left on map after safety ends
}] call CBA_fnc_waitUntilAndExecute;
