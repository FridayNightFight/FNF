if (pRole == ROLE_CIV) exitWith {};

call phx_fnc_setGroupIDs;
[{getClientState == "BRIEFING SHOWN"}, {
  call phx_fnc_createBrief;
}] call CBA_fnc_waitUntilAndExecute;

