/*
Checks remaining game time. Warns at 15 minutes and will trigger a client-side timer.
Activates overtime function when time limit is reached.
*/

private _missionRuntimeSecs = 600 + phx_safetyEndTime;
phx_alert15 = false;
phx_alertEnd = false;
_handle = [{
  params ["_missionRuntimeSecs", "_handle"];

  if (phx_gameEnd) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

  _missionRuntimeSecs = 0;
  _missionRuntimeSecs = _this select 0;

  if (_missionRuntimeSecs - 300 <= CBA_missionTime && !phx_alert15) then {
      "5 minutes remaining" remoteExec ["phx_fnc_hintThenClear", 0, false];
      phx_alert15 = true;
      missionNamespace setVariable ["phx_timeLeftShown",true,true];
      remoteExec ["phx_fnc_clientTime", 0, true];
  };

  if (_missionRuntimeSecs <= CBA_missionTime && !phx_alertEnd) then {
      phx_alertEnd = true;
      missionNamespace setVariable ["phx_overTime",true,true];

      [] spawn phx_fnc_overTimeEnd;
      [_handle] call CBA_fnc_removePerFrameHandler
  };
}, 0.25, _missionRuntimeSecs] call CBA_fnc_addPerFrameHandler;
