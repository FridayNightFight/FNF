if (!isServer) exitwith {};

#include "..\..\varSelection.sqf"

publicVariable "defendingSide";
publicVariable "attackingSide";

currentAssetsBlu = [];
currentAssetsOpf = [];
currentAssetsInd = [];

if (count bluforAssetList == 0) then {
  bluforAssetList execVM "f\init\defaultAssets.sqf";
};
if (count opforAssetList == 0) then {
  opforAssetList execVM "f\init\defaultAssets.sqf";
};
if (count indforAssetList == 0) then {
  indforAssetList execVM "f\init\defaultAssets.sqf";
};

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

bluVics = [];
opfVics = [];
indVics = [];

if (activeMode isEqualTo "adSector") then {
    objectivesNumber = (objectives select 0);
};

serverVarsSetup = true;
publicVariable "serverVarsSetup";
