/*
Creates a safety for the player. Restricts shooting and throwing grenades.
Removed at safe start end.
*/

//Make player invincible
player allowDamage false;

call phx_safety_fnc_handleVics; //Make vehicles invincible until safety ends

//Heal player if they were damaged on start
[player] call ace_medical_treatment_fnc_fullHealLocal;

//Stop player from being able to fire weapon and throw grenades
phx_safetyMuzzles = getArray (configFile >> "CfgWeapons" >> "Throw" >> "muzzles");

[{missionNamespace getVariable ["ace_advanced_throwing_enabled",false]}, {ace_advanced_throwing_enabled = false}] call CBA_fnc_waitUntilAndExecute;

//Allow ACE placing and other actions that rely on left mouse button
phx_acePlacing = [{
  if (
    (missionNamespace getVariable ["ace_explosives_placeaction",0] == -1) ||
    (missionNamespace getVariable ["ace_fortify_isPlacing",0] == -1) ||
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

  if (!(missionNamespace getVariable ["phx_safetyEnabled", true])) then {
    player removeAction phx_safeStartNoFire;
    phx_safeStartNoFire = nil;
    [_this select 1] call CBA_fnc_removePerFrameHandler;
  };
} , 0] call CBA_fnc_addPerFrameHandler;

phx_switchToMeleeDisablePFH = [{
  _tempWeaponState = weaponState player;
  if (_tempWeaponState select 1 == "vn_melee_muzzle" || _tempWeaponState select 1 == "vn_hand_melee_muzzle") then {
    player selectWeapon (_tempWeaponState select 0);
  };
  if (!phx_safetyEnabled) then {[_this select 1] call CBA_fnc_removePerFrameHandler};
}] call CBA_fnc_addPerFrameHandler;

[{!(missionNamespace getVariable ["phx_safetyEnabled", true])}, {
  ace_advanced_throwing_enabled = true;
  player allowDamage true;


  // Sustained Assault zoneProtection for safezones and rally markers
  if (phx_gameMode == "sustainedAssault") then {

    if (!isNil "phx_safety_handle_zoneProtection") then {
      if !(scriptDone phx_safety_handle_zoneProtection) then {
        [phx_safety_handle_zoneProtection] call CBA_fnc_removePerFrameHandler;
      };
    };

    player setVariable ["fnf_zoneProtectionActive", false, true];
    switch (playerSide) do {
      case west: {
        phx_safety_handle_zoneProtection = [{
          if ((player inArea safeZone_BLUFOR || player inArea "rally_west_marker") && !(player getVariable "fnf_zoneProtectionActive")) then {
            player setVariable ["fnf_zoneProtectionActive", true, true];
            player allowDamage false;
            ["<t align='center'>Safe zone protection is active</t>", "info", 5] call phx_ui_fnc_notify;
          };
          if (!(player inArea safeZone_BLUFOR || player inArea "rally_west_marker") && (player getVariable "fnf_zoneProtectionActive")) then {
            player setVariable ["fnf_zoneProtectionActive", false, true];
            player allowDamage true;
            ["<t align='center'>Safe zone protection has been removed</t>", "info", 5] call phx_ui_fnc_notify;
          };
        }, 3] call CBA_fnc_addPerFrameHandler;
      };
      case east: {
        phx_safety_handle_zoneProtection = [{
          if ((player inArea safeZone_OPFOR || player inArea "rally_east_marker") && !(player getVariable "fnf_zoneProtectionActive")) then {
            player setVariable ["fnf_zoneProtectionActive", true, true];
            player allowDamage false;
            ["<t align='center'>Safe zone protection is active</t>", "info", 5] call phx_ui_fnc_notify;
          };
          if (!(player inArea safeZone_OPFOR || player inArea "rally_east_marker") && (player getVariable "fnf_zoneProtectionActive")) then {
            player setVariable ["fnf_zoneProtectionActive", false, true];
            player allowDamage true;
            ["<t align='center'>Safe zone protection has been removed</t>", "info", 5] call phx_ui_fnc_notify;
          };
        }, 3] call CBA_fnc_addPerFrameHandler;
      };
      case independent: {
        phx_safety_handle_zoneProtection = [{
          if ((player inArea safeZone_Independent || player inArea "rally_independent_marker") && !(player getVariable "fnf_zoneProtectionActive")) then {
            player setVariable ["fnf_zoneProtectionActive", true, true];
            player allowDamage false;
            ["<t align='center'>Safe zone protection is active</t>", "info", 5] call phx_ui_fnc_notify;
          };
          if (!(player inArea safeZone_Independent || player inArea "rally_independent_marker") && (player getVariable "fnf_zoneProtectionActive")) then {
            player setVariable ["fnf_zoneProtectionActive", false, true];
            player allowDamage true;
            ["<t align='center'>Safe zone protection has been removed</t>", "info", 5] call phx_ui_fnc_notify;
          };
        }, 3] call CBA_fnc_addPerFrameHandler;
      };
    };
  };
}] call CBA_fnc_waitUntilAndExecute;
