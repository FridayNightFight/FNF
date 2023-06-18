[{
  !isNil "fnf_bluforBaseChannel" &&
  !isNil "fnf_opforBaseChannel" &&
  !isNil "fnf_indforBaseChannel" &&
  !isNil "fnf_groupIDset"
}, {call fnf_radio_fnc_getChannels}] call CBA_fnc_waitUntilAndExecute;
