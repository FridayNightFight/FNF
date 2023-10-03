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
if (call TFAR_fnc_haveLRRadio) then
{
  ["TFAR_event_OnradiosReceived", {
    [{
      if (call TFAR_fnc_haveSWRadio) then
      {
        [(call TFAR_fnc_ActiveSWRadio), 1] call TFAR_fnc_setSwStereo;
      };
      [call TFAR_fnc_activeLrRadio, 2] call TFAR_fnc_setLrStereo;
    }, [], 1] call CBA_fnc_waitAndExecute;
  }] call CBA_fnc_addEventHandler;
};
}] call CBA_fnc_waitUntilAndExecute;
