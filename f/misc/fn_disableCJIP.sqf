params [
    ["_jipPlayer", objNull, [objNull]], 
    ["_spectList", [], [[]]]
];

if (isNull _jipPlayer) exitWith {};
if (count _spectList isEqualTo 0) exitWith {};

{
    if ((local _x) || (local _jipPlayer)) then {
        _jipPlayer disableCollisionWith _x;
    };
} forEach _spectList;
