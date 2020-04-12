// F3 - Safe Start, Server Loop
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//=====================================================================================

// Run the loop only on the server
if !(isServer) exitWith {};

// Redundant sleep to give everything a second to settle
sleep 2;
publicVariable "f_var_mission_timer";
while {f_var_mission_timer > 0} do {

    // Broadcast remaining time to players
    //[["SafeStart",[format["Time Remaining: %1 min",f_var_mission_timer]]],"bis_fnc_showNotification",true] call BIS_fnc_MP;

    ["SafeStart",[format["Time Remaining: %1 min",f_var_mission_timer]]] remoteExec ["bis_fnc_showNotification",0,false];

    uisleep 60; // Sleep 60 seconds

    // If mission timer has been terminated by admin briefing, simply exit
    if (f_var_mission_timer < 0) exitWith {};

    // Reduce the mission timer by one
    f_var_mission_timer = f_var_mission_timer - 1;
    publicVariable "f_var_mission_timer";
};

//Once the mission timer has reached 0, disable the safeties
if (f_var_mission_timer isEqualTo 0) then {
        // Broadcast message to players
        //[["SafeStartMissionStarting",["Mission starting now!"]],"bis_fnc_showNotification",true] call BIS_fnc_MP;
        ["SafeStartMissionStarting",["Mission starting now!"]] remoteExec ["bis_fnc_showNotification",0,false];

        // Remotely execute script to disable safety for all selectable units
        //[[false],"f_fnc_safety",playableUnits + switchableUnits] call BIS_fnc_MP;

        [false] remoteExec ["f_fnc_safety",0,false];

        call f_fnc_serverEndSafe;
};
