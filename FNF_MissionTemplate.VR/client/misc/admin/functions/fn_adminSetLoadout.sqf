/*
  Author: IndigoFox

  Description:
    Used to reset a player's loadout to custom value.

  Arguments:
    0: An <ARRAY> of <STRING> containing the selected players' playerIDs.
    1: The class the players should be assigned.
    2: The playerID of the admin performing the call.

  Returns:
    Success or fail per player <Structured Text>
*/

params [["_targetIDs", [], [[]]], ["_classDisplayName", "BASE", [""]], ["_classToSet", "BASE", [""]], ["_adminId", "", [""]]];

private _out = [];

(getUserInfo _adminId) params ["_admin_networkId","_admin_owner","_admin_playerUID","_admin_soldierName","_admin_soldierNameInclSquad","_admin_steamProfileName","_admin_clientStateNumber","_admin_isHeadless","_admin_adminState","_admin_netPerf","_admin_playerObject"];
_out pushBack format["ACTOR: %1", _admin_soldierName];
_out pushBack format["ACTION: %1", "SetLoadout"];

// _out pushBack format["Loadout selection is %1", _classToSet];

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
    _out pushBack formatText["FAIL: Not a valid selection"];
    _continue = false;
  };
  if (isNull _playerObject && _continue) then {
    _out pushBack formatText["FAIL: Player %1 not occupying a unit", _soldierName];
    _continue = false;
  };
  if (!alive _playerObject && _continue) then {
    _out pushBack formatText["FAIL: Player %1 is not alive", _soldierName];
    _continue = false;
  };

  if (_continue) then {
    // remoteExec instructions to client
    [_classToSet] remoteExec ["phx_fnc_applyCfgLoadout", _owner];
    // change loadout var (for selector scripts etc)
    _playerObject setVariable ["phxLoadout", _classToSet, true];

    // notify
    [
      format["<t align='center'>Loadout manually set to <br/>%1<br/> by an admin.<br/>Performed by %2</t>", _classDisplayName, _admin_soldierName],
      "warning",
      10
    ] remoteExec ["phx_ui_fnc_notify", _owner];

    _out pushBack format["SUCCESS: Set loadout %1 on %2", _classToSet, _soldierName];
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
  name player,
  (_out joinString "\n"),
  (playerSide call BIS_fnc_sideID) call BIS_fnc_sideName,
  format [
    "%1 in %2",
    ((roleDescription player) splitString '@') # 0,
    groupId (group player)
  ],
  briefingName,
  worldName,
  _grid,
  // cba_missionTime
  [cba_missionTime / 60, "HH:MM"] call BIS_fnc_timeToString
]] call CBA_fnc_serverEvent;
