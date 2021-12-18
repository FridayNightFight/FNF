phx_safetyEndExpression = {
  [] spawn {
    private _result = true;

    if (!isServer) then {
      _result = ["Are you sure you want to end safestart?", "Confirm", true, true] call BIS_fnc_guiMessage;
    };

    if (_result) then {
      f_var_mission_timer = -1;
      publicVariableServer "f_var_mission_timer";
      systemChat "Ending Safe Start";
    };
  };
};

PHX_Diary = player createDiarySubject ["PHX_Diary_Admin_Safestart", "Admin", "\A3\ui_f\data\igui\cfg\simpleTasks\types\defend_ca.paa"];

//display template version
player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin",format ["Template Version: %1", phx_templateVersion]]];
//end safety
player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='call phx_safetyEndExpression'>End Safe Start</execute>"]];

//-1 minute to safety
player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='
if !(f_var_mission_timer <= 1) then {
	f_var_mission_timer = f_var_mission_timer - (60*1);
	publicVariableServer ""f_var_mission_timer"";
};
systemChat format [""New safe start time: %1 mins"", f_var_mission_timer];
'>-1 Minute to Safe Start</execute>"]];

//+1 minute to safety
player createDiaryRecord ["PHX_Diary_Admin_Safestart", ["Admin","<execute expression='
f_var_mission_timer = f_var_mission_timer + (60*1);
publicVariableServer ""f_var_mission_timer"";
systemChat format [""New safe start time: %1 mins"", f_var_mission_timer];
'>+1 Minute to Safe Start</execute>"]];

//remove admin diary subject once safety ends
phx_adminDiaryRemove = [{!(missionNamespace getVariable ["phx_safetyEnabled",true])}, {
  if (player diarySubjectExists "PHX_Diary_Admin_Safestart") then {
    player removeDiarySubject "PHX_Diary_Admin_Safestart";
  };
}] call CBA_fnc_waitUntilAndExecute;
