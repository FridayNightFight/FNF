controlTime = objectives select 0;
controllingSide = "UNKNOWN";
gameEnd = false;

if (isNil "controlTime") then {
  controlTime = 15;
};

controlTime = controlTime * 60;

sleepTime = (controlTime / 60);

[west, 0] call BIS_fnc_respawnTickets;
[east, 0] call BIS_fnc_respawnTickets;
[independent, 0] call BIS_fnc_respawnTickets;

waitUntil {!(controllingSide isEqualTo "UNKNOWN")};

while {!gameEnd} do {
  [controllingSide, 1] call BIS_fnc_respawnTickets;
  if (([controllingSide] call BIS_fnc_respawnTickets >= 100) && !gameEnd) then {
    gameEnd = true;
    switch (controllingSide) do {
      case WEST : {["BLUFOR has reached 100 points.\nBLUFOR wins!"] remoteExec ["hint"];};
      case EAST : {["OPFOR has reached 100 points.\nOPFOR wins!"] remoteExec ["hint"];};
      case Independent : {["INDFOR has reached 100 points.\nOPFOR wins!"] remoteExec ["hint"];};
    };
    sleep 20;
    "end1" call BIS_fnc_endMissionServer;
  };
  sleep sleepTime;
};
