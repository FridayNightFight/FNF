/*
Server component to the safety system
*/

missionNamespace setVariable ["phx_safetyEnabled",true,true];
f_var_mission_timer = phx_safeStartTime * 60 + 10;
missionNamespace setVariable ["f_var_mission_timer",f_var_mission_timer,true];

call phx_safety_fnc_handleVics; //Make vehicles invincible until safety ends

[{time > 1}, {
  [{
    if (f_var_mission_timer < 0) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler};

    if (f_var_mission_timer > 115 && f_var_mission_timer < 124) then {
      ["SafeStart",["2 minutes remaining."]] remoteExec ["bis_fnc_showNotification",0,false];
    };

    f_var_mission_timer = f_var_mission_timer - 10;
    publicVariable "f_var_mission_timer";
  }, 10] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;

[{f_var_mission_timer < 0}, {
  missionNamespace setVariable ["phx_safetyEnabled",false,true];
  missionNamespace setVariable ["phx_safetyEndTime", round CBA_missionTime, true];
  ["SafeStartMissionStarting",["Mission starting now!"]] remoteExec ["bis_fnc_showNotification",0,false];
  ["off"] call acex_fortify_fnc_handleChatCommand;

  [] call phx_server_fnc_webhook_roundStart;

  {
    if !(getMarkerColor _x isEqualTo "") then {
      deleteMarker _x;
    };
  } forEach ["opforSafeMarker", "bluforSafeMarker", "indforSafeMarker"];

  [] spawn {
      uiSleep 300;
      call phx_server_fnc_lockVehicles;
      {
          if !(getMarkerColor _x isEqualTo "") then {
              deleteMarkerLocal _x;
          };
      } forEach ["opforSafeMarker", "bluforSafeMarker", "indforSafeMarker"];
  };

}] call CBA_fnc_waitUntilAndExecute;
