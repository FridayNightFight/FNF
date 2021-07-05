//forceRespawn player;
//uisleep 5;
[true, true, true] call ace_spectator_fnc_setSpectator;

if (phx_playerSide == west) then
{
	phx_playerSide = east;
	player setpos ("opforSafeMarker" call BIS_fnc_randomPosTrigger);
} else {
	if (phx_playerSide == east) then
	{
		phx_playerSide = west;
		player setpos ("bluforSafeMarker" call BIS_fnc_randomPosTrigger);
	};
};

[term1,0] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];

[false,false,false] call ace_spectator_fnc_setSpectator;

call PHX_fnc_clientMidInit;