[player,true] remoteExec ["hideObject",0,true];
player enableSimulation true;
cutText ["", "PLAIN"];
removeAllWeapons player;
phx_playerDeathPos = positionCameraToWorld [0,0,0];

[] spawn {
  sleep 0.1;
  player setPos [-1000,-1000,0];
  sleep 0.1;
  player setDamage 1;
};
