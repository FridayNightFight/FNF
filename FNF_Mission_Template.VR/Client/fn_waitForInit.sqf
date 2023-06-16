if (isDedicated) exitWith {};

if (hasInterface and isServer) exitwith {call FNF_ClientSide_fnc_init;};

[{
  _result = false;
  if (not isNil "fnf_syncConnectionsComplete") then
  {
    _count = 0;
    {
      if (typeOf _x != "ace_spectator_virtual") then
      {
        _count = _count + 1;
      };
    } forEach (allMissionObjects "man");
    if (fnf_syncConnectionsComplete == _count) then
    {
      _result = true;
    };
  };
  _result;
},{
  [{
    _localSync = synchronizedObjects player;
    _playerFoundAmount = [];
    {
      _remoteSync = synchronizedObjects _x;
      _moduleTesting = _x;
      {
        if (_x == player) then
        {
          _playerFoundAmount pushBack _moduleTesting;
        };
      } forEach _remoteSync;
    } forEach _localSync;
    {
      _x synchronizeObjectsAdd [player];
    } forEach (_localSync - _playerFoundAmount);
    (count _playerFoundAmount) == (count _localSync);
  },{
    call FNF_ClientSide_fnc_init;
  }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_waitUntilAndExecute;
