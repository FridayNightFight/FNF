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
  [{ctrlText ((uiNamespace getVariable ["TFAR_Hint_Display", displayNull]) displayCtrl 1100) == "" },{
    [{
      if (call TFAR_fnc_haveSWRadio) then
      {
        [(call TFAR_fnc_ActiveSWRadio), 1] call TFAR_fnc_setSwStereo;
      };
      [call TFAR_fnc_activeLrRadio, 2] call TFAR_fnc_setLrStereo;
    }, [], 0.1] call CBA_fnc_waitAndExecute
  }] call CBA_fnc_waitUntilAndExecute;
};
}] call CBA_fnc_waitUntilAndExecute;
