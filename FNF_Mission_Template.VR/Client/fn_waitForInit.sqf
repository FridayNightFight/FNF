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
  call FNF_ClientSide_fnc_init;
}] call CBA_fnc_waitUntilAndExecute;
