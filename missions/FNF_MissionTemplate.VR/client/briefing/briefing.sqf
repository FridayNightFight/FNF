ORBAT_Diary = player createDiarySubject ["ORBAT_Diary", "ORBAT"];
PHX_Diary = player createDiarySubject ["PHX_Diary", "Misc"];

//Admin end start trigger
if (serverCommandAvailable "#kick") then {
  player createDiaryRecord ["PHX_Diary", ["Admin","<execute expression='f_var_mission_timer = -1; publicVariableServer ""f_var_mission_timer""; [false] remoteExec [""phx_fnc_serverSafety"",2,false];'>End Safe Start</execute>"]];
};
