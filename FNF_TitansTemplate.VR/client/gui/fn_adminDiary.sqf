if (serverCommandAvailable "#kick") then {
  PHX_Diary = player createDiarySubject ["PHX_Diary_Admin_Safestart", "Admin", "\A3\ui_f\data\igui\cfg\simpleTasks\types\defend_ca.paa"];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='f_var_mission_timer = -1; publicVariableServer ""f_var_mission_timer""; systemChat ""Ending Safe Start"";'>End Safe Start</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='
  if !(f_var_mission_timer <= 1) then {
    f_var_mission_timer = f_var_mission_timer - 1;
    publicVariableServer ""f_var_mission_timer"";
  };
  systemChat format [""New safe start time: %1 mins"", f_var_mission_timer];
  '>-1 Minute to Safe Start</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='f_var_mission_timer = f_var_mission_timer + 1; publicVariableServer ""f_var_mission_timer""; systemChat format [""New safe start time: %1 mins"", f_var_mission_timer];'>+1 Minute to Safe Start</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='1 remoteExec [""PHX_fnc_adminCommandHandeler"", 2];'>Blue Team Wins</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='2 remoteExec [""PHX_fnc_adminCommandHandeler"", 2];'>Red Team Wins</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='3 remoteExec [""PHX_fnc_adminCommandHandeler"", 2];'>Blue Team +1</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='4 remoteExec [""PHX_fnc_adminCommandHandeler"", 2];'>Blue Team -1</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='5 remoteExec [""PHX_fnc_adminCommandHandeler"", 2];'>Red Team +1</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='6 remoteExec [""PHX_fnc_adminCommandHandeler"", 2];'>Red Team -1</execute>"]];
  
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='""end1"" remoteExec [""bis_fnc_endmissionserver"", 2];'>End Mission</execute>"]];
};