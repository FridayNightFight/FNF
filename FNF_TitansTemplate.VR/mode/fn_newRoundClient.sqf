//switch "sides" of player
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

//close the terminal
[term1,0] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];

//call mid game init
call PHX_fnc_clientMidInit;