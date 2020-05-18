[player,true] remoteExec ["hideObject",0,true];
phx_playerDeathPos = positionCameraToWorld [0,0,0];
removeAllWeapons player;
player setPos [-1000,-1000,0];
[] spawn phx_fnc_spectatorInit;
