call phx_fnc_setGroupIDs;
call phx_fnc_createBrief;
[{missionNamespace getVariable ["phx_briefCreated",false] && !isNil "phx_playerBaseChannel"}, {call phx_fnc_createOrbat}] call CBA_fnc_waitUntilAndExecute;
