#include "shared\definitions.hpp"
#include "config.hpp"

if (isServer) then {
  call phx_fnc_serverInit;
};

if (hasInterface) then {
  waitUntil {!isNull player};
  player allowDamage false;
  removeAllWeapons player;
  waitUntil {!isNil "phx_safetyEnabled"};
  call phx_fnc_clientInit;
};
