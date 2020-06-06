[player,true] remoteExec ["hideObject",0,true];
removeAllWeapons player;
phx_playerDeathPos = positionCameraToWorld [0,0,0];
sleep 0.05;
player setPos [-1000,-1000,0];
sleep 0.05;
player setDamage 1;
