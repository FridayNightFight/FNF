/*
Announces when a side present in the mission is dead
Doesn't run until safe start ends
*/

fnf_bluforInMission = false;
fnf_opforInMission = false;
fnf_indforInMission = false;

fnf_playersInMission = call BIS_fnc_listPlayers;

if (west countSide fnf_playersInMission > 0) then {fnf_bluforInMission = true};
if (east countSide fnf_playersInMission > 0) then {fnf_opforInMission = true};
if (independent countSide fnf_playersInMission > 0) then {fnf_indforInMission = true};

fnf_numberOfSides = {_x} count [fnf_bluforInMission,fnf_opforInMission,fnf_indforInMission];

fnf_checkAlive_count = {
  params ["_side"];

  private _count = {side group _x == _side} count fnf_playersInMission;
  _count;
};

[{
  if (fnf_gameEnd) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler};

  _fnc_notifyElimination = {

    private _sideEliminated = sideEmpty;

    if (fnf_bluforInMission) then {
      _bluCount = west call fnf_checkAlive_count;
      if (_bluCount < 1) then {
        fnf_bluforInMission = false;
        _sideEliminated = west;
      };
    };

    if (fnf_opforInMission) then {
      _opfCount = east call fnf_checkAlive_count;
      if (_opfCount < 1) then {
        fnf_opforInMission = false;
        _sideEliminated = east;
      };
    };

    if (fnf_indforInMission) then {
      _indCount = independent call fnf_checkAlive_count;
      if (_indCount < 1) then {
        fnf_indforInMission = false;
        _sideEliminated = independent;
      };
    };

    if (_sideEliminated != sideEmpty) then {
      [format[
        "<t align='center'>%1 eliminated!</t>",
        _sideEliminated call BIS_fnc_sideName
      ],"info",10] remoteExec ["fnf_ui_fnc_notify",0];
    };
  };

  private _fnf_currentSpectators = call ace_spectator_fnc_players;
  fnf_playersInMission = [fnf_playersInMission, {_this in _fnf_currentSpectators}] call CBA_fnc_reject;
  fnf_playersInMission = [fnf_playersInMission, {!(alive _this)}] call CBA_fnc_reject;


  // only notify during uplink and rush if no terminals are active
  if (fnf_gameMode in ["uplink","rush"]) then {
    if !(fnf_term1Hacking || fnf_term2Hacking || fnf_term3Hacking) then {
      call _fnc_notifyElimination;
    };
  } else {
    call _fnc_notifyElimination;
  };


  /*
  if (count ([fnf_bluforInMission, fnf_opforInMission, fnf_indforInMission] select {_x == true}) == 1 && fnf_numberOfSides > 1) then {
    fnf_gameEnd = true;
    publicVariable "fnf_gameEnd";

    private _sideWon = switch (true) do {
      case (fnf_bluforInMission): {west};
      case (fnf_opforInMission): {east};
      case (fnf_indforInMission): {independent};
      default {civilian};
    };

    [_sideWon, "has won by elimination!"] spawn fnf_server_fnc_gameEnd;
  };
  */
}, 10] call CBA_fnc_addPerFrameHandler;
