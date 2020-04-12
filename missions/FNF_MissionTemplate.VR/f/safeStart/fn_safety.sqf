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
        ace_advanced_throwing_enabled = false;

        // Make player invincible
        player allowDamage false;
    };

    // Turn safety off
    case false;
    default {
      call phx_fnc_removeSelector;

      //Make typing in chat not possible after safe start ends unless player is logged-in admin
      if !(serverCommandAvailable "#kick") then {
        (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 in actionKeys 'Chat') then { true } else { false };"];
      };

      //Turn safety off on all weapons
      {
        [ACE_player, _x, false] call ace_safemode_fnc_setWeaponSafety;
      } forEach phx_safetyWeapons;
      phx_safetyWeapons = nil;

      //Remove start selection self-actions if exist
      if (!isNil "startActions") then {
        [(typeOf player), 1, ["ACE_SelfActions","startLocations"]] call ace_interact_menu_fnc_removeActionFromClass;
      };

      // Allow player to fire weapons
      if !(isNil "f_eh_safetyMan") then {
          player removeEventhandler ["Fired", f_eh_safetyMan];
          f_eh_safetyMan = nil;
      };

  		//Enable ACE advanced throwing
      ace_advanced_throwing_enabled = true;

      call phx_fnc_init_removeClientHandlers;

      // Make player vulnerable
      player allowDamage true;
    };
};
