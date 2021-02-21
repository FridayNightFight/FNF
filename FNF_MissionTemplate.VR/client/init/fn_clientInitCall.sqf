if (hasInterface) then {
  [{!isNil "phx_serverGameSetup" && !isNil "phx_safetyEnabled"},{
    phx_fnc_clientInit call CBA_fnc_directCall;
  }] call CBA_fnc_waitUntilAndExecute;
};
