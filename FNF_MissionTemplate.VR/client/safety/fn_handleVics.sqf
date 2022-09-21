/*
Makes any vehicle that isn't already invincible invincible until safe start ends
*/

if !(missionNamespace getVariable ["fnf_safetyEnabled", true]) exitWith {};

private _safetyVics = vehicles select {isDamageAllowed _x};
if (count _safetyVics == 0) exitWith {};

{
  _x allowDamage false;

  // add variable to vehicle so localitySwitch doesn't remove invincibility
  if (local _x) then {_x setVariable ["fnf_zoneProtectionActive", true, true]};
} forEach _safetyVics;

[{!(missionNamespace getVariable ["fnf_safetyEnabled", true])}, {
  params ["_safetyVics"];

  {
    _x allowDamage true;
    if (local _x) then {_x setVariable ["fnf_zoneProtectionActive", false, true]};
  } forEach _safetyVics;
}, [_safetyVics]] call CBA_fnc_waitUntilAndExecute;
