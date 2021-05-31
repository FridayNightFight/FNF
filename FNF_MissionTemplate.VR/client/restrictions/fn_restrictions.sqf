call phx_fnc_disableMisc;
call phx_fnc_zoneBoundary;
call phx_fnc_startBoundary;
call phx_fnc_restrictGamma;

//Uniform and etool restrictions
[{missionNamespace getVariable ["phx_loadoutAssigned",false]}, {call phx_fnc_restrictUniform; call phx_fnc_restrictETool;}] call CBA_fnc_waitUntilAndExecute;

//View distance and terrain grid force
[{
  if (viewDistance > phx_maxViewDistance) then {
    setViewDistance phx_maxViewDistance;
  };
  if (getTerrainGrid > 25) then {
    setTerrainGrid 25;
  };
} , 1] call CBA_fnc_addPerFrameHandler;

//Disable zeus ping
missionnamespace setvariable ["bis_fnc_curatorPinged_time", 9999, false];
