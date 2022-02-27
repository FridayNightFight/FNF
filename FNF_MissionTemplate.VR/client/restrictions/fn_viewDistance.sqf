//View distance and terrain grid force & disable commanding menu
if (!isNil "fnf_viewDistanceHandler") then {
  [fnf_viewDistanceHandler] call CBA_fnc_removePerFrameHandler;
  fnf_viewDistanceHandler = nil;
};
fnf_viewDistanceHandler = [{
  if (!isNil "fnf_fnc_objectivePreview_Cam") exitWith {}; //Disable if obj preview is active
  if (!alive player) exitWith {};
  if (viewDistance > fnf_maxViewDistance) then {
    setViewDistance fnf_maxViewDistance;
    // setViewDistance (fnf_maxViewDistance + 2000);
  };

  if (getTerrainGrid > 25) then {
    setTerrainGrid 25;
  };

  if !(commandingMenu isEqualTo "") then {showCommandingMenu ""};
} , 0.5] call CBA_fnc_addPerFrameHandler;
