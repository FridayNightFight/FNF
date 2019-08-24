defendingSide = _this select 0;
objectivesNumber = _this select 1;

if (isNil "defendingSide") then {
  systemChat "You have not configured 'varSelection.sqf' properly! You need to choose a defending side";
};
if (isNil "defendingSide") exitWith {};
if (isNil "objectivesNumber") then {
  objectivesNumber = 2;
};
if (!(defendingSide isEqualTo west) && !(defendingSide isEqualTo east)) then {
  systemChat "You have not configured 'varSelection.sqf' properly! Choose between east and west for defending side";
};
if (!(objectivesNumber == 1) && !(objectivesNumber == 2)) then {
  systemChat "You have not configured 'varSelection.sqf' properly! You need to set the number of objectives";
};
if (objectivesNumber == 1) then {
  deleteVehicle obj2;
  ["obj2Mark"] remoteExec ["deleteMarker",0,true];
};

if (!isNil "obj1") then {
  "obj1Mark" setMarkerPos (getPos obj1);

  if (typeOf obj1 == "Box_FIA_Ammo_F") then {
    obj1 addEventHandler ["HandleDamage", {
    _unit = _this select 0;
    _selection = _this select 1;
    _damage = _this select 2;

    if (_selection == "?") exitWith {};

    _curDamage = damage _unit;
    if (_selection != "") then {_curDamage = _unit getHit _selection};
    _newDamage = _damage - _curDamage;

    _damage - _newDamage * 0.75;
    }];
  };
};

if (!isNil "obj2") then {
  "obj2Mark" setMarkerPos (getPos obj2);

  if (typeOf obj2 == "Box_FIA_Ammo_F") then {
    obj2 addEventHandler ["HandleDamage", {
    _unit = _this select 0;
    _selection = _this select 1;
    _damage = _this select 2;

    if (_selection == "?") exitWith {};

    _curDamage = damage _unit;
    if (_selection != "") then {_curDamage = _unit getHit _selection};
    _newDamage = _damage - _curDamage;

    _damage - _newDamage * 0.75;
    }];
  };
};

obj1DestroyMessage = false;
obj2DestroyMessage = false;

//Create tasks
switch (objectivesNumber) do {
  case 1: {
    switch (defendingSide) do {
      case east: {
        [east,["opfobj1task"],["Protect Objective #1","Protect Objective #1",""],[obj1],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
        [west,["bluobj1task"],["Destroy Objective #1","Destroy Objective #1",""],[objNull],"ASSIGNED",1,true,"DESTROY"] call BIS_fnc_taskCreate;
      };
      case west: {
        [west,["bluobj1task"],["Protect Objective #1","Protect Objective #1",""],[obj1],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
        [east,["opfobj1task"],["Destroy Objective #1","Destroy Objective #1",""],[objNull],"ASSIGNED",1,true,"DESTROY"] call BIS_fnc_taskCreate;
      };
    };
  };
  case 2: {
    switch (defendingSide) do {
      case east: {
        [east,["opfobj1task"],["Protect Objective #1","Protect Objective #1",""],[obj1],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
        [east,["opfobj2task"],["Protect Objective #2","Protect Objective #2",""],[obj2],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
        [west,["bluobj1task"],["Destroy Objective #1","Destroy Objective #1",""],[objNull],"ASSIGNED",1,true,"DESTROY"] call BIS_fnc_taskCreate;
        [west,["bluobj2task"],["Destroy Objective #2","Destroy Objective #2",""],[objNull],"CREATED",1,true,"DESTROY"] call BIS_fnc_taskCreate;
      };
      case west: {
        [west,["bluobj1task"],["Protect Objective #1","Protect Objective #1",""],[obj1],"ASSIGNED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
        [west,["bluobj2task"],["Protect Objective #2","Protect Objective #2",""],[obj2],"CREATED",1,true,"DEFEND"] call BIS_fnc_taskCreate;
        [east,["opfobj1task"],["Destroy Objective #1","Destroy Objective #1",""],[objNull],"ASSIGNED",1,true,"DESTROY"] call BIS_fnc_taskCreate;
        [east,["opfobj2task"],["Destroy Objective #2","Destroy Objective #2",""],[objNull],"CREATED",1,true,"DESTROY"] call BIS_fnc_taskCreate;
      };
    };
  };
};

switch (objectivesNumber) do {
  case 1: {
    [] spawn {
      while {!gameEnd} do {
        if (!alive obj1 && !obj1DestroyMessage) then {
          obj1DestroyMessage = true;
          ["obj1Mark"] remoteExec ["deleteMarker",0,true];
          gameEnd = true;
          if (defendingSide isEqualTo west) then {
            ["The objective has been destoryed.\nOPFOR wins!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
            ["bluobj1task","FAILED"] call BIS_fnc_taskSetState;
            ["opfobj1task","SUCCEEDED"] call BIS_fnc_taskSetState;
          };
          if (defendingSide isEqualTo east) then {
            ["The objective has been destoryed.\nBLUFOR wins!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
            ["bluobj1task","SUCCEEDED"] call BIS_fnc_taskSetState;
            ["opfobj1task","FAILED"] call BIS_fnc_taskSetState;
          };
          sleep 15;
          "end1" call bis_fnc_endMissionServer;
        };
        sleep 3;
      };
    };
  };
  case 2: {
    [] spawn {
      while {!gameEnd} do {
        if (!alive obj1 && !obj1DestroyMessage) then {
          obj1DestroyMessage = true;
          ["obj1Mark"] remoteExec ["deleteMarker",0,true];
          ["Objective #1 has been destroyed!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
          if (defendingSide isEqualTo west) then {
            ["bluobj1task","FAILED"] call BIS_fnc_taskSetState;
            ["opfobj1task","SUCCEEDED"] call BIS_fnc_taskSetState;
          };
          if (defendingSide isEqualTo east) then {
            ["bluobj1task","SUCCEEDED"] call BIS_fnc_taskSetState;
            ["opfobj1task","FAILED"] call BIS_fnc_taskSetState;
          };
        };
        if (!alive obj2 && !obj2DestroyMessage) then {
          obj2DestroyMessage = true;
          ["obj2Mark"] remoteExec ["deleteMarker",0,true];
          ["Objective #2 has been destroyed!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
          if (defendingSide isEqualTo west) then {
            ["bluobj2task","FAILED"] call BIS_fnc_taskSetState;
            ["opfobj2task","SUCCEEDED"] call BIS_fnc_taskSetState;
          };
          if (defendingSide isEqualTo east) then {
            ["bluobj2task","SUCCEEDED"] call BIS_fnc_taskSetState;
            ["opfobj2task","FAILED"] call BIS_fnc_taskSetState;
          };
        };
        if (!alive obj1 && !alive obj2) then {
          gameEnd = true;
          if (defendingSide isEqualTo west) then {
            ["Both objectives have been destroyed.\nOPFOR wins!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
          };
          if (defendingSide isEqualTo east) then {
            ["Both objectives have been destroyed.\nBLUFOR wins!"] remoteExecCall ["phx_fnc__hintThenClear", 0];
          };
          sleep 15;
          "end1" call bis_fnc_endMissionServer;
        };
        sleep 3;
      };
    };
  };
};
