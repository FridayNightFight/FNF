if !(isNull term1) then {
  phx_term1HackingSide = sideEmpty;

  [
    term1,
    "Connect",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "(_this distance _target < 3) && !(phx_playerSide == phx_term1HackingSide) && !(playerSide == civilian)",
    "_caller distance _target < 3",
    {},
    {},
    {
      [term1, phx_playerSide] remoteExec ["phx_serverTerminalAction", 2, false];
    },
    {},
    [],
    2,
    0,
    false,
    false
  ] call BIS_fnc_holdActionAdd;
};