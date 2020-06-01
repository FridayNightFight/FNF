[player,true] remoteExec ["hideObject",0,true];
phx_playerDeathPos = positionCameraToWorld [0,0,0];
player setPos [-1000,-1000,0];
player setDamage 1;
[] spawn phx_fnc_spectatorInit;
