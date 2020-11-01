switch (_this select 0) do {
  case true: {
    missionNamespace setVariable ["phx_safetyEnabled",true,true];
    f_var_mission_timer = phx_safeStartTime;
    publicVariable "f_var_mission_timer";

    {_x allowDamage false;} forEach vehicles;

    sleep 2;

    while {f_var_mission_timer > 0} do {
      ["SafeStart",[format["Time Remaining: %1 min",f_var_mission_timer]]] remoteExec ["bis_fnc_showNotification",0,false];

      uisleep 60;

      // If mission timer has been terminated by admin briefing, simply exit
      if (f_var_mission_timer < 0) exitWith {};

      // Reduce the mission timer by one
      f_var_mission_timer = f_var_mission_timer - 1;
      publicVariable "f_var_mission_timer";
    };

    if (f_var_mission_timer == 0) then {
      [false] call phx_fnc_serverSafety;
    };
  };

  case false: {
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
  };
};
