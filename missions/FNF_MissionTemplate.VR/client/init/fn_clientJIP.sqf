[player,true] remoteExec ["hideObject",0,true];
removeAllWeapons player;
player setPos [-1000,-1000,0];
player setDamage 1;
call phx_fnc_playerKilled;
