/*
  Author: IndigoFox

  Description:
    Used to obtain a players UID for use in custom remoteExec calls.

  Arguments:
    0: An <ARRAY> of <STRING> containing the selected players' playerIDs.

  Returns:
    Success message <Structured Text>
*/
params [["_targetIDs", [], [[]]], ["_adminId", "", [""]]];

private _out = [];
private _idText = [];

(getUserInfo _adminId) params ["_admin_networkId","_admin_owner","_admin_playerUID","_admin_soldierName","_admin_soldierNameInclSquad","_admin_steamProfileName","_admin_clientStateNumber","_admin_isHeadless","_admin_adminState","_admin_netPerf","_admin_playerObject"];
_out pushBack format["ACTOR: %1", _admin_soldierName];
_out pushBack format["ACTION: %1", "CopyPlayerUIDs"];


{
  (getUserInfo _x) params [
    "_networkId",
    "_owner",
    "_playerUID",
    "_soldierName",
    "_soldierNameInclSquad",
    "_steamProfileName",
    "_clientStateNumber",
    "_isHeadless",
    "_adminState",
    "_netPerf",
    "_playerObject"
  ];
  _netPerf params ["_avgPing", "_avgBandwidth","_desync"];

  if (!isNil "_playerUID") then {
    _idText pushBackUnique [_playerUID, _soldierName];
  };
} forEach _targetIDs;

copyToClipboard str(_out);


[
  "FNF_UIPanelAdmin_ReturnStatus",
  format["%1<br/>[%2]", _out joinString "<br/>", _idText joinString ","]
] call CBA_fnc_globalEvent;


// sends event to server w/ information
// used for Discord report
["phxAdminMessageServer", [
  "",
  _admin_soldierName,
  (_out joinString "\n"),
  (side _admin_playerObject) call BIS_fnc_sideName,
  format [
    "%1 in %2",
    ((roleDescription _admin_playerObject) splitString '@') # 0,
    groupId (group _admin_playerObject)
  ],
  briefingName,
  worldName,
  mapGridPosition _admin_playerObject,
  // cba_missionTime
  [cba_missionTime / 60, "HH:MM"] call BIS_fnc_timeToString
]] call CBA_fnc_serverEvent;
