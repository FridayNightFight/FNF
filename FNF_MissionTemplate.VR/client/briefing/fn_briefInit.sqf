if (pRole == ROLE_CIV) exitWith {};

call phx_fnc_setGroupIDs;
call phx_fnc_createBrief;
[{missionNamespace getVariable ["phx_briefCreated",false] && !isNil "phx_playerBaseChannel"}, {
  [] spawn {
    while {phx_safetyEnabled} do {
      player removeDiaryRecord ["ORBAT_Diary", playerORBATRecord];
      call phx_fnc_createOrbat;
      sleep 10;
    };
  };
}] call CBA_fnc_waitUntilAndExecute;
