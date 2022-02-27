/*
Checks remaining game time. Warns at 15 minutes and will trigger a client-side timer.
Activates overtime function when time limit is reached.
*/

private _missionRuntimeSecs = (fnf_missionTimelimit * 60) + fnf_safetyEndTime;
fnf_alert15 = false;
fnf_alertEnd = false;

[{
  params ["_missionRuntimeSecs", "_handle"];

  if (fnf_gameEnd) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

  _missionRuntimeSecs = _this select 0;

  if ((_missionRuntimeSecs - (15 * 60)) <= CBA_missionTime && !fnf_alert15) then {
      ["<t align='center'>15 minutes remaining of play</t>","warning",10] remoteExec ["fnf_ui_fnc_notify", 0, false];
      fnf_alert15 = true;
      missionNamespace setVariable ["fnf_timeLeftShown",true,true];
      remoteExec ["fnf_fnc_clientTime", 0, true];
  };

  if (_missionRuntimeSecs <= CBA_missionTime && !fnf_alertEnd) then {
      fnf_alertEnd = true;
      missionNamespace setVariable ["fnf_overTime",true,true];

      [] spawn fnf_server_fnc_overTimeEnd;
      [_handle] call CBA_fnc_removePerFrameHandler
  };
}, 0.5, _missionRuntimeSecs] call CBA_fnc_addPerFrameHandler;
