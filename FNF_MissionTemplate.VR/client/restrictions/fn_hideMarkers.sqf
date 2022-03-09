/*
Hide enemy start zone markers if config is set to do so
*/

if (isnil "fnf_enemyStartVisible") exitwith {};

// don't run for SA
if (fnf_gamemode == "sustainedAssault") exitwith {};

// Ensure that players don't see start zone markers in neutral objective types, regardless of setting in config
if (fnf_gamemode == "connection" || fnf_gamemode == "neutralSector") then {
    fnf_enemyStartVisible = false
};
if (fnf_enemyStartVisible) exitwith {};

// Hides markers the client shouldn't be able to see.
_opforMarks = [nil, east, true] call fnf_fnc_inSafeZone;
_bluforMarks = [nil, west, true] call fnf_fnc_inSafeZone;
_indforMarks = [nil, independent, true] call fnf_fnc_inSafeZone;

_handleMarker = {
    if !(getmarkerColor _this isEqualto "") then {
        _this setMarkerAlphaLocal 0;
    };
};
switch (playerside) do {
    case west: {
        {
            _x call _handleMarker
        } forEach _opforMarks;
        {
            _x call _handleMarker
        } forEach _indforMarks;
    };
    case east: {
        {
            _x call _handleMarker
        } forEach _bluforMarks;
        {
            _x call _handleMarker
        } forEach _indforMarks;
    };
    case independent: {
        {
            _x call _handleMarker
        } forEach _bluforMarks;
        {
            _x call _handleMarker
        } forEach _opforMarks;
    };
    default {
        {
            _x call _handleMarker
        } forEach _bluforMarks;
        {
            _x call _handleMarker
        } forEach _opforMarks;
        {
            _x call _handleMarker
        } forEach _indforMarks;
    };
};
