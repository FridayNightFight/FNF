[{
  _result = false;
  if (not isNil "fnf_syncConnectionsComplete") then
  {
    if (fnf_syncConnectionsComplete == count (allMissionObjects "man")) then
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
    systemChat "testing schema";
    {
      _x synchronizeObjectsAdd [player];
    } forEach (_localSync - _playerFoundAmount);
    (count _playerFoundAmount) == (count _localSync);
  },{
    call FNF_ClientSide_fnc_init;
  }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_waitUntilAndExecute;
