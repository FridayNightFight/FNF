if (!isServer) exitWith {};

#include "..\..\shared\definitions.hpp"

missionNamespace setVariable ["phx_gameEnd", false, true];

phx_overTimeConStr = "N/A";

switch (phx_gameMode) do {
  case destroy: {
    execVM "shared\modes\destroy_server.sqf";
    phx_overTimeConStr = "The mission will go into overtime if there is only 1 alive objective remaining and attackers stay near the objective.";
  };
  case uplink: {
    execVM "shared\modes\uplink_server.sqf";
    phx_overTimeConStr = "The mission will go into overtime if any terminal is being hacked.";
  };
  case rush: {
    execVM "shared\modes\rush_server.sqf";
    phx_overTimeConStr = "The mission will go into overtime if the final terminal is being hacked.";
  };
  case connection: {
    [] call compile preprocessFileLineNumbers format ["shared\modes\connection_server.sqf"];
    ["off"] call acex_fortify_fnc_handleChatCommand;
    phx_overTimeConStr = "The mission will go into overtime if the second-highest side stays within 25 points of the highest side. The first side to 100 points will still win.";
  };
  case captureTheFlag: {
    [] call compile preprocessFileLineNumbers format ["shared\modes\ctf_server.sqf"];
    phx_overTimeConStr = "The mission will go into overtime if the flag stays within the capture zone.";
  };
  case adSector: {
    [] spawn compile preprocessFileLineNumbers format ["shared\modes\adSector.sqf"];
    phx_overTimeConStr = "The mission will go into overtime if there is only 1 active sector remaining and attackers stay inside it.";
  };
  case neutralSector: {
    [] spawn compile preprocessFileLineNumbers format ["shared\modes\neutralSector.sqf"];
    ["off"] call acex_fortify_fnc_handleChatCommand;
    phx_overTimeConStr = "The mission will go into overtime if the second-highest side stays within 25 points of the highest side.";
  };
};

publicVariable "phx_overTimeConStr";

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

if !(phx_gamEMode isEqualTo captureTheFlag) then {
  {_x call _deleteObj} forEach [ctf_flagPole, ctf_attackTrig];
};

if !(phx_gameMode isEqualTo adSector) then {
  {_x call _deleteObj} forEach [phx_sec1,phx_sec2,phx_sec3];
};

missionNamespace setVariable ["phx_serverGameSetup",true,true];
