/*
  Author: IndigoFox

  Description:
    Used to reset a player's animation state for when they're bugged.

  Arguments:
    0: An <ARRAY> of <STRING> containing the selected players' playerIDs.

  Returns:
    Success or fail per player <Structured Text>
*/

params [["_targetIDs", [], [[]]], ["_adminId", "", [""]]];

private _out = [];

(getUserInfo _adminId) params ["_admin_networkId","_admin_owner","_admin_playerUID","_admin_soldierName","_admin_soldierNameInclSquad","_admin_steamProfileName","_admin_clientStateNumber","_admin_isHeadless","_admin_adminState","_admin_netPerf","_admin_playerObject"];
_out pushBack format["ACTOR: %1", _admin_soldierName];
_out pushBack format["ACTION: %1", "ResetAnimState"];

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
  if (isNull _playerObject && _continue) then {
    _out pushBack format["FAIL: Player %1 not occupying a unit", _soldierName];
    _continue = false;
  };
  if (!alive _playerObject && _continue) then {
    _out pushBack format["FAIL: Player %1 is not alive", _soldierName];
    _continue = false;
  };

  if (_continue) then {
    // remoteExec instructions to client
    [] remoteExec ["ace_common_fnc_headBugFix", _owner];
    // notify
    [
      format["<t align='center'>Standby, fixing bugged animation state.<br/>Performed by %1</t>", _admin_soldierName],
      "success",
      10
    ] remoteExec ["phx_ui_fnc_notify", _owner];

    _out pushBack format["SUCCESS: Reset anims on %1", _soldierName];
  };
} forEach _targetIDs;

[
  "FNF_UIPanelAdmin_ReturnStatus",
  _out joinString "<br/>"
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
