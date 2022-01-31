//View distance and terrain grid force & disable commanding menu
if (!isNil "phx_viewDistanceHandler") then {
  [phx_viewDistanceHandler] call CBA_fnc_removePerFrameHandler;
  phx_viewDistanceHandler = nil;
};
phx_viewDistanceHandler = [{
  if (!isNil "phx_fnc_objectivePreview_Cam") exitWith {}; //Disable if obj preview is active
  if (!alive player) exitWith {};
  if (viewDistance > phx_maxViewDistance) then {
    setViewDistance phx_maxViewDistance;
    // setViewDistance (phx_maxViewDistance + 2000);
  };

  if (getTerrainGrid > 25) then {
    setTerrainGrid 25;
  };

  if !(commandingMenu isEqualTo "") then {showCommandingMenu ""};
} , 0.5] call CBA_fnc_addPerFrameHandler;
