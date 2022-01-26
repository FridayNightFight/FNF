/*
* Author: IndigoFox
*
* Description:
* Work out MAT and MATA settings, or if a role isn't associated w/ MAT, evaluate launcher settings.
*
* Arguments:
* 0: The unit to modify <OBJECT>
* 1: The role to eval for it (default: "BASE") <STRING>
*
* Return Value:
* true on success <BOOLEAN>
* nil if _unit is null or invalid data <NIL>
*
* Example:
* [player, PLAYERLOADOUTVAR] call phx_loadout_fnc_giveAT
*
* Public: No
*/

// MAT AND LAUNCHERS
params [
  ["_unit", objNull],
  ["_role", "BASE"]
];

if (isNull _unit) exitWith {nil};

private _matRoleVarArr = ["MATA1","MAT1","MATA2","MAT2"];
private _matGunnerVarArr = ["MAT1","MAT2"];
if (_role in _matRoleVarArr) then {
  if (isNil "phx_loadout_mediumantitank_weapon") exitWith {
    [{time > 2}, {
      ["<t align='center'>Error:<br/>Failed to process MAT settings.</t>", "error", 20] call phx_ui_fnc_notify;
      diag_log text "[FNF] (loadout) ERROR: Failed to process MAT settings.";
    }] call CBA_fnc_waitUntilAndExecute;
    nil
  };

  if (phx_loadout_mediumantitank_weapon == "") exitWith {true};

  // add mags & load one
  // "debug_console" callExtension str(phx_loadout_mediumantitank_mag);
  private "_compatMag";
  if (!isNil "phx_loadout_mediumantitank_mag") then {
    if (phx_loadout_mediumantitank_isReloadable) then {
      {
        // "debug_console" callExtension ("Adding " + _x + " to inventory");
        [_x, "backpack", _unit] call phx_loadout_fnc_addGear;
      } forEach phx_loadout_mediumantitank_mag;
      diag_log text format["[FNF] (loadout) INFO: Equipped AT weapon magazines"];
      diag_log text format["[FNF] (loadout) DEBUG: %1", phx_loadout_mediumantitank_mag];
    };

    _compatMag = (phx_loadout_mediumantitank_mag # 0) splitString ':';
  };

  if (_role in _matGunnerVarArr) then {
    // for gunner, add MAT weapon, then optic to it
    _unit addWeapon phx_loadout_mediumantitank_weapon;
    diag_log text format["[FNF] (loadout) INFO: Equipped AT weapon ""%1""", phx_loadout_mediumantitank_weapon];
    if (!isNil "phx_loadout_mediumantitank_optic") then {
      private _thisOptic = selectRandom(phx_loadout_mediumantitank_optic);
      _unit addSecondaryWeaponItem _thisOptic;
      diag_log text format["[FNF] (loadout) INFO: Equipped AT optic ""%1""", _thisOptic];
    };
    if (!isNil "_compatMag") then {
      // if we found a mag, try pre-loading the launcher
      _compatMag params ["_magClass", "_magCount"];
      _magCount = parseNumber(_magCount);
      _numOfMags = count ([_unit, _magClass] call CBA_fnc_getMagazineIndex);
      // some MAT rounds, when given to a player's inventory, will autoload into the launcher
      // if this DOESN'T happen, we need to do it manually. otherwise we want to leave it alone so the proper number given
      if (_numOfMags == _magCount) then {
        // _unit removeMagazine _magClass;
        [_unit, _magClass] call CBA_fnc_removeMagazine;
        _unit addSecondaryWeaponItem _magClass;
      };
    };
  };
  true
} else {

  // LAUNCHERS
  // if not MAT or MATA role, check normal launchers[] array from config
  if (count _cfgLaunchers > 0) then {
    phx_loadout_launcher = selectRandom(_cfgLaunchers);
  } else {
    phx_loadout_launcher = "";
  };



  // "debug_console" callExtension str(phx_loadout_launcher);
  if (phx_loadout_launcher isEqualType []) then {
    phx_loadout_launcher params ["_launcher", "_mags", "_optics"];
    if (_launcher == "") exitWith {true};
    _unit addWeapon _launcher;
    diag_log text format["[FNF] (loadout) INFO: Equipped AT weapon ""%1""", _launcher];

    if (count _mags > 0) then {
      {
        [_x, "backpack", _unit] call phx_loadout_fnc_addGear;
      } forEach _mags;
      diag_log text format["[FNF] (loadout) INFO: Equipped AT weapon magazines"];
      diag_log text format["[FNF] (loadout) DEBUG: %1", _mags];
    };

    if (count (secondaryWeaponMagazine player) == 0) then {
      private _loadThisMag = (_mags # 0 splitString ':' select 0);
      if (!isNil "_loadThisMag") then {
        _unit removeMagazine _loadThisMag;
        _unit addSecondaryWeaponItem _loadThisMag;
      };
    };

    if (count _optics > 0) then {
      private _thisOptic = selectRandom(_optics);
      _unit addSecondaryWeaponItem _thisOptic;
      diag_log text format["[FNF] (loadout) INFO: Equipped AT optic ""%1""", _thisOptic];
    };
  };
  true
};
