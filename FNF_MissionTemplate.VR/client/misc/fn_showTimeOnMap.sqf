/*
Shows remaining mission time when player opens map. Closes the display when map is closed.
*/

phx_mapTimeShown = false;
phx_mapMissionTime = addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];

  if (_mapIsOpened) then {
    if (missionNamespace getVariable ["phx_safetyEnabled", true]) then {
      call phx_fnc_clientSafeStartTime;
    } else {
      call phx_fnc_clientTime;
    };
    phx_mapTimeShown = true;
  } else {
		[phx_missionTimeUI_PFH] call CBA_fnc_removePerFrameHandler;
    phx_mapTimeShown = false;
    uiNameSpace getVariable "timeleftStructText" closeDisplay 1;
  };
}];

[{!isNil "phx_timeLeftShown"}, {removeMissionEventHandler ["Map", phx_mapMissionTime]}] call CBA_fnc_waitUntilAndExecute;
