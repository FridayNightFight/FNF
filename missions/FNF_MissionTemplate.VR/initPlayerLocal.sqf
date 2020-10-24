waitUntil {!isNil "phx_serverGameSetup" && !isNil "phx_safetyEnabled"};

if (phx_safetyEnabled && !(typeOf player == "ace_spectator_virtual")) then {
  if (phx_safetyEnabled) then {
    phx_clientJoinedSafe = true;
  };
  if !(isServer) then {
    waitUntil {!isNull findDisplay 46};
    cutText ["Please Wait", "BLACK FADED", 99];
    player enableSimulation false;

    sleep random [8,16,20];
    player linkItem "ItemRadio";
    sleep 3;
  } else {player linkItem "ItemRadio";};
};

call phx_fnc_clientInit;
