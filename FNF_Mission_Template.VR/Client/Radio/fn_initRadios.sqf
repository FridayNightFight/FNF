/*
	Author: Mallen

	Description:
		Sets up Radio stereo settings

	Parameter(s):
		None

	Returns:
		None
*/

[{time > 2}, {
  ["TFAR_event_OnradiosReceived", {
    [{
      if (call TFAR_fnc_haveSWRadio) then
      {
        [(call TFAR_fnc_ActiveSWRadio), 1] call TFAR_fnc_setSwStereo;
      };
      if (call TFAR_fnc_haveLRRadio) then
      {
        [call TFAR_fnc_activeLrRadio, 2] call TFAR_fnc_setLrStereo;
      } else {
        if (call TFAR_fnc_haveSWRadio) then
        {
          _settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
          _settings set [5, 1];
          _settings set [6, 2];
          [(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
        };
      };
    }, [], 1] call CBA_fnc_waitAndExecute;
  }] call CBA_fnc_addEventHandler;
}] call CBA_fnc_waitUntilAndExecute;
