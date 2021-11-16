// Configure channel permissions.
//
// Note that some channels are set to "voice only". This allows the
// channels to be used for markers. Since VON is disabled in server
// config, vanilla voice is still disabled. This gives the effect of a
// "markers only" channel.
[{!isNil "fnf_staffInfo"}, {
    if ((getPlayerUID player) in fnf_staffInfo) then {
        0 enableChannel true;          // Global
        1 enableChannel true;          // Side
    } else {
        0 enableChannel false;         // Global
        1 enableChannel [false, true]; // Side
    };
    2 enableChannel false;             // Command
    3 enableChannel true;              // Group
    4 enableChannel true;              // Vehicle
    5 enableChannel true;              // Direct
}] call CBA_fnc_waitUntilAndExecute;
