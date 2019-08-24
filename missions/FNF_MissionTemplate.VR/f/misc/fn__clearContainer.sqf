/* ----------------------------------------------------------------------------
Function: phx_fnc__clearContainer
Description:
    Remotely (from server) remove all items from an object
Parameters:
    _object - the object <OBJECT>
Examples:
    (begin example)
        [_crate] call phx_fnc__clearContainer;
    (end)
---------------------------------------------------------------------------- */
params ["_object"];
if (!isServer) exitWith {};

clearWeaponCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearBackpackCargoGlobal _object;
clearItemCargoGlobal _object;