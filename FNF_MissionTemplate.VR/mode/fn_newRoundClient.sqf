//forceRespawn player;
//uisleep 5;
[true, true, true] call ace_spectator_fnc_setSpectator;

if (phx_playerSide == west) then
{
	phx_playerSide = east;
	player setpos (getpos opforSpawn findEmptyPosition [0, 10, typeOf vehicle player])
} else {
	if (phx_playerSide == east) then
	{
		phx_playerSide = west;
		player setpos (getpos bluforSpawn findEmptyPosition [0, 10, typeOf vehicle player])
	};
};

[false,false,false] call ace_spectator_fnc_setSpectator;

call PHX_fnc_clientMidInit;