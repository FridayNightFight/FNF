if (!isServer) exitwith {};

#include "..\..\varSelection.sqf"
#include "defaultAssets.sqf"

publicVariable "defendingSide";
publicVariable "attackingSide";

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

publicVariable "startSelectionSide";

publicVariable "allowFortify";

bluVics = [];
opfVics = [];
indVics = [];

if (activeMode isEqualTo "adSector") then {
    objectivesNumber = (objectives select 0);
};

phx_safeStartEnabled = true;
publicVariable "phx_safeStartEnabled";

serverVarsSetup = true;
publicVariable "serverVarsSetup";
