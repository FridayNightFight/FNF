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
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='phx_gameEnd = true; publicVariable ""phx_gameEnd""; west call PHX_fnc_titanMultiRoundHandler;'>Blue Team Wins</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='phx_gameEnd = true; publicVariable ""phx_gameEnd""; east call PHX_fnc_titanMultiRoundHandler;'>Red Team Wins</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='phx_blueTeamScore = phx_blueTeamScore + 1'>Blue Team +1</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='phx_blueTeamScore = phx_blueTeamScore - 1'>Blue Team -1</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='phx_redTeamScore = phx_redTeamScore + 1'>Red Team +1</execute>"]];
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='phx_redTeamScore = phx_redTeamScore - 1'>Red Team -1</execute>"]];
  
  player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='""end1"" call bis_fnc_endmissionserver;'>End Mission</execute>"]];
};