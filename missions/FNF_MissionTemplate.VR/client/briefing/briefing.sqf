// Make sure the player initializes properly
if (hasInterface && (isNull player)) then {
    waitUntil {sleep 0.1; !isNull player};
};

ORBAT_Diary = player createDiarySubject ["ORBAT_Diary", "ORBAT"];
PHX_Diary = player createDiarySubject ["PHX_Diary", "Misc Info"];
