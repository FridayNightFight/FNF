if (!isServer) exitwith {};

#include "..\..\varSelection.sqf"

if (phx_gameMode isEqualTo "adSector") then {
    objectivesNumber = (objectives select 0);
};

phx_safeStartEnabled = true;
publicVariable "phx_safeStartEnabled";

phx_serverVarsSetup = true;
publicVariable "phx_serverVarsSetup";
