// F3 - Safe Start, Safety Toggle
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//=====================================================================================

// Exit if server
if (!hasInterface) exitwith {};
waitUntil {!isNull player};
switch (_this select 0) do
{
    // Turn safety on
    case true:
    {
        phx_safeStartEnabled = true;

        // Delete bullets from fired weapons
        if (isNil "f_eh_safetyMan") then {
            f_eh_safetyMan = player addEventHandler["Fired", {
                params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

                deletevehicle _projectile;
                "phx_safeStartTextLayer" cutText ["SAFESTART ACTIVE", "PLAIN", 0];
                "phx_safeStartTextLayer" cutFadeOut 3;
                if (_weapon isEqualTo "Throw" || {_weapon isEqualTo "Put"}) then {
                    player addMagazine _magazine;
                } else {
                    private _ammo = player ammo _weapon;
                    if (_ammo > 0) then {
                        player setAmmo [_weapon, _ammo+1];
                    } else {
                        player addMagazine _magazine;
                        player removeWeapon _weapon;
                        player addWeapon _weapon;
                    };
                };
            }];
        };

        //Disable ACE advanced throwing
        if (isNil "disableAdvancedThrowing") then {
          disableAdvancedThrowing = ["ace_firedPlayer", {

    				_grenade = _this select 6;
    				private _throwableMag = (currentThrowable _unit) select 0;
    				private _throwableType = getText (configFile >> "CfgMagazines" >> _throwableMag >> "ammo");

    				deleteVehicle _grenade;

            "phx_safeStartTextLayer" cutText ["SAFESTART ACTIVE", "PLAIN", 0];
            "phx_safeStartTextLayer" cutFadeOut 3;
    			}] call CBA_fnc_addEventHandler;
        };

        // Disable guns and damage for vehicles if player is crewing a vehicle
        if (vehicle player != player && {player in [gunner vehicle player,driver vehicle player,commander vehicle player]}) then {
            player setVariable ["f_var_safetyVeh",vehicle player];
            (player getVariable "f_var_safetyVeh") allowDamage false;

            if (isNil "f_eh_safetyVeh") then {
                f_eh_safetyVeh = (player getVariable "f_var_safetyVeh") addEventHandler["Fired", {deletevehicle (_this select 6);}];
            };
        };

        // Make player invincible
        player allowDamage false;
    };

    // Turn safety off
    case false;
    default {
      call phx_fnc_removeSelector;

      //Make typing in chat not possible after safe start ends
      if !(serverCommandAvailable "#kick") then {
        (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 in actionKeys 'Chat') then { true } else { false };"];
      };

      //Turn safety off on all weapons
      {
        [ACE_player, _x, false] call ace_safemode_fnc_setWeaponSafety;
      } forEach safetyWeapons;
      safetyWeapons = [];

      if (!isNil "startActions") then {
        [(typeOf player), 1, ["ACE_SelfActions","startLocations"]] call ace_interact_menu_fnc_removeActionFromClass;
      };

      // Allow player to fire weapons
      if !(isNil "f_eh_safetyMan") then {
          player removeEventhandler ["Fired", f_eh_safetyMan];
          f_eh_safetyMan = nil;
      };

      // Re-enable guns and damage for vehicles if they were disabled
      if !(isNull(player getVariable ["f_var_safetyVeh",objnull])) then {
          (player getVariable "f_var_safetyVeh") allowDamage true;

          if !(isNil "f_eh_safetyVeh") then {
              (player getVariable "f_var_safetyVeh") removeeventhandler ["Fired", f_eh_safetyVeh];
              f_eh_safetyVeh = nil;
          };
          player setVariable ["f_var_safetyVeh",nil];
      };

  		//Enable ACE advanced throwing
      if !(isNil "disableAdvancedThrowing") then {
        ["ace_firedPlayer",disableAdvancedThrowing] call CBA_fnc_removeEventHandler;
        disableAdvancedThrowing = nil;
      };

      call phx_fnc_init_removeClientHandlers;

      // Make player vulnerable
      player allowDamage true;
      phx_safeStartEnabled = false;
    };
};
