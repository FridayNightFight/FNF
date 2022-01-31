call phx_restrictions_fnc_disableMisc;
call phx_restrictions_fnc_zoneBoundary;
call phx_restrictions_fnc_restrictGamma;
call phx_restrictions_fnc_startBoundary;
call phx_restrictions_fnc_restrictedZones;

//Uniform and etool restrictions
[{missionNamespace getVariable ["phx_loadoutAssigned",false]}, {call phx_restrictions_fnc_restrictETool}] call CBA_fnc_waitUntilAndExecute;
[{!(missionNamespace getVariable ["phx_safetyEnabled",true])}, {call phx_restrictions_fnc_restrictUniform}] call CBA_fnc_waitUntilAndExecute;
//[{!phx_safetyEnabled && !isNull (findDisplay 46)}, {call phx_restrictions_fnc_afkCheck}] call CBA_fnc_waitUntilAndExecute;

//Set TFAR volume to whisper
TF_speak_volume_level = "whispering";
TF_speak_volume_meters = 5;
call TFAR_fnc_updateSpeakVolumeUI;

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

//Disable zeus ping
missionnamespace setvariable ["bis_fnc_curatorPinged_time", 9999, false];
