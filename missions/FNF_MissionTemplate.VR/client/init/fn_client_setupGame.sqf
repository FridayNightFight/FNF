#include "..\..\shared\definitions.hpp"

switch (phx_gameMode) do {
  case uplink: {
    execVM "shared\modes\uplink_client.sqf"
  };
};
