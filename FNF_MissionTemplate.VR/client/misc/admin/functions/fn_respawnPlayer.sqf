/*
  Author: IndigoFox

  Description:
    Used to manually respawn players during an FNF round that have been Arma'ed in transit post-safeStart.
    Preps with a 10 second timer/notifications on their screen.
    Will:
      - respawn them by temporarily adjusting playerRespawnTime
      - take them out of spectator
      - teleport them to their last safeStart position
      - apply their loadout based on phxLoadout var
      - notify them that the logged-in admin may teleport them again in a moment

  Arguments:
    0: An <ARRAY> of <STRING> containing the selected players' playerIDs.

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
_out pushBack format["ACTION: %1", "RespawnPlayer"];

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
  if (alive _playerObject && _continue) then {
    _out pushBack format["FAIL: Player %1 is still/already alive", _soldierName];
    _continue = false;
  };


  if (_continue) then {
    // remoteExec instructions to client
    [_admin_soldierName, {
      if !(isNil "fnf_adminRespawnHandler") then {
        if !(scriptDone fnf_adminRespawnHandler) exitWith {};
      };
      fnf_adminRespawnHandler = _this spawn {
        // initial notify, 10 sec timer
        private _timer = 10;
        while {_timer >= 1} do {
          [format["You're being respawned in %1 seconds.", _timer], "warning", 1] call phx_ui_fnc_notify;
          uiSleep 1;
          _timer = _timer - 1;
        };

        // respawn procedure
        setPlayerRespawnTime -1;
        uiSleep 1;
        setPlayerRespawnTime 9999;

        // teleport and loadout application
        player setPosATL phx_startGoodPos;
        [false] call ace_spectator_fnc_setSpectator;
        [player getVariable ["phxLoadout", "BASE"]] call phx_fnc_applyCfgLoadout;

        uiSleep 2;

        // get admin
        private _admin = "N/A";
        _loggedInAdmins = allPlayers select {
          (admin owner _x) isEqualTo 2
        };
        if (count _loggedInAdmins != 0) then {_admin = name (_loggedInAdmins select 0)};
        // notify
        [format["<t align='center'>You've been returned<br/>to your side's safe start zone.<br/>The logged-in admin<br/>(%1)<br/>should teleport you momentarily.<br/>Performed by %2</t>", _admin, _this], "success", 15] call phx_ui_fnc_notify;
      };
    }] remoteExecCall ["call", _owner];

    _out pushBack format["SUCCESS: %1 is being respawned", _soldierName];
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
