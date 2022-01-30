/*
Server component to the safety system
*/

missionNamespace setVariable ["phx_safetyEnabled",true,true];
f_var_mission_timer = phx_safeStartTime * 60;
missionNamespace setVariable ["f_var_mission_timer",f_var_mission_timer,true];

call phx_safety_fnc_handleVics; //Make vehicles invincible until safety ends

[{time > 1}, {
  [{
    ["f_var_mission_timer", f_var_mission_timer - 5] call CBA_fnc_publicVariable;


    if (f_var_mission_timer > 295 && f_var_mission_timer < 304) then {
      ["SafeStart",["5 minutes remaining"]] remoteExec ["bis_fnc_showNotification",0,false];
    };
    if (f_var_mission_timer > 115 && f_var_mission_timer < 124) then {
      ["SafeStart",["2 minutes remaining"]] remoteExec ["bis_fnc_showNotification",0,false];
    };
    if (f_var_mission_timer > 55 && f_var_mission_timer < 64) then {
      ["SafeStart",["1 minute remaining"]] remoteExec ["bis_fnc_showNotification",0,false];
    };

    if (f_var_mission_timer < 21) exitWith {
      [{
        ["f_var_mission_timer", f_var_mission_timer - 1] call CBA_fnc_publicVariable;
        if (f_var_mission_timer < 0) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler};
      }, 1] call CBA_fnc_addPerFrameHandler;

      [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    if (f_var_mission_timer < 0) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler};
  }, 5] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;

["FNF_Safety_Reduce1Minute", {
  if (f_var_mission_timer >= 0) then {
    ["f_var_mission_timer", f_var_mission_timer - (60*1)] call CBA_fnc_publicVariable;
    format ["New safe start time: %1 mins", [f_var_mission_timer, "MM:SS"] call BIS_fnc_secondsToString] remoteExec ["systemChat",0];
  } else {
    [_thisType, _thisId] call CBA_fnc_removeEventHandler;
  };
}] call CBA_fnc_addEventHandlerArgs;

["FNF_Safety_Add1Minute", {
  if (f_var_mission_timer >= 0) then {
    ["f_var_mission_timer", f_var_mission_timer + (60*1)] call CBA_fnc_publicVariable;
    format ["New safe start time: %1 mins", [f_var_mission_timer, "MM:SS"] call BIS_fnc_secondsToString] remoteExec ["systemChat",0];
  } else {
    [_thisType, _thisId] call CBA_fnc_removeEventHandler;
  };
}] call CBA_fnc_addEventHandlerArgs;

["FNF_Safety_EndNow", {
  ["f_var_mission_timer", -1] call CBA_fnc_publicVariable;
  "Safestart manually ended by an admin" remoteExec ["systemChat", 0];
  [_thisType, _thisId] call CBA_fnc_removeEventHandler;
}] call CBA_fnc_addEventHandlerArgs;


[{f_var_mission_timer < 0}, {
  missionNamespace setVariable ["phx_safetyEnabled",false,true];
  missionNamespace setVariable ["phx_safetyEndTime", round CBA_missionTime, true];
  ["SafeStartMissionStarting",["Mission starting now!"]] remoteExec ["bis_fnc_showNotification",0,false];
  ["off"] call acex_fortify_fnc_handleChatCommand;

  [] call phx_server_fnc_webhook_roundStart;

  if !(phx_gameMode == "sustainedAssault") then {
    [{ // if not SA, lock unoccupied vehicles 5 minutes after safe start ends
      call phx_server_fnc_lockVehicles;
    }, [], 300] call CBA_fnc_waitAndExecute;

    { // if not SA, delete safeStart markers
      // if !(getMarkerColor _x isEqualTo "") then {
        _x remoteExec ["deleteMarkerLocal", 0, true];
      // };
    } forEach ([nil, nil, true] call phx_fnc_inSafeZone);
  };
}] call CBA_fnc_waitUntilAndExecute;
