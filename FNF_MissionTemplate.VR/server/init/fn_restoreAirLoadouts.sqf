params ["_vehicle", ["_wreck", objNull]];
// "debug_console" callExtension "attempt 3265";
// "debug_console" callExtension format["_this = %1", _this];
waitUntil {!isNull _vehicle};

_pylons = _vehicle getVariable ["fnf_pylonLoadout", []];
if (count _pylons == 0) exitWith {
  // "debug_console" callExtension format["exited with 0 pylons (%1) on %2", _pylons, (configOf _vehicle) call BIS_fnc_displayName];
};
private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
private _nonPylonWeapons = []; { _nonPylonWeapons append getArray (_x >> "weapons") } forEach ([_vehicle, configNull] call BIS_fnc_getTurrets);
if (count _pylons == count _pylonPaths) then {
  // "debug_console" callExtension format["Respawn ran on %1", (configOf _vehicle) call BIS_fnc_displayName];
  {
    try {
      _vehicle removeWeaponTurret [getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon"), _pylonPaths select _forEachIndex];
      _vehicle removeWeaponTurret [getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon"), [-1]];
    } catch {
      // "debug_console" callExtension format["index %1: %2", 3, _exception];
      continue
    };
  } forEach getPylonMagazines _vehicle;
  // "debug_console" callExtension format["%1,%2", _pylons, _pylonPaths];
  {
    try {
      if !(_vehicle setPylonLoadout [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex]) then {
        throw {
          ["Failed to set pylon", _forEAchIndex + 1, _x, _pylonPaths select _forEachIndex]
        };
      } else {
        _vehicle addWeaponTurret [getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon"), _pylonPaths select _forEachIndex];
      };
    } catch {
      // "debug_console" callExtension format["index %1: %2", 4, _exception];
      continue
    };
  } forEach _pylons;
} else {
  // "debug_console" callExtension format["Failed to apply loadout on %1", (configOf _vehicle) call BIS_fnc_displayName];
  diag_log text format["[FNF] (restoreAirLoadouts) Failed to apply pylon loadout on %1", (configOf _vehicle) call BIS_fnc_displayName];
};
