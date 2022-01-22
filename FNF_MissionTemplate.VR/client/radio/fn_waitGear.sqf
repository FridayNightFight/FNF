[{
  !isNil "phx_bluforBaseChannel" &&
  !isNil "phx_opforBaseChannel" &&
  !isNil "phx_indforBaseChannel" &&
  !isNil "phx_groupIDset"
}, {call phx_radio_fnc_getChannels}] call CBA_fnc_waitUntilAndExecute;
