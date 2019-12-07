_overcast = "phx_weather_overcast" call BIS_fnc_getParamValue;
_rain = "phx_weather_rain" call BIS_fnc_getParamValue;
_fog = "phx_weather_fog" call BIS_fnc_getParamValue;

if !(_overcast isEqualTo -1) then {
  [_overcast] call BIS_fnc_setOvercast;
};
if !(_rain isEqualTo -1) then {
  0 setRain _rain;
};
if !(_fog isEqualTo -1) then {
  0 setFog _fog;
};
