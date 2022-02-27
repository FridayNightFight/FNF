/*
Makes any vehicle that isn't already invincible invincible until safe start ends
*/

if !(missionNamespace getVariable ["fnf_safetyEnabled", true]) exitWith {};

private _safetyVics = vehicles select {isDamageAllowed _x};
if (count _safetyVics == 0) exitWith {};

{_x allowDamage false} forEach _safetyVics;

[{!(missionNamespace getVariable ["fnf_safetyEnabled", true])}, {
  params ["_safetyVics"];

  {_x allowDamage true} forEach _safetyVics;
}, [_safetyVics]] call CBA_fnc_waitUntilAndExecute;
