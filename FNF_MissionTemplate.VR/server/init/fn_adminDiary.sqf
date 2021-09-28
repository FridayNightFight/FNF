addMissionEventHandler ["OnUserAdminStateChanged", {
	params ["_networkId", "_loggedIn", "_votedIn"];
	if (_loggedIn && (missionNamespace getVariable ["phx_safetyEnabled",true]) then {
    [] remoteExec ["phx_fnc_adminDiary", _networkId];
	};
  if (!_loggedIn) then {
    {
      player removeDiarySubject "PHX_Diary_Admin_Safestart";
      // phx_adminDiaryRemove call CBA_fnc_removePerFrameHandler;
    } remoteExec ["call", _networkId];
  };
}];