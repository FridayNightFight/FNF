/*
Creates a safety for the player. Restricts shooting and throwing grenades.
Removed at safe start end.
*/

//Make player invincible
player allowDamage false;

call fnf_safety_fnc_handleVics; //Make vehicles invincible until safety ends

//Heal player if they were damaged on start
[player] call ace_medical_treatment_fnc_fullHealLocal;

//Stop player from being able to fire weapon and throw grenades
fnf_safetyMuzzles = getArray (configFile >> "CfgWeapons" >> "Throw" >> "muzzles");

[{missionNamespace getVariable ["ace_advanced_throwing_enabled",false]}, {ace_advanced_throwing_enabled = false}] call CBA_fnc_waitUntilAndExecute;

//Allow ACE placing and other actions that rely on left mouse button
fnf_acePlacing = [{
  if (
    (missionNamespace getVariable ["ace_explosives_placeaction",0] == -1) ||
    (missionNamespace getVariable ["ace_fortify_isPlacing",0] == -1) ||
    (player getVariable ["ace_dragging_iscarrying",false]) ||
    (player getVariable ["ace_dragging_isdragging",false]) ||
    (player getVariable ["ace_trenches_isplacing",false]) ||
    (player getVariable ["ace_tripod_adjusting",false])
  ) then {
    if (!isNil "fnf_safeStartNoFire") then {
      player removeAction fnf_safeStartNoFire;
      fnf_safeStartNoFire = nil;
    };
  } else {
    if (isNil "fnf_safeStartNoFire") then {
      fnf_safeStartNoFire = player addAction ["", {}, nil, 0, false, true, "defaultAction", "
      {
        _this setWeaponReloadingTime [_this, _x, 1];
      } forEach fnf_safetyMuzzles;
      "];
    };
  };

  if (isManualFire vehicle player) then {
    player action ["manualFireCancel", vehicle player];
  };

  if (!(missionNamespace getVariable ["fnf_safetyEnabled", true])) then {
    player removeAction fnf_safeStartNoFire;
    fnf_safeStartNoFire = nil;
    [_this select 1] call CBA_fnc_removePerFrameHandler;
  };
} , 0] call CBA_fnc_addPerFrameHandler;

fnf_switchToMeleeDisablePFH = [{
  _tempWeaponState = weaponState player;
  if (_tempWeaponState select 1 == "vn_melee_muzzle" || _tempWeaponState select 1 == "vn_hand_melee_muzzle") then {
    player selectWeapon (_tempWeaponState select 0);
  };
  if (!(missionNamespace getVariable ["fnf_safetyEnabled", true])) then {[_this select 1] call CBA_fnc_removePerFrameHandler};
}] call CBA_fnc_addPerFrameHandler;

// this var check ensures that on re-run from onPlayerRespawn.sqf, end of restrictions will apply immediately if respawned after safestart
[{!(missionNamespace getVariable ["fnf_safetyEnabled", true])}, {
  ace_advanced_throwing_enabled = true;
  player allowDamage true;


  // Sustained Assault zoneProtection for safezones and rally markers
  if (fnf_gameMode == "sustainedAssault") then {

    if (!isNil "fnf_safety_handle_zoneProtection") then {
      [fnf_safety_handle_zoneProtection] call CBA_fnc_removePerFrameHandler;
      fnf_safety_handle_zoneProtection = nil;
    };

    player setVariable ["fnf_zoneProtectionActive", false, true];
    fnf_safety_handle_zoneProtection = [{
      if (([player, playerSide] call fnf_fnc_inSafeZone) && !(player getVariable "fnf_zoneProtectionActive")) then {
        player setVariable ["fnf_zoneProtectionActive", true, true];
        player allowDamage false;
        ["<t align='center'>Safe zone protection is active<br/>Loadout selectors available</t>", "info", 5] call fnf_ui_fnc_notify;
      };
      if (!([player, playerSide] call fnf_fnc_inSafeZone) && (player getVariable "fnf_zoneProtectionActive")) then {
        player setVariable ["fnf_zoneProtectionActive", false, true];
        player allowDamage true;
        ["<t align='center'>Safe zone protection has been removed<br/>Loadout selectors unavailable</t>", "info", 5] call fnf_ui_fnc_notify;
      };
    }, 3] call CBA_fnc_addPerFrameHandler;
  };
}] call CBA_fnc_waitUntilAndExecute;
