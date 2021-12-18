// if (pRole == ROLE_CIV) exitWith {};

// call phx_fnc_setGroupIDs;
[{getClientStateNumber >= 8 && missionNamespace getVariable ["phx_groupIDset", false]}, {
  call phx_fnc_createBrief;
}] call CBA_fnc_waitUntilAndExecute;

