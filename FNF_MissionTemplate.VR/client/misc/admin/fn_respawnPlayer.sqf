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
    0: Name of the player to target <STRING>

  Returns:
    All returns are to debug console for admin
      - if player found, returns "[name] will respawn in 10 sec and be moved to their safeStart area."
      - if player not found or isNull, will return saying so
*/

params [["_searchName", "", [""]]];
// _searchName = "IndigoFox";

private _search = (allPlayers select {name _x == _searchName});
// "debug_console" callExtension str(_search);
if (count _search == 0) exitWith {formatText["Player not found, searched for ""%1""", _searchName]};
private _target = objNull;
_target = _search select 0;
if (isNull _target) exitWith {formatText["Player %1 not occupying a unit", name _target]};
if (alive _target) exitWith {formatText["Player %1 is still/already alive", name _target]};

{
  if !(isNil "fnf_adminRespawnHandler") then {
    if !(scriptDone fnf_adminRespawnHandler) exitWith {};
  };
  fnf_adminRespawnHandler = [] spawn {
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
    [format["<t align='center'>You've been returned<br/>to your side's safe start zone.<br/>The logged-in admin<br/>(%1)<br/>should teleport you momentarily.</t>", _admin], "success", 15] call phx_ui_fnc_notify;
  };
} remoteExecCall ["call", _target];
formatText["%1 will respawn in 10 sec and be moved to their safeStart area.", name _target, side _target];
