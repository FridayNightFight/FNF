/*
* Author: Martin, IndigoFox
*
* Description:
* Route for calling fnf_briefing_fnc_createBrief when client is reaching map screen & required variables are present on units.
*
* Arguments:
* /NONE/
*
* Return Value:
* <NIL>
*
* Example:
* call fnf_briefing_fnc_init;
*
* Public: No
*/

// if (pRole == ROLE_CIV) exitWith {};

// call fnf_briefing_fnc_setGroupIDs;
[{
  getClientStateNumber >= 8 && missionNamespace getVariable ["fnf_groupIDset", false]
}, {
  call fnf_briefing_fnc_createBrief;
}] call CBA_fnc_waitUntilAndExecute;

