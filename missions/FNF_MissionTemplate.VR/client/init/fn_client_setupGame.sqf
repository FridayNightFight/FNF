if (!hasInterface) exitWith {};

#include "..\..\shared\definitions.hpp"

switch (phx_gameMode) do {
  case destroy: {
    execVM "shared\modes\destroy_client.sqf"
  };
  case uplink: {
    execVM "shared\modes\uplink_client.sqf"
  };
};
