defendingSide = _this select 0;
attackingSide = _this select 1;
objectivesNumber = _this select 2;

if (isNil "objectivesNumber") then {
  objectivesNumber = 3;
};

if ((defendingSide == attackingSide) || !((objectivesNumber == 1) || (objectivesNumber == 2) || (objectivesNumber == 3)) || (isNil "defendingSide") || (isNil "attackingSide"))
exitWith {["Game mode not configured correctly, check 'varSelection.sqf'"] remoteExec ["hint"];};

/*
if !(isNil "sector1") then {
  sector1 setVariable ["owner",defendingSide];
};
if !(isNil "sector2") then {
  sector2 setVariable ["owner",defendingSide];
};
if !(isNil "sector3") then {
  sector3 setVariable ["owner",defendingSide];
};
*/

switch (defendingSide) do {
  //east defense
  case east: {
    switch (attackingSide) do {
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
    switch (attackingSide) do {
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
    switch (attackingSide) do {
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

controllingSideSector1 = defendingSide;
controllingSideSector2 = defendingSide;
controllingSideSector3 = defendingSide;
gameEnd = false;

waitUntil {(controllingSideSector1 != defendingSide) || (controllingSideSector2 != defendingSide) || (controllingSideSector3 != defendingSide)};

switch (objectivesNumber) do {
  case 1: {
    [] spawn {
      while {!gameEnd} do {
        if (controllingSideSector1 == attackingSide) then {
          gameEnd = true;
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
      while {!gameEnd} do {
        if ((controllingSideSector1 == attackingSide) && (controllingSideSector2 == attackingSide)) then {
          gameEnd = true;
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
      while {!gameEnd} do {
        if ((controllingSideSector1 == attackingSide) && (controllingSideSector2 == attackingSide) && (controllingSideSector3 == attackingSide)) then {
          gameEnd = true;
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
  waitUntil {controllingSideSector1 == attackingSide};
  ["attackTask_1","SUCCEEDED"] call BIS_fnc_taskSetState;
  ["defendTask_1","FAILED"] call BIS_fnc_taskSetState;
};
[] spawn {
  waitUntil {controllingSideSector2 == attackingSide};
  ["attackTask_2","SUCCEEDED"] call BIS_fnc_taskSetState;
  ["defendTask_2","FAILED"] call BIS_fnc_taskSetState;
};
[] spawn {
  waitUntil {controllingSideSector3 == attackingSide};
  ["attackTask_3","SUCCEEDED"] call BIS_fnc_taskSetState;
  ["defendTask_3","FAILED"] call BIS_fnc_taskSetState;
};

/*
if (isServer) then {
  controllingSideSector1 = _this select 1;
  if ((!isNil "balls") && (controllingSideSector1 == attackingSide)) then {
    deleteVehicle (_this select 0);
  };
  balls = true;
};

if (isServer) then {
  controllingSideSector2 = _this select 1;
  if ((!isNil "balls1") && (controllingSideSector2 == attackingSide)) then {
    deleteVehicle (_this select 0);
  };
  balls1 = true;
};

if (isServer) then {
  controllingSideSector3 = _this select 1;
  if ((!isNil "balls2") && (controllingSideSector3 == attackingSide)) then {
    deleteVehicle (_this select 0);
  };
  balls2 = true;
};
*/
