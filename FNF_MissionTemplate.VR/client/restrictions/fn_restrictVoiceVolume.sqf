/*
Restricts the player from switching to yelling voice volume during safe start unless the player is in a leadership role
*/

if !(missionNamespace getVariable ["fnf_safetyEnabled", true]) exitWith {};

//Set TFAR volume to whisper
TF_speak_volume_level = "whispering";
TF_speak_volume_meters = 5;
call TFAR_fnc_updateSpeakVolumeUI;

_leaderRoles = ["CC","EO","CSGT","PL","SGT","SL","TL","CRL"];
if (player getVariable ["fnfLoadout",""] in _leaderRoles || leader group player == player) exitWith {};

//Loop this fnc until safety ends
[{TF_speak_volume_level == "yelling" || !(missionNamespace getVariable ["fnf_safetyEnabled", true])}, {call fnf_restrictions_fnc_restrictVoiceVolume}] call CBA_fnc_waitUntilAndExecute;
