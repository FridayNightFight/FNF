/*
Continuously sets the player's vehicle to be invincible during safe start, allows damage once safety ends
*/
if (!canSuspend) exitWith {[] spawn phx_fnc_handleSafetyVics};

phx_safetyVics = [];

while {phx_safetyEnabled} do {
  _vic = vehicle player;

  if (isDamageAllowed _vic) then {
    _vic allowDamage false;
    phx_safetyVics pushBack _vic;
  };

  sleep 0.2;
};

{
  _x allowDamage true;
} forEach phx_safetyVics;

phx_safetyVics = nil;
