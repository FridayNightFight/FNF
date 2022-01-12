/*
* Author: Martin, IndigoFox
*
* Description:
* Route for calling phx_briefing_fnc_createBrief when client is reaching map screen & required variables are present on units.
*
* Arguments:
* /NONE/
*
* Return Value:
* <NIL>
*
* Example:
* call phx_briefing_fnc_init;
*
* Public: No
*/

// if (pRole == ROLE_CIV) exitWith {};

// call phx_briefing_fnc_setGroupIDs;
[{getClientStateNumber >= 8 && missionNamespace getVariable ["phx_groupIDset", false]}, {
  call phx_briefing_fnc_createBrief;
}] call CBA_fnc_waitUntilAndExecute;

