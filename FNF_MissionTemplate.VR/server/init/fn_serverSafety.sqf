/*
Server component to the safety system
*/

missionNamespace setVariable ["phx_safetyEnabled",true,true];
f_var_mission_timer = phx_safeStartTime;
missionNamespace setVariable ["f_var_mission_timer",f_var_mission_timer,true];

call phx_fnc_handleSafetyVics; //Make vehicles invincible until safety ends

[{time > 1}, {
  [{
      if (f_var_mission_timer < 0) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler};

      if (f_var_mission_timer > 0) then {
        ["SafeStart",[format["Time Remaining: %1 min",f_var_mission_timer]]] remoteExec ["bis_fnc_showNotification",0,false];
      };

      f_var_mission_timer = f_var_mission_timer - 1;
      publicVariable "f_var_mission_timer";
  }, 60] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;

[{f_var_mission_timer < 0}, {
    missionNamespace setVariable ["phx_safetyEnabled",false,true];
    missionNamespace setVariable ["phx_safetyEndTime", round CBA_missionTime, true];
    ["SafeStartMissionStarting",["Mission starting now!"]] remoteExec ["bis_fnc_showNotification",0,false];
    ["off"] call acex_fortify_fnc_handleChatCommand;

    [] call phx_fnc_webhook_roundStart;

    {
        [_x] remoteExec ["deleteMarkerLocal", -2, true];
        _x setMarkerAlphaLocal 0;
    } forEach ["opforSafeMarker", "bluforSafeMarker", "indforSafeMarker"];

    [] spawn {
        uiSleep 300;
        call phx_fnc_lockVehicles;
        {
            deleteMarkerLocal _x;
        } forEach ["opforSafeMarker", "bluforSafeMarker", "indforSafeMarker"];
    };

}] call CBA_fnc_waitUntilAndExecute;
