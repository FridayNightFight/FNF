/*
Checks remaining game time. Warns at 15 minutes and will trigger a client-side timer.
Activates overtime function when time limit is reached.
*/

phx_missionSafeTime = phx_safeStartTime;
phx_missionRunTime = phx_missionTimelimit;
phx_missionRuntimeMins = phx_missionRunTime + phx_missionSafeTime;
phx_alertEnd = false;
phx_alert1 = false;
phx_overTime = false;

[{
  if (phx_gameEnd) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler};

  if ((phx_missionRuntimeMins - 15) <= (CBA_missionTime/60) && !phx_alert1) then {
      "15 minutes remaining" remoteExec ["phx_fnc_hintThenClear", 0, false];
      phx_alert1 = true;
      missionNamespace setVariable ["phx_timeLeftShown",true,true];
      remoteExec ["phx_fnc_clientTime", 0, true];
  };

  if (phx_missionRuntimeMins <= (CBA_missionTime/60) && !phx_alertEnd) then {
      phx_alertEnd = true;
      phx_overTime = true;
      publicVariable "phx_overTime";
      [] spawn phx_fnc_overTimeEnd;

      [_this select 1] call CBA_fnc_removePerFrameHandler
  };
}, 1] call CBA_fnc_addPerFrameHandler;
