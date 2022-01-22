/*
  Author: IndigoFox

  Description:
    Used to kill one or more players.

  Arguments:
    0: An <ARRAY> of <STRING> containing the selected players' playerIDs.
    1: PlayerID of the admin executing this command.

  Returns:
    Success or fail per player <Structured Text>
*/

// params [["_searchName", "", [""]]];
// _searchName = "IndigoFox";
// private _search = (allPlayers select {name _x == _searchName});
// if (count _search == 0) exitWith {formatText["Player not found, searched for ""%1""", _searchName]};
// private _target = objNull;
// _target = _search select 0;

params [["_targetIDs", [], [[]]], ["_adminId", "", [""]]];

private _out = [];

(getUserInfo _adminId) params ["_admin_networkId","_admin_owner","_admin_playerUID","_admin_soldierName","_admin_soldierNameInclSquad","_admin_steamProfileName","_admin_clientStateNumber","_admin_isHeadless","_admin_adminState","_admin_netPerf","_admin_playerObject"];
_out pushBack format["ACTOR: %1", _admin_soldierName];
_out pushBack format["ACTION: %1", "KillPlayer"];

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
  if (isNull _playerObjec && _continuet) then {
    _out pushBack format["FAIL: Player %1 not occupying a unit", _soldierName];
    _continue = false;
  };
  if (!alive _playerObject && _continue) then {
    _out pushBack format["FAIL: Player %1 is already dead", _soldierName];
    _continue = false;
  };


  if (_continue) then {
    _playerObject setDamage 1;

    // remoteExec notify to client
    [_admin_soldierName, {
      [{!isNull (findDisplay 60000)}, {
        [
          format["<t align='center'>You've been killed by an admin.<br/>Performed by %1</t>", _this],
          "warning",
          10
        ] call phx_ui_fnc_notify;
      }, _this] call CBA_fnc_waitUntilAndExecute;
    }] remoteExecCall ["call", _owner];

    _out pushBack format["SUCCESS: %1 has been killed", _soldierName];
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

