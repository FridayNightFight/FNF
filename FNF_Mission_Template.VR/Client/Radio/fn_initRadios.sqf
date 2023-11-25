/*
	Author: Mallen

	Description:
		Sets up Radio stereo settings

	Parameter(s):
		None

	Returns:
		None
*/

//wait two seconds for TFAR to get itself sorted
[{time > 2}, {
  //wait until radios inited
  ["TFAR_event_OnradiosReceived", {
    [{
      //choose what Encryption Code is required
      _encryptionCode = "fnf_default_code";
      switch (playerSide) do {
        case west: {_encryptionCode = "fnf_blufor_code";};
        case east: {_encryptionCode = "fnf_opfor_code";};
        case independent: {_encryptionCode = "fnf_indfor_code";};
        default { };
      };

      //if a player has a SR set up encryption codes and put it in left ear
      if (call TFAR_fnc_haveSWRadio) then
      {
        [(call TFAR_fnc_activeSWRadio), 1] call TFAR_fnc_setSwStereo;
        [(call TFAR_fnc_activeSWRadio), _encryptionCode] call TFAR_fnc_setSwRadioCode;
      };

      //if player has an LR set encryp codes and set to right ear
      if (call TFAR_fnc_haveLRRadio) then
      {
        [call TFAR_fnc_activeLrRadio, 2] call TFAR_fnc_setLrStereo;
        [(call TFAR_fnc_activeLrRadio), _encryptionCode] call TFAR_fnc_setLrRadioCode;
      } else {
        //if no LR check if player has SR, if they do have Alt net be setup in right ear
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
