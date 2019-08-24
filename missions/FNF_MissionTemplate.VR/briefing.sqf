// Make sure the player initializes properly
if (hasInterface && (isNull player)) then {
    waitUntil {sleep 0.1; !isNull player};
};

ORBAT_Diary = player createDiarySubject ["ORBAT_Diary", "ORBAT"];
PHX_Diary = player createDiarySubject ["PHX_Diary", "Misc Info"];

// The following block of code executes only if the player is the current host
if (isMultiplayer) then {
    if (serverCommandAvailable "#kick") then {
        #include "f\briefing\f_briefing_admin.sqf"
    };
} else {
    #include "f\briefing\f_briefing_admin.sqf"
};