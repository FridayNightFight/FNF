if (!isServer) exitWith {};

#include "..\..\shared\definitions.hpp"

missionNamespace setVariable ["phx_gameEnd", false, true];

switch (phx_gameMode) do {
  case destroy: {
    execVM "shared\modes\destroy_server.sqf";
  };
  case uplink: {
    execVM "shared\modes\uplink_server.sqf";
  };
  case rush: {
    execVM "shared\modes\rush_server.sqf";
  };
  case connection: {
    [] call compile preprocessFileLineNumbers format ["shared\modes\connection_server.sqf"];
    ["off"] call acex_fortify_fnc_handleChatCommand;
  };
  case captureTheFlag: {
    [] call compile preprocessFileLineNumbers format ["shared\modes\ctf_server.sqf"];
  };
};

//To do: allow objectives to be deleted w/o throwing error

_deleteObj = {
  params ["_obj"];

  if (!isNil "_obj") then {
    if (!isNull _obj) then {deleteVehicle _obj};
  };
};

if !(phx_gameMode isEqualTo destroy) then {
  {_x call _deleteObj} forEach [destroy_obj1,destroy_obj2];
  {if !(getMarkerColor _x isEqualTo "") then {_x remoteExec ["deleteMarkerLocal", 0, true]};} forEach ["destroy_obj1Mark","destroy_obj2Mark"];
};

if !(phx_gameMode isEqualTo uplink || phx_gameMode isEqualTo rush || phx_gameMode isEqualTo connection) then {
  {_x call _deleteObj} forEach [term1,term2,term3];
};

if !(phx_gameMode isEqualTo connection) then {
  {_x call _deleteObj} forEach [dummySector, dummyind, dummyblu, dummyopf];
};

if !(phx_gamEMode isEqualTo captureTheFlag) then {
  {_x call _deleteObj} forEach [ctf_flagPole, ctf_attackTrig];
};

missionNamespace setVariable ["phx_serverGameSetup",true,true];
