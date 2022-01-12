/*
  Author: IndigoFox

  Description:
    Used to change Independent allegiance on the fly during FNF, in case they're improperly set by MM.

  Arguments:
    0: side that independent should be friendly to <SIDE>

  Returns:
    true on success <BOOLEAN>
*/

params [["_sideFriendly", sideEmpty, [sideEmpty]], ["_adminId", "", [""]]];

// establish correct code based on _sideFriendly, and assume other sides should be hostile
phx_admin_FixedEncryptionCode = ""; // the side indfor should be able to talk to
switch (_sideFriendly) do {
  case west: {
    phx_admin_FixedEncryptionCode = "_bluefor";
  };
  case east: {
    phx_admin_FixedEncryptionCode = "_opfor"
  };
  case sideEmpty: {
    phx_admin_FixedEncryptionCode = "_independent";
  };
};

// figure out the players whose radios need adjusting
private _playersToFix = (allPlayers select {alive _x && side _x == independent});

// send the code to the relevant clients
{
  (owner _x) publicVariableClient "phx_admin_FixedEncryptionCode";
} forEach _playersToFix;

// apply the radio changes clientside
{
  [{!isNil "phx_admin_FixedEncryptionCode"}, {
    if (call TFAR_fnc_haveSwRadio) then {
      [(call TFAR_fnc_activeSwRadio), phx_admin_FixedEncryptionCode] call TFAR_fnc_setSwRadioCode;
    };
    if (call TFAR_fnc_haveLRRadio) then {
      [(call TFAR_fnc_activeLrRadio), phx_admin_FixedEncryptionCode] call TFAR_fnc_setLrRadioCode;
    };
    phx_admin_FixedEncryptionCode = nil;
    diag_log formatText["[FNF] (admin) Fixed Independent side association."];
  }] call CBA_fnc_waitUntilAndExecute;
} remoteExecCall ["call", _playersToFix];


// apply friendlySides changes serverside

// make enemy Side hostile to independent and vice versa
private _enemySide = [west, east] select {_x != _sideFriendly};
{
  _x setFriend [independent, 0];
  independent setFriend [_x, 0];
} forEach _enemySide;

// make independent friendly to _sideFriendly
if !(_sideFriendly isEqualTo sideEmpty) then {
  independent setFriend [_sideFriendly, 1];
  _sideFriendly setFriend [independent, 1];
};

phx_admin_FixedEncryptionCode = nil;

(getUserInfo _adminId) params ["_networkId","_owner","_playerUID","_soldierName","_soldierNameInclSquad","_steamProfileName","_clientStateNumber","_isHeadless","_adminState","_netPerf","_playerObject"];

private _out = [];
_out pushBack format["ACTOR: %1", _soldierName];
_out pushBack format["ACTION: SetIndforAllegiance"];
_out pushBack format["Adjusted Independent side association."];
_out pushBack format["Friendly to %1,", _sideFriendly];
_out pushBack format["hostile to %4", _enemySide];

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
