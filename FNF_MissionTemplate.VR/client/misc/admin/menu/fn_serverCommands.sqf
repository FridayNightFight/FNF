if (!isServer) exitWith {};

["FNF_UIPanelAdmin_ButtonClicked", {
  params ["_action", "_args", "_callerID"];

  (getUserInfo _callerID) params ["_networkId","_owner","_playerUID","_soldierName","_soldierNameInclSquad","_steamProfileName","_clientStateNumber","_isHeadless","_adminState","_netPerf","_playerObject"];

  switch (_action) do {
    case "kick": {
      (getUserInfo _args) params ["_toKickNetworkId","_toKickOwner","_toKickPlayerUID","_toKickSoldierName"];
      "llcooljiscool" serverCommand format ["#kick %1", _toKickPlayerUID];
      [
        "FNF_UIPanelAdmin_ReturnStatus",
        format["ACTOR: %1<br/>ACTION: Kick<br/>SUCCESS: Kicked %2", _soldierName, _toKickSoldierName]
      ] call CBA_fnc_globalEvent;
    };
    case "ban": {
      (getUserInfo _args) params ["_toKickNetworkId","_toKickOwner","_toKickPlayerUID","_toKickSoldierName"];
      "llcooljiscool" serverCommand format ["#exec ban %1", _toKickPlayerUID];
      [
        "FNF_UIPanelAdmin_ReturnStatus",
        format["ACTOR: %1<br/>ACTION: Ban<br/>SUCCESS: Banned %2", _soldierName, _toKickSoldierName]
      ] call CBA_fnc_globalEvent;
    };
    case "setIndforAllegiance": {
      private _sideFriendly = ([west, east, sideEmpty] select {(_x call BIS_fnc_sideID) isEqualTo parseNumber(_args)}) select 0;
      [_sideFriendly, _callerID] call fnf_admin_fnc_setIndforAllegiance;
    };
    case "setLoadout": {
      _args params ["_targets", "_classDisplayName", "_classToSet"];
      [[_targets], _classDisplayName, _classToSet, _callerID] call fnf_admin_fnc_adminSetLoadout;
    };
    case "resetAnimState": {
      [[_args], _callerID] call fnf_admin_fnc_resetAnimState;
    };
    case "respawnPlayer": {
      [[_args], _callerID] call fnf_admin_fnc_respawnPlayer;
    };
    case "killPlayer": {
      [[_args], _callerID] call fnf_admin_fnc_killPlayer;
    };
    case "copyPlayerUIDs": {
      [[_args], _callerID] call fnf_admin_fnc_copyPlayerUIDs;
    };
  };
}] call CBA_fnc_addEventHandlerArgs;
