/* ----------------------------------------------------------------------------
Function: phx_fnc__clearBody
Description:
    Remotely (from server) remove all posessions from a unit
Parameters:
    _unit - the unit <OBJECT>
Examples:
    (begin example)
        [player] call phx_fnc__clearBody;
    (end)
---------------------------------------------------------------------------- */
params ["_unit"];
if (!isServer) exitWith {};

// Emulate removeAllWeapons
removeAllWeapons _unit;
{
    _unit removeWeaponGlobal _x;
} forEach weapons _unit;
// Emulate removeAllItems
{
    _unit removeItem _x;
} forEach items _unit;
// Emulate removeAllAssignedItems
{
    _unit unassignItem _x;
    _unit removeItem _x;
} forEach assignedItems _unit;

removeUniform _unit;
removeVest _unit;
removeBackpackGlobal _unit;
removeHeadgear _unit;
removeGoggles _unit;