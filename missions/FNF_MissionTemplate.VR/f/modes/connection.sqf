//vars
pointAddTime = 30;

term1Hacking = false;
term2Hacking = false;
term3Hacking = false;
term1HackingSide = civilian;
term2HackingSide = civilian;
term3HackingSide = civilian;
publicVariable "term1HackingSide";
publicVariable "term2HackingSide";
publicVariable "term3HackingSide";

_obj1Mark = createMarker ["term1Mark",getPos term1];
_obj2Mark = createMarker ["term2Mark",getPos term2];
_obj3Mark = createMarker ["term3Mark",getPos term3];

[west, 0] call BIS_fnc_respawnTickets;
[east, 0] call BIS_fnc_respawnTickets;
[independent, 0] call BIS_fnc_respawnTickets;

"term1Mark" setMarkerPos (getPos term1);
"term2Mark" setMarkerPos (getPos term2);
"term3Mark" setMarkerPos (getPos term3);
"term1Mark" setMarkerType "mil_dot";
"term2Mark" setMarkerType "mil_dot";
"term3Mark" setMarkerType "mil_dot";
"term1Mark" setMarkerText "Terminal 1";
"term2Mark" setMarkerText "Terminal 2";
"term3Mark" setMarkerText "Terminal 3";

//Create terminals actions
//Terminal 1 upload action
[
  term1,
  "Start Upload",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "(_this distance _target < 3) && !(side player == term1HackingSide)",
  "_caller distance _target < 3",
  {["Terminal", "Configuring Upload"] call BIS_fnc_showSubtitle},
  {},
  {
    ["Terminal", "Upload Started"] call BIS_fnc_showSubtitle;
    [term1,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    term1Hacking = true;
    publicVariable "term1Hacking";
    term1HackingSide = side player;
    publicVariable "term1HackingSide";
    switch (side player) do {
      case east: {
        "term1Mark" setMarkerType "Faction_OPFOR_EP1";
        "term1Mark" setMarkerText "Uploading - OPFOR";
      };
      case west: {
        "term1Mark" setMarkerType "Faction_BLUFOR_EP1";
        "term1Mark" setMarkerText "Uploading - BLUFOR";
      };
      case independent: {
        "term1Mark" setMarkerType "Faction_INDFOR_EP1";
        "term1Mark" setMarkerText "Uploading - INDFOR";
      };
    };
    ["Terminal 1 uploading!"] remoteExecCall ["phx_fnc__hintThenClear",0,false];
  },
  {["Terminal", ""] call BIS_fnc_showSubtitle},
  [],
  3,
  0,
  false,
  false
] remoteExec ["BIS_fnc_holdActionAdd", 0, true];

//Terminal 2 upload action
[
  term2,
  "Start Upload",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "(_this distance _target < 3) && !(side player == term2HackingSide)",
  "_caller distance _target < 3",
  {["Terminal", "Configuring Upload"] call BIS_fnc_showSubtitle},
  {},
  {
    ["Terminal", "Upload Started"] call BIS_fnc_showSubtitle;
    [term2,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    term2Hacking = true;
    publicVariable "term2Hacking";
    term2HackingSide = side player;
    publicVariable "term2HackingSide";
    switch (side player) do {
      case east: {
        "term2Mark" setMarkerType "Faction_OPFOR_EP1";
        "term2Mark" setMarkerText "Uploading - OPFOR";
      };
      case west: {
        "term2Mark" setMarkerType "Faction_BLUFOR_EP1";
        "term2Mark" setMarkerText "Uploading - BLUFOR";
      };
      case independent: {
        "term2Mark" setMarkerType "Faction_INDFOR_EP1";
        "term2Mark" setMarkerText "Uploading - INDFOR";
      };
    };
    ["Terminal 2 uploading!"] remoteExecCall ["phx_fnc__hintThenClear",0,false];
  },
  {["Terminal", ""] call BIS_fnc_showSubtitle},
  [],
  3,
  0,
  false,
  false
] remoteExec ["BIS_fnc_holdActionAdd", 0, true];

//Terminal 3 upload action
[
  term3,
  "Start Upload",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
  "(_this distance _target < 3) && !(side player == term3HackingSide)",
  "_caller distance _target < 3",
  {["Terminal", "Configuring Upload"] call BIS_fnc_showSubtitle},
  {},
  {
    ["Terminal", "Upload Started"] call BIS_fnc_showSubtitle;
    [term3,3] remoteExec ["BIS_fnc_DataTerminalAnimate",0,true];
    term3Hacking = true;
    publicVariable "term3Hacking";
    term3HackingSide = side player;
    publicVariable "term3HackingSide";
    switch (side player) do {
      case east: {
        "term3Mark" setMarkerType "Faction_OPFOR_EP1";
        "term3Mark" setMarkerText "Uploading - OPFOR";
      };
      case west: {
        "term3Mark" setMarkerType "Faction_BLUFOR_EP1";
        "term3Mark" setMarkerText "Uploading - BLUFOR";
      };
      case independent: {
        "term3Mark" setMarkerType "Faction_INDFOR_EP1";
        "term3Mark" setMarkerText "Uploading - INDFOR";
      };
    };
    ["Terminal 3 uploading!"] remoteExecCall ["phx_fnc__hintThenClear",0,false];
  },
  {["Terminal", ""] call BIS_fnc_showSubtitle},
  [],
  3,
  0,
  false,
  false
] remoteExec ["BIS_fnc_holdActionAdd", 0, true];

//waituntil uploading starts
waitUntil {term1Hacking || term2Hacking || term3Hacking};

removeActions = {
  removeAllActions term1;
  removeAllActions term2;
  removeAllActions term3;
};

//add points every pointAddTime and check for win condition
while {!gameEnd} do {
  if (term1Hacking) then {
    [term1HackingSide, 1] call BIS_fnc_respawnTickets;
  };
  if (term2Hacking) then {
    [term2HackingSide, 1] call BIS_fnc_respawnTickets;
  };
  if (term3Hacking) then {
    [term3HackingSide, 1] call BIS_fnc_respawnTickets;
  };

  if ([west] call BIS_fnc_respawnTickets >= 100) then {
    gameEnd = true;
    call removeActions;
    ["BLUFOR has reached 100 points.\nBLUFOR wins!"] remoteExec ["hint"];
    sleep 15;
    "end1" call BIS_fnc_endMissionServer;
  };
  if ([east] call BIS_fnc_respawnTickets >= 100) then {
    gameEnd = true;
    call removeActions;
    ["OPFOR has reached 100 points.\nOPFOR wins!"] remoteExec ["hint"];
    sleep 15;
    "end1" call BIS_fnc_endMissionServer;
  };
  if ([independent] call BIS_fnc_respawnTickets >= 100) then {
    gameEnd = true;
    call removeActions;
    ["INDFOR has reached 100 points.\nINDFOR wins!"] remoteExec ["hint"];
    sleep 15;
    "end1" call BIS_fnc_endMissionServer;
  };

  sleep pointAddTime;
};
