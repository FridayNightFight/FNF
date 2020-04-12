//====================================================================================================
// Shared Scripts

// Run safestart script
[] execVM "f\safeStart\f_safeStart.sqf";

// Run radio setup
[] execVM "f\radios\radio_init.sqf";

//Time of day/weather
/*
call phx_fnc_setTimeOfDay;
call phx_fnc_setWeather;
*/

//====================================================================================================
phx_sharedInitFinished = true;

// Wait for mission to start, then execute post briefing init
[{CBA_missionTime > 0}, {
    call phx_fnc_init_postBriefing;
}, []] call CBA_fnc_waitUntilAndExecute;
