[{
  missionNamespace getVariable ["phx_loadoutAssigned",false] &&
  {!isNil "phx_bluforBaseChannel"} &&
  {!isNil "phx_opforBaseChannel"} &&
  {!isNil "phx_indforBaseChannel"} &&
  {!isNil "phx_groupIDset"}
}, {call phx_fnc_radio_getChannels}] call CBA_fnc_waitUntilAndExecute;
