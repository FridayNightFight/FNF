/*
	Author: Mallen

	Description:
		Sets up Radio stereo settings

	Parameter(s):
		None

	Returns:
		None
*/

[{
  if (call TFAR_fnc_haveSWRadio) then
  {
    _currentFreq = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwFrequency;
    _prevFreq = player getVariable ["fnf_freq_sr", "0"];
    if (_currentFreq isNotEqualTo _prevFreq) then
    {
      player setVariable ["fnf_freq_sr", _currentFreq, true];
    };
  };

  if (call TFAR_fnc_haveLRRadio) then
  {
    _currentFreq = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrFrequency;
    _prevFreq = player getVariable ["fnf_freq_lr", "0"];
    if (_currentFreq isNotEqualTo _prevFreq) then
    {
      player setVariable ["fnf_freq_lr", _currentFreq, true];
    };
  };
}, 1] call CBA_fnc_addPerFrameHandler;
