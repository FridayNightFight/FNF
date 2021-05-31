/*
Determines if client can play the mission.

Returns:
true - client is not spectator and joined before safety end, can play
false - client is either spectator or joined after safety ended, cannot play
*/

private _play = true;

if (typeOf player == "ace_spectator_virtual") then {_play = false};
if (didJIP && !phx_safetyEnabled) then {_play = false};

_play;
