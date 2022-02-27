/*
Shows remaining mission time when player opens map. Closes the display when map is closed.
*/

fnf_mapTimeShown = false;
fnf_mapMissionTime = addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];

  if (_mapIsOpened) then {
    if (missionNamespace getVariable ["fnf_safetyEnabled", true]) then {
      call fnf_fnc_clientSafeStartTime;
    } else {
      call fnf_fnc_clientTime;
    };
    fnf_mapTimeShown = true;
  } else {
		[fnf_missionTimeUI_PFH] call CBA_fnc_removePerFrameHandler;
    fnf_mapTimeShown = false;
    uiNameSpace getVariable "timeleftStructText" closeDisplay 1;
  };
}];

[{!isNil "fnf_timeLeftShown"}, {removeMissionEventHandler ["Map", fnf_mapMissionTime]}] call CBA_fnc_waitUntilAndExecute;
