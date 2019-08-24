    // If script is being run on the server
    if(isDedicated) then {

      // Generate frequencies for preset radios
      call phx_fnc_radio_genFreqs;

    } else {
      //If locally hosting, run both client and server script
      if((!isDedicated) && (isServer)) then {call phx_fnc_radio_genFreqs;};

      // Preset radios
      phx_radHandle1 = [phx_fnc_radio_waitGear, 0.1, []] call CBA_fnc_addPerFrameHandler;

    };
