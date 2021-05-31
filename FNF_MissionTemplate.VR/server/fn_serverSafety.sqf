/*
Server component to the safety system
*/

missionNamespace setVariable ["phx_safetyEnabled",true,true];
f_var_mission_timer = 3;
missionNamespace setVariable ["f_var_mission_timer",f_var_mission_timer,true];

{_x allowDamage false;} forEach vehicles;

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
  phx_gameEnd = false;
  publicVariable "phx_gameEnd";
  missionNamespace setVariable ["newRound", false, true];
  missionNamespace setVariable ["phx_safetyEnabled",false,true];
  missionNamespace setVariable ["phx_safetyEndTime", round CBA_missionTime, true];
  ["SafeStartMissionStarting",["Mission starting now!"]] remoteExec ["bis_fnc_showNotification",0,false];
  ["off"] call acex_fortify_fnc_handleChatCommand;

  {_x allowDamage true;} forEach vehicles;
  call PHX_fnc_checkAlive;
}] call CBA_fnc_waitUntilAndExecute;
