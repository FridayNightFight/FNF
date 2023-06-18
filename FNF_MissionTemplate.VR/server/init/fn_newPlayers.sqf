["FNF_NewPlayers_AddToGroup", {
  params ["_group", "_playerObj", "_playCount"];
  _groupNewPlayers = (_group getVariable ["group_newPlayers", []]);
  _groupNewPlayers pushBack [name _playerObj, _playCount];
  _group setVariable ["group_newPlayers", _groupNewPlayers, true];
  // [str([_group, _groupNewPlayers]), "AddtoGroup", [true, true, true]] call CBA_fnc_debug;
}] call CBA_fnc_addEventHandler;

[{cba_missionTime > 30}, {
  /*
    For all groups containing soldiers, gather the self-reported new players and compile into a list with name and play count.
    See clientInit's staggeredLoaded waiter.
  */
  {
    private _thisGroup = _x;
    private _newPlayers = _x getVariable ["group_newPlayers", []];
    private _notificationText = [
      format["<t align='center'><t size='1.2' color='#CCFFCC'>New Players in %1</t>", groupId _x]
    ];

    {
      _x params ["_playerName", "_playCount"];
      _notificationText pushBack format[
        "%1 (played %2 times)",
        _playerName,
        _playCount
      ];
    } forEach _newPlayers;

    _notificationText pushBack "<t size='1.2' color='#CCFFCC'>Welcome!</t></t>";

    if (count _newPlayers > 0) then {
      [(_notificationText joinString "<br/>"), "info", 20] remoteExecCall ["fnf_ui_fnc_notify", _thisGroup];
    };

  } forEach (allGroups select {leader _x isKindOf "CAManBase"});
}] call CBA_fnc_waitUntilAndExecute;


// local testing
// (group player) setVariable ["group_newPlayers", [
//   ["Danny Devito", 2],
//   ["Robert Deniro", 1],
//   ["Michael Scott", 3]
// ], true];

