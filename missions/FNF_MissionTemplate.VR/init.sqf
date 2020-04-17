#include "shared\definitions.hpp"
#include "config.hpp"

if (isServer) then {
  call phx_fnc_serverInit;
};

if (hasInterface) then {
  call phx_fnc_clientInit;
};
