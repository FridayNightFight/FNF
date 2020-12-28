if (!hasInterface) exitWith {};

#include "..\..\shared\definitions.hpp"

switch (phx_gameMode) do {
  case destroy: {
    call compile preprocessFileLineNumbers format ["shared\modes\destroy_client.sqf"];
  };
  case uplink: {
    execVM "shared\modes\uplink_client.sqf"
  };
  case rush: {
    execVM "shared\modes\rush_client.sqf";
  };
  case connection: {
    execVM "shared\modes\connection_client.sqf";
  };
  case captureTheFlag: {
    call compile preprocessFileLineNumbers format ["shared\modes\ctf_client.sqf"];
  };
};
