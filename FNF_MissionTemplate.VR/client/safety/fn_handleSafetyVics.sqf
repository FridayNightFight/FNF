/*
Makes any vehicle that isn't already invincible invincible until safe start ends
*/

private _safetyVics = vehicles select {isDamageAllowed _x};
if (count _safetyVics == 0) exitWith {};

{_x allowDamage false} forEach _safetyVics;

[{!phx_safetyEnabled}, {
  params ["_safetyVics"];

  {_x allowDamage true} forEach _safetyVics;
}, [_safetyVics]] call CBA_fnc_waitUntilAndExecute;
