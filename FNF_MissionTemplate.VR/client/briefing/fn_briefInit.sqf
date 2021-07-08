if (pRole == ROLE_CIV) exitWith {};

call phx_fnc_setGroupIDs;
call phx_fnc_createBrief;
[{
  !isNil "phx_briefCreated" &&
  !isNil "phx_templateGroupsList" &&
  !isNil "phx_playerBaseChannel"
}, {call phx_fnc_createOrbat}] call CBA_fnc_waitUntilAndExecute;
