bluVics = [];
opfVics = [];
indVics = [];

if (activeMode isEqualTo "adSector") then {
    objectivesNumber = (objectives select 0);
};

serverVarsSetup = true;
publicVariable "serverVarsSetup";
