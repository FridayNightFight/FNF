/* ----------------------------------------------------------------------------
Function: phx_fnc__hintThenClear
Description:
     Display a hint then after some delay display another empty hint to clear any existing hint from the player's screen.
Parameters:
    _hintStr - the initial hint to display <STRING>
Optional Parameters:
    _delay - the delay in seconds from when the hint is displayed until it is cleared [default: 15] <INTEGER>
Examples:
    (begin example)
        // Call a hint and then clear it after the default 15 seconds.
        ["BLUFOR are victorious!"] call phx_fnc__hintThenClear;
        
        // Call a hint and then clear it after 45 seconds.
        ["You are dead.",45] call phx_fnc__hintThenClear;
        
        // Call a hint from a stored variable and then clear it after 5 seconds.
        [_str,5] call phx_fnc__hintThenClear;
    (end)
---------------------------------------------------------------------------- */
params ["_hintStr","_delay"];
hint _hintStr;
if (isNil "_delay") then {
    _delay = 15;
};
_delayedTime = diag_tickTime + _delay;
[{
    params ["_args","_handle"];
    _args params ["_delayedTime"];
    
    if (diag_tickTime > _delayedTime) then {
        hintSilent "";
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 1, [_delayedTime]] call CBA_fnc_addPerFrameHandler;