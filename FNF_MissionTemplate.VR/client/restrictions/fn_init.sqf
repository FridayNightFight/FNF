call phx_restrictions_fnc_disableMisc;
call phx_restrictions_fnc_zoneBoundary;
call phx_restrictions_fnc_restrictGamma;
call phx_restrictions_fnc_startBoundary;
call phx_restrictions_fnc_restrictedZones;
call phx_restrictions_fnc_viewDistance;

//Uniform and etool restrictions
[{missionNamespace getVariable ["phx_loadoutAssigned",false]}, {call phx_restrictions_fnc_restrictETool}] call CBA_fnc_waitUntilAndExecute;
[{!(missionNamespace getVariable ["phx_safetyEnabled",true])}, {call phx_restrictions_fnc_restrictUniform}] call CBA_fnc_waitUntilAndExecute;
//[{!phx_safetyEnabled && !isNull (findDisplay 46)}, {call phx_restrictions_fnc_afkCheck}] call CBA_fnc_waitUntilAndExecute;

//Set TFAR volume to whisper
TF_speak_volume_level = "whispering";
TF_speak_volume_meters = 5;
call TFAR_fnc_updateSpeakVolumeUI;

//Disable zeus ping
missionnamespace setvariable ["bis_fnc_curatorPinged_time", 9999, false];
