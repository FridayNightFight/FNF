if (!isNil "phx_playerDeathPos") then {
  phx_playerDeathPos = positionCameraToWorld [0,0,0];
};
[] spawn phx_fnc_spectatorInit;
