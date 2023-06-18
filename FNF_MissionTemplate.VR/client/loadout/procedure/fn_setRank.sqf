/*
* Author: IndigoFox
*
* Description:
* Set's the unit's rank based on their loadout role.
*
* Arguments:
* 0: Role of the player (called in fnf_loadout_fnc_applyLoadout) (default: "BASE") <STRING>
*
* Return Value:
* true on success <BOOLEAN>
* nil on failure <NIL>
*
* Example:
* [_role] call fnf_loadout_fnc_setRank;
*
* Public: No
*/

// set rank from fnf_loadout_roles (for Nametags)
params [["_role", "BASE"]];
_rank = [fnf_loadout_roles, _role, "PRIVATE"] call BIS_fnc_getFromPairs;
if (typeName _rank isEqualTo "ARRAY") then {_rank = _rank select 1};
player setUnitRank _rank;
true
