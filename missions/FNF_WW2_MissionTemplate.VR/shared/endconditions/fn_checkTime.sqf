phx_missionSafeTime = phx_safeStartTime;
phx_missionRunTime = phx_missionTimelimit;
phx_missionRuntimeMins = phx_missionRunTime + phx_missionSafeTime;
phx_alertEnd = false;
phx_alert1 = false;

while {!phx_gameEnd} do {
  if ((phx_missionRuntimeMins - 15) <= (CBA_missionTime/60) && !phx_alert1) then {
      "15 minutes remaining" remoteExec ["phx_fnc_hintThenClear", 0, false];
      phx_alert1 = true;
      remoteExec ["phx_fnc_clientTime", 0, true];
  };

  if (phx_missionRuntimeMins <= (CBA_missionTime/60) && !phx_alertEnd) then {
      "The mission time limit has been reached." remoteExec ["hintSilent", 0, false];
      phx_alertEnd = true;
  };
  uiSleep 5;
};
