[player,true] remoteExec ["hideObject",0,true];
removeAllWeapons player;

[] spawn {
  sleep 0.1;
  phx_playerDeathPos = positionCameraToWorld [0,0,0];
  player setPos [-1000,-1000,0];
  sleep 0.1;
  player setDamage 1;
};
