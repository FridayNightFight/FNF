addMissionEventHandler ["OnUserAdminStateChanged", {
	params ["_networkId", "_loggedIn", "_votedIn"];
	if (_loggedIn && (missionNamespace getVariable ["fnf_safetyEnabled",true]) then {
    [] remoteExec ["fnf_fnc_adminDiary", _networkId];
	};
  if (!_loggedIn) then {
    {
      player removeDiarySubject "fnf_Diary_Admin_Safestart";
      // fnf_adminDiaryRemove call CBA_fnc_removePerFrameHandler;
    } remoteExec ["call", _networkId];
  };
}];
