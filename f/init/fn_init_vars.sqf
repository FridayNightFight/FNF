#include "..\..\varSelection.sqf"

bluVics = [];
opfVics = [];
indVics = [];

if (activeMode isEqualTo "adSector") then {
  attackingSide = (modeParams select 1);
  if !(isNil {modeParams select 2}) then {
    objectivesNumber = (modeParams select 2);
  };
};

serverVarsSetup = true;
publicVariable "serverVarsSetup";
