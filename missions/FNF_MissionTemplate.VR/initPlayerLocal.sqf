#include "shared\definitions.hpp"
#include "config.hpp"

waitUntil {!isNil "phx_safetyEnabled"};
call phx_fnc_clientInit;
