_enablePreset = ["phx_param_enableRadioPreset",1] call BIS_fnc_getParamValue;
if (_enablePreset isEqualTo 0) exitWith {};

[{
  missionNamespace getVariable ["phx_loadoutAssigned",false] &&
  {!isNil "phx_bluforBaseChannel"} &&
  {!isNil "phx_opforBaseChannel"} &&
  {!isNil "phx_indforBaseChannel"} &&
  {!isNil "phx_groupIDset"}
}, {call phx_fnc_radio_getChannels}, [], 60] call CBA_fnc_waitUntilAndExecute;
