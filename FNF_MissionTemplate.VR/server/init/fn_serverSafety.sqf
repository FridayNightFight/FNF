/*
Server component to the safety system
*/

missionNamespace setVariable ["phx_safetyEnabled",true,true];
f_var_mission_timer = phx_safeStartTime;
missionNamespace setVariable ["f_var_mission_timer",f_var_mission_timer,true];

{_x allowDamage false;} forEach vehicles;

waitUntil {time > 2};

private _timer = f_var_mission_timer * 60;

while {f_var_mission_timer >= 0} do {
  if ((_timer % 60) == 0) then {
    if !(f_var_mission_timer == 0) then {
      ["SafeStart",[format["Time Remaining: %1 min",f_var_mission_timer]]] remoteExec ["bis_fnc_showNotification",0,false];
    };

    f_var_mission_timer = f_var_mission_timer - 1;
    missionNamespace setVariable ["f_var_mission_timer",f_var_mission_timer,true];
  };

  uisleep 1;
  _timer = _timer - 1;
};

//Start the mission. Remove safety from players, allow vehicles to be damaged and delete start zone markers
["SafeStartMissionStarting",["Mission starting now!"]] remoteExec ["bis_fnc_showNotification",0,false];

missionNamespace setVariable ["phx_safetyEnabled",false,true];

{_x allowDamage true;} forEach vehicles;

//Delete start markers
{
  if !(getMarkerColor _x isEqualTo "") then {
    [_x] remoteExec ["deleteMarkerLocal",0,true];
  };
} forEach ["opforSafeMarker", "bluforSafeMarker", "indforSafeMarker"];

//Disable fortify
["off"] call acex_fortify_fnc_handleChatCommand;
