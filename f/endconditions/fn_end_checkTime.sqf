// Time Limits
if ((phx_missionRuntimeMins - 15) <= (CBA_missionTime/60) && {phx_alertSoon isEqualTo 0}) then {
    _hintStr = "15 minutes remaining.";
    _hintStr remoteExecCall ["phx_fnc__hintThenClear", 0];
    phx_15MinuteWarning = true;
    publicVariable "phx_15MinuteWarning";
    phx_show_timeUI = true;
    publicVariable "phx_show_timeUI";
    phx_alertSoon = 1;
};
if ((phx_missionRuntimeMins - 10) <= (CBA_missionTime/60) && {phx_alertSoon1 isEqualTo 0}) then {
    _hintStr = "10 minutes remaining.";
    _hintStr remoteExecCall ["phx_fnc__hintThenClear", 0];
    phx_alertSoon1 = 1;
    phx_10MinuteWarning = true;
    publicVariable "phx_10MinuteWarning";
};
if ((phx_missionRuntimeMins - 5) <= (CBA_missionTime/60) && {phx_alertSoon2 isEqualTo 0}) then {
    _hintStr = "5 minutes remaining.";
    _hintStr remoteExecCall ["phx_fnc__hintThenClear", 0];
    phx_alertSoon2 = 1;
};
if (phx_missionRuntimeMins <= (CBA_missionTime/60) && {phx_alertEnd < 1}) then {
    _hintStr = "The mission time limit has been reached.";
    _hintStr remoteExecCall ["phx_fnc__hintThenClear", 0];
    phx_alertEnd = phx_alertEnd + 1;
};
if ((phx_missionRuntimeMins + (1*phx_alertOver)) <= (CBA_missionTime/60)) then {
    _hintStr = str(1*phx_alertOver) + " minute(s) since limit.";
    _hintStr remoteExecCall ["phx_fnc__hintThenClear", 0];
    phx_alertOver = phx_alertOver + 1;
};
