/*
Prevents player from going into video settings to increase gamma beyond a certain threshold (1.3) during night missions.
Not a perfect solution, but best that can be done via scripting, afaik.
Only takes into account the daytime at mission start.
*/
private _sunrise = (date call BIS_fnc_sunriseSunsetTime) select 0;
private _sunset = (date call BIS_fnc_sunriseSunsetTime) select 1;

if (dayTime > _sunrise && dayTime < _sunset) exitWith {};

fnf_gammaWarn = false;
fnf_gammaMax = 1.3;

if (!isNil "fnf_restrictions_handle_restrictGamma") then {
  [fnf_restrictions_handle_restrictGamma] call CBA_fnc_removePerFrameHandler;
  fnf_restrictions_handle_restrictGamma = nil;
};
fnf_restrictions_handle_restrictGamma = [{
  if (isNull findDisplay 5) exitWith {};
  _gamma = parseNumber (ctrlText (findDisplay 5 displayCtrl 109));
  if (_gamma > fnf_gammaMax && !fnf_gammaWarn) then {
    _msg = format ["Gamma setting cannot exceed %1 for this mission, please go into settings and lower the value", fnf_gammaMax];
    cutText [_msg, "BLACK"];
    fnf_gammaWarn = true;
  } else {
    if (_gamma <= fnf_gammaMax && fnf_gammaWarn) then {
      cutText ["", "BLACK IN"];
      fnf_gammaWarn = false;
    };
  };
} , 0.3] call CBA_fnc_addPerFrameHandler;
