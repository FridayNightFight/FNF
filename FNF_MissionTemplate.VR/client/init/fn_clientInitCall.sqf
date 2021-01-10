if (hasInterface) then {
  waitUntil {!isNil "phx_serverGameSetup" && !isNil "phx_safetyEnabled"};
  uiSleep 1;
  phx_fnc_clientInit call CBA_fnc_directCall;
};
