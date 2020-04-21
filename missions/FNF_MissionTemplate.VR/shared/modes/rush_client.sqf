phx_terminalActionComplete = {
  _term = _this select 0;
  _hacking = _this select 1;
  _message = _this select 2;

  switch (_hacking) do {
    case true: {
      ["Terminal", "Hack Started"] call BIS_fnc_showSubtitle;
      format ["%1 hack started!", _message] remoteExec ["hintSilent", 0];
      [_term,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];

      switch (_term) do {
        case term1: {missionNamespace setVariable ["phx_term1Hacking", true, true];};
        case term2: {missionNamespace setVariable ["phx_term2Hacking", true, true];};
        case term3: {missionNamespace setVariable ["phx_term3Hacking", true, true];};
      };
    };
    case false: {
      ["Terminal", "Hack Stopped"] call BIS_fnc_showSubtitle;
      format ["%1 hack stopped!", _message] remoteExec ["hintSilent", 0];
      [_term,0] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];

      switch (_term) do {
        case term1: {missionNamespace setVariable ["phx_term1Hacking", false, true];};
        case term2: {missionNamespace setVariable ["phx_term2Hacking", false, true];};
        case term3: {missionNamespace setVariable ["phx_term3Hacking", false, true];};
      };
    };
  };
};

//Terminal 1 actions
if !(isNull term1) then {
  phx_term1Hacking = false;

  //Start
  [
    term1,
    "Start Hack",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "(_this distance _target < 3) && (side player == phx_attackingSide) && !phx_term1Hacking",
    "_caller distance _target < 3",
    {["Terminal", "Configuring Hack"] call BIS_fnc_showSubtitle},
    {},
    {
      [term1, true, "Terminal 1"] call phx_terminalActionComplete
    },
    {["Terminal", ""] call BIS_fnc_showSubtitle},
    [],
    5,
    0,
    false,
    false
  ] call BIS_fnc_holdActionAdd;

  //Stop
  [
    term1,
    "Stop Hack",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "(_this distance _target < 3) && (side player == phx_defendingSide) && phx_term1Hacking",
    "_caller distance _target < 3",
    {["Terminal", "Stopping Hack"] call BIS_fnc_showSubtitle},
    {},
    {
      [term1, false, "Terminal 1"] call phx_terminalActionComplete;
    },
    {["Terminal", ""] call BIS_fnc_showSubtitle},
    [],
    1,
    0,
    false,
    false
  ] call BIS_fnc_holdActionAdd;
};

waitUntil {isNull term1};

//Terminal 2 actions
if !(isNull term2) then {
  phx_term2Hacking = false;

  //Start
  [
    term2,
    "Start Hack",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "(_this distance _target < 3) && (side player == phx_attackingSide) && !phx_term2Hacking",
    "_caller distance _target < 3",
    {["Terminal", "Configuring Hack"] call BIS_fnc_showSubtitle},
    {},
    {
      [term2, true, "Terminal 2"] call phx_terminalActionComplete;
    },
    {["Terminal", ""] call BIS_fnc_showSubtitle},
    [],
    5,
    0,
    false,
    false
  ] call BIS_fnc_holdActionAdd;

  //Stop
  [
    term2,
    "Stop Hack",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "(_this distance _target < 3) && (side player == phx_defendingSide) && phx_term2Hacking",
    "_caller distance _target < 3",
    {["Terminal", "Stopping Hack"] call BIS_fnc_showSubtitle},
    {},
    {
      [term2, false, "Terminal 2"] call phx_terminalActionComplete;
    },
    {["Terminal", ""] call BIS_fnc_showSubtitle},
    [],
    1,
    0,
    false,
    false
  ] call BIS_fnc_holdActionAdd;
};

waitUntil {isNull term2};

//Terminal 3 actions
if !(isNull term3) then {
  phx_term3Hacking = false;

  //Start
  [
    term3,
    "Start Hack",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "(_this distance _target < 3) && (side player == phx_attackingSide) && !phx_term3Hacking",
    "_caller distance _target < 3",
    {["Terminal", "Configuring Hack"] call BIS_fnc_showSubtitle},
    {},
    {
      [term3, true, "Terminal 3"] call phx_terminalActionComplete;
    },
    {["Terminal", ""] call BIS_fnc_showSubtitle},
    [],
    5,
    0,
    false,
    false
  ] call BIS_fnc_holdActionAdd;

  //Stop
  [
    term3,
    "Stop Hack",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "(_this distance _target < 3) && (side player == phx_defendingSide) && phx_term3Hacking",
    "_caller distance _target < 3",
    {["Terminal", "Stopping Hack"] call BIS_fnc_showSubtitle},
    {},
    {
      [term3, false, "Terminal 3"] call phx_terminalActionComplete;
    },
    {["Terminal", ""] call BIS_fnc_showSubtitle},
    [],
    1,
    0,
    false,
    false
  ] call BIS_fnc_holdActionAdd;
};
