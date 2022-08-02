/*
  Author: Mallen

  Description:
    Used to message a player individually

  Arguments:
    0: An <ARRAY> of <STRING> containing the selected players' playerIDs.
    1: The message the players should be shown.
    2: The playerID of the admin performing the call.

  Returns:
    Success or fail per player <Structured Text>
*/

params [["_targetIDs", [], [[]]], ["_messageText", "Message Error, contact sender on Teamspeak", [""]], ["_adminId", "", [""]]];

private _out = [];

(getUserInfo _adminId) params ["_admin_networkId","_admin_owner","_admin_playerUID","_admin_soldierName","_admin_soldierNameInclSquad","_admin_steamProfileName","_admin_clientStateNumber","_admin_isHeadless","_admin_adminState","_admin_netPerf","_admin_playerObject"];
_out pushBack format["ACTOR: %1", _admin_soldierName];
_out pushBack format["ACTION: %1", "MessagePlayer"];

if (count _targetIDs == 0) then {
  _out pushBack format["FAIL: No players in side"];
};

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

  // conditions
  private _continue = true;
  if (isNil "_playerObject") then {
    _out pushBack format["FAIL: Not a valid selection"];
    _continue = false;
  };

  if (_continue) then {
    // notify
    [
      format["<t align='center' size='1.4' color='#FFFF00'>ADMIN MESSAGE</t><t align='center'><br/><br/>%1<br/><br/>Sent by %2</t>", _messageText, _admin_soldierName],
      "error",
      30
    ] remoteExec ["fnf_ui_fnc_notify", _owner];

    _out pushBack format["SUCCESS: message sent to %1", _soldierName];
    _out pushBack format["MESSAGE: %1", _messageText];
  };
} forEach _targetIDs;

[
  "FNF_UIPanelAdmin_ReturnStatus",
  _out joinString "<br/>"
] call CBA_fnc_globalEvent;


// sends event to server w/ information
// used for Discord report
["fnfAdminMessageServer", [
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
