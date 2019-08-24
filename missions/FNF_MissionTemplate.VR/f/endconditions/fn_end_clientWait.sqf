if (!isNil "phx_end_clientTime") then {
    [phx_end_clientWait] call CBA_fnc_removePerFrameHandler;
};
if (((isNil "phx_end_clientTime")) || (!isNil "phx_15MinuteWarning")) then {
    [phx_end_clientWait] call CBA_fnc_removePerFrameHandler;
    //phx_show_timeUI = true;
    phx_end_clientTime = [phx_fnc_end_clientTime, 0.25, []] call CBA_fnc_addPerFrameHandler;
};
