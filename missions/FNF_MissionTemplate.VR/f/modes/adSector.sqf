objectivesNumber = objectives select 0;

if (isNil "objectivesNumber") then {
  objectivesNumber = 3;
};

if ((phx_defendingSide == phx_attackingSide) || !((objectivesNumber == 1) || (objectivesNumber == 2) || (objectivesNumber == 3)) || (isNil "phx_defendingSide") || (isNil "phx_attackingSide"))
exitWith {["Game mode not configured correctly, check 'varSelection.sqf'"] remoteExec ["hint"];};

if !(isNull sector1) then {
  sector1 setVariable ["owner",phx_defendingSide];
};
if !(isNull sector2) then {
  sector2 setVariable ["owner",phx_defendingSide];
};
if !(isNull sector3) then {
  sector3 setVariable ["owner",phx_defendingSide];
};

switch (phx_defendingSide) do {
  //east defense
  case east: {
    switch (phx_attackingSide) do {
      //east defense - west attack
      case west: {
        if (objectivesNumber == 1) then {
          [east,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [west,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };

        if (objectivesNumber == 2) then {
          [east,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [west,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [east,["defendTask_2"],["Defend Bravo","Defend Bravo",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [west,["attackTask_2"],["Capture Bravo","Capture Bravo",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };

        if (objectivesNumber == 3) then {
          [east,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [west,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [east,["defendTask_2"],["Defend Bravo","Defend Bravo",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [west,["attackTask_2"],["Capture Bravo","Capture Bravo",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [east,["defendTask_3"],["Defend Charlie","Defend Charlie",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [west,["attackTask_3"],["Capture Charlie","Capture Charlie",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };
      };
      //east defense - ind attack
      case independent: {
        if (objectivesNumber == 1) then {
          [east,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [independent,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };

        if (objectivesNumber == 2) then {
          [east,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [independent,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [east,["defendTask_2"],["Defend Bravo","Defend Bravo",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [independent,["attackTask_2"],["Capture Bravo","Capture Bravo",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };

        if (objectivesNumber == 3) then {
          [east,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [independent,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [east,["defendTask_2"],["Defend Bravo","Defend Bravo",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [independent,["attackTask_2"],["Capture Bravo","Capture Bravo",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [east,["defendTask_3"],["Defend Charlie","Defend Charlie",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [independent,["attackTask_3"],["Capture Charlie","Capture Charlie",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };
      };
    };
  };

  //west defense
  case west: {
    switch (phx_attackingSide) do {
      //west defense - east attack
      case east: {
        if (objectivesNumber == 1) then {
          [west,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [east,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };

        if (objectivesNumber == 2) then {
          [west,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [east,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [west,["defendTask_2"],["Defend Bravo","Defend Bravo",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [east,["attackTask_2"],["Capture Bravo","Capture Bravo",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };

        if (objectivesNumber == 3) then {
          [west,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [east,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [west,["defendTask_2"],["Defend Bravo","Defend Bravo",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [east,["attackTask_2"],["Capture Bravo","Capture Bravo",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [west,["defendTask_3"],["Defend Charlie","Defend Charlie",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [east,["attackTask_3"],["Capture Charlie","Capture Charlie",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };
      };
      //west defense - ind attack
      case independent: {
        if (objectivesNumber == 1) then {
          [west,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [independent,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };

        if (objectivesNumber == 2) then {
          [west,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [independent,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [west,["defendTask_2"],["Defend Bravo","Defend Bravo",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [independent,["attackTask_2"],["Capture Bravo","Capture Bravo",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };
        if (objectivesNumber == 3) then {
          [west,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [independent,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [west,["defendTask_2"],["Defend Bravo","Defend Bravo",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [independent,["attackTask_2"],["Capture Bravo","Capture Bravo",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [west,["defendTask_3"],["Defend Charlie","Defend Charlie",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [independent,["attackTask_3"],["Capture Charlie","Capture Charlie",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };
      };
    };
  };

  //ind defense
  case independent: {
    switch (phx_attackingSide) do {
      //ind defense - west attack
      case west: {
        if (objectivesNumber == 1) then {
          [independent,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [west,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };

        if (objectivesNumber == 2) then {
          [independent,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [west,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [independent,["defendTask_2"],["Defend Bravo","Defend Bravo",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [west,["attackTask_2"],["Capture Bravo","Capture Bravo",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };

        if (objectivesNumber == 3) then {
          [independent,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [west,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [independent,["defendTask_2"],["Defend Bravo","Defend Bravo",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [west,["attackTask_2"],["Capture Bravo","Capture Bravo",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [independent,["defendTask_3"],["Defend Charlie","Defend Charlie",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [west,["attackTask_3"],["Capture Charlie","Capture Charlie",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };
      };
      //ind defense - east attack
      case east: {
        if (objectivesNumber == 1) then {
          [independent,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [east,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };

        if (objectivesNumber == 2) then {
          [independent,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [east,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [independent,["defendTask_2"],["Defend Bravo","Defend Bravo",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [east,["attackTask_2"],["Capture Bravo","Capture Bravo",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };
        if (objectivesNumber == 3) then {
          [independent,["defendTask_1"],["Defend Alpha","Defend Alpha",""],[objNull],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [east,["attackTask_1"],["Capture Alpha","Capture Alpha",""],[objNull],"ASSIGNED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [independent,["defendTask_2"],["Defend Bravo","Defend Bravo",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [east,["attackTask_2"],["Capture Bravo","Capture Bravo",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;

          [independent,["defendTask_3"],["Defend Charlie","Defend Charlie",""],[objNull],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
          [east,["attackTask_3"],["Capture Charlie","Capture Charlie",""],[objNull],"CREATED",1,true,"ATTACK"] call BIS_fnc_taskCreate;
        };
      };
    };
  };
};

controllingSideSector1 = phx_defendingSide;
controllingSideSector2 = phx_defendingSide;
controllingSideSector3 = phx_defendingSide;
phx_gameEnd = false;

waitUntil {(controllingSideSector1 != phx_defendingSide) || (controllingSideSector2 != phx_defendingSide) || (controllingSideSector3 != phx_defendingSide)};

switch (objectivesNumber) do {
  case 1: {
    [] spawn {
      while {!phx_gameEnd} do {
        if (controllingSideSector1 == phx_attackingSide) then {
          phx_gameEnd = true;
          ["The zone has been captured.\nAttackers wins!"] remoteExec ["hint"];
          sleep 15;
          "end1" call bis_fnc_endMissionServer;
        };
        sleep 5;
      };
    };
  };
  case 2: {
    [] spawn {
      while {!phx_gameEnd} do {
        if ((controllingSideSector1 == phx_attackingSide) && (controllingSideSector2 == phx_attackingSide)) then {
          phx_gameEnd = true;
          ["All zones have been captured.\nAttackers wins!"] remoteExec ["hint"];
          sleep 15;
          "end1" call bis_fnc_endMissionServer;
        };
        sleep 5;
      };
    };
  };
  case 3: {
    [] spawn {
      while {!phx_gameEnd} do {
        if ((controllingSideSector1 == phx_attackingSide) && (controllingSideSector2 == phx_attackingSide) && (controllingSideSector3 == phx_attackingSide)) then {
          phx_gameEnd = true;
          ["All zones have been captured.\nAttackers wins!"] remoteExec ["hint"];
          sleep 15;
          "end1" call bis_fnc_endMissionServer;
        };
        sleep 5;
      };
    };
  };
};

[] spawn {
  waitUntil {controllingSideSector1 == phx_attackingSide};
  ["attackTask_1","SUCCEEDED"] call BIS_fnc_taskSetState;
  ["defendTask_1","FAILED"] call BIS_fnc_taskSetState;
};
[] spawn {
  waitUntil {controllingSideSector2 == phx_attackingSide};
  ["attackTask_2","SUCCEEDED"] call BIS_fnc_taskSetState;
  ["defendTask_2","FAILED"] call BIS_fnc_taskSetState;
};
[] spawn {
  waitUntil {controllingSideSector3 == phx_attackingSide};
  ["attackTask_3","SUCCEEDED"] call BIS_fnc_taskSetState;
  ["defendTask_3","FAILED"] call BIS_fnc_taskSetState;
};

/*
if (isServer) then {
  controllingSideSector1 = _this select 1;
  if ((!isNil "balls") && (controllingSideSector1 == phx_attackingSide)) then {
    deleteVehicle (_this select 0);
  };
  balls = true;
};

if (isServer) then {
  controllingSideSector2 = _this select 1;
  if ((!isNil "balls1") && (controllingSideSector2 == phx_attackingSide)) then {
    deleteVehicle (_this select 0);
  };
  balls1 = true;
};

if (isServer) then {
  controllingSideSector3 = _this select 1;
  if ((!isNil "balls2") && (controllingSideSector3 == phx_attackingSide)) then {
    deleteVehicle (_this select 0);
  };
  balls2 = true;
};
*/
