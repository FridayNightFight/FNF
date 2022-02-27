call fnf_restrictions_fnc_disableMisc;
call fnf_restrictions_fnc_zoneBoundary;
call fnf_restrictions_fnc_restrictGamma;
call fnf_restrictions_fnc_startBoundary;
call fnf_restrictions_fnc_restrictedZones;
call fnf_restrictions_fnc_viewDistance;

//Uniform and etool restrictions
[{missionNamespace getVariable ["fnf_loadoutAssigned",false]}, {call fnf_restrictions_fnc_restrictETool}] call CBA_fnc_waitUntilAndExecute;
[{!(missionNamespace getVariable ["fnf_safetyEnabled",true])}, {call fnf_restrictions_fnc_restrictUniform}] call CBA_fnc_waitUntilAndExecute;
//[{!fnf_safetyEnabled && !isNull (findDisplay 46)}, {call fnf_restrictions_fnc_afkCheck}] call CBA_fnc_waitUntilAndExecute;

//Set TFAR volume to whisper
TF_speak_volume_level = "whispering";
TF_speak_volume_meters = 5;
call TFAR_fnc_updateSpeakVolumeUI;

//Disable zeus ping
missionnamespace setvariable ["bis_fnc_curatorPinged_time", 9999, false];
