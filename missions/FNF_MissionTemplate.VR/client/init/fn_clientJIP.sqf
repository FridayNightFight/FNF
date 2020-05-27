player enableSimulation false;
player allowDamage false;
[player,true] remoteExec ["hideObject",0,true];
phx_playerDeathPos = positionCameraToWorld [0,0,0];
[] spawn phx_fnc_spectatorInit;
