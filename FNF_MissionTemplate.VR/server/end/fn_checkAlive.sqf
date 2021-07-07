/*
Announces when a side present in the mission is dead
Doesn't run until safe start ends
*/

phx_bluforInMission = false;
phx_opforInMission = false;
phx_indforInMission = false;

phx_playersInMission = call BIS_fnc_listPlayers;

if (west countSide phx_playersInMission > 0) then {phx_bluforInMission = true};
if (east countSide phx_playersInMission > 0) then {phx_opforInMission = true};
if (independent countSide phx_playersInMission > 0) then {phx_indforInMission = true};

phx_numberOfSides = {_x} count [phx_bluforInMission,phx_opforInMission,phx_indforInMission];

phx_checkAlive_count = {
  params ["_side"];

  private _count = {side group _x == _side} count phx_playersInMission;
  _count;
};

[{
  if (phx_gameEnd) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler};

  private _phx_currentSpectators = call ace_spectator_fnc_players;
  phx_playersInMission = [phx_playersInMission, {_this in _phx_currentSpectators}] call CBA_fnc_reject;
  phx_playersInMission = [phx_playersInMission, {!(alive _this)}] call CBA_fnc_reject;

  if (phx_bluforInMission) then {
    _bluCount = west call phx_checkAlive_count;
    if (_bluCount < 1) then {phx_bluforInMission = false; "BLUFOR eliminated!" remoteExec ["hint"]};
  };

  if (phx_opforInMission) then {
    _opfCount = east call phx_checkAlive_count;
    if (_opfCount < 1) then {phx_opforInMission = false; "OPFOR eliminated!" remoteExec ["hint"]};
  };

  if (phx_indforInMission) then {
    _indCount = independent call phx_checkAlive_count;
    if (_indCount < 1) then {phx_indforInMission = false; "INDFOR eliminated!" remoteExec ["hint"]};
  };

  if (count ([phx_bluforInMission, phx_opforInMission, phx_indforInMission] select {_x == true}) == 1 && phx_numberOfSides > 1) then {
    phx_gameEnd = true;
    publicVariable "phx_gameEnd";

    private _sideWon = switch (true) do {
      case (phx_bluforInMission): {west};
      case (phx_opforInMission): {east};
      case (phx_indforInMission): {independent};
      default {civilian};
    };

    [_sideWon, "has won by elimination!"] spawn phx_fnc_gameEnd;
  };
}, 10] call CBA_fnc_addPerFrameHandler;
