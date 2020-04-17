//Generates base channels for radios and broadcasts them to clients. 30MHz-87MHz is the longrange limit before taking into account how many freqs are needed
if (!isServer) exitWith {};

_enablePreset = ["phx_param_enableRadioPreset",1] call BIS_fnc_getParamValue;
if (_enablePreset isEqualTo 0) exitWith {[phx_radHandle1] call CBA_fnc_removePerFrameHandler;};

_opforBaseChannel = floor(random 50) + 30;
_indforBaseChannel = floor(random 50) + 30;
_bluforBaseChannel = floor(random 50) + 30;
_broadcasted1 = ["phx_bluforBaseChannel", _bluforBaseChannel] call CBA_fnc_publicVariable;
_broadcasted2 = ["phx_opforBaseChannel", _opforBaseChannel] call CBA_fnc_publicVariable;
_broadcasted3 = ["phx_indforBaseChannel", _indforBaseChannel] call CBA_fnc_publicVariable;
