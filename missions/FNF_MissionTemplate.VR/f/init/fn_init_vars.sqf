if (!isServer) exitwith {};

#include "..\..\varSelection.sqf"
#include "defaultAssets.sqf"

publicVariable "phx_defendingSide";
publicVariable "phx_attackingSide";

currentAssetsBlu = [];
currentAssetsOpf = [];
currentAssetsInd = [];

publicVariable "bluforAssetList";
publicVariable "opforAssetList";
publicVariable "indforAssetList";

publicVariable "currentAssetsBlu";
publicVariable "currentAssetsOpf";
publicVariable "currentAssetsInd";

publicVariable "bluforPointPool";
publicVariable "opforPointPool";
publicVariable "indforPointPool";

publicVariable "phx_startSelectionSide";

publicVariable "phx_allowFortify";

if (phx_gameMode isEqualTo "adSector") then {
    objectivesNumber = (objectives select 0);
};

phx_safeStartEnabled = true;
publicVariable "phx_safeStartEnabled";

phx_serverVarsSetup = true;
publicVariable "phx_serverVarsSetup";
