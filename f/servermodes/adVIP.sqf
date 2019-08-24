if (!isServer) exitWith {};

defendingSide = _this select 0;
vipMarkers = _this select 1;
vipMarkersUpdateTime = _this select 2;

//Set defaults and params
if (isNil "vipMarkers") then {
  vipMarkers = true;
};
if (isNil "vipMarkersUpdateTime") then {
  vipMarkersUpdateTime = 30;
} else {
  vipMarkersUpdateTime = _this select 2;
};

if (isNil "defendingSide") then {
  systemChat "You have not configured 'varSelection.sqf' properly! You need to choose a defending side";
};
if (isNil "defendingSide") exitWith {};

if !(isNil "defendingSide") then {
  if (!(defendingSide isEqualTo west) && !(defendingSide isEqualTo east)) then {
    systemChat "You have not configured 'varSelection.sqf' properly! You need to select east or west for defending side";
  };
};

if !(isNil "vipMarkers") then {
  if (!vipMarkers) then {
    ["vip1Mark"] remoteExec ["deleteMarker",0,true];
    ["vip2Mark"] remoteExec ["deleteMarker",0,true];
  };
};

vip1Mark = "vip1Mark";
vip2Mark = "vip2Mark";

vip1KillMessage = false;
vip2KillMessage = false;

//Create tasks
switch (defendingSide) do {
  case east: {
	if (!isNil "vip1") then {
		[east,["opfvip1task"],["Protect HVT #1","Protect HVT #1",""],[vip1],"ASSIGNED",1,true,"Protect"] call BIS_fnc_taskCreate;
		[west,["bluvip1task"],["Kill HVT #1","Kill HVT #1",""],[objNull],"ASSIGNED",1,true,"Kill"] call BIS_fnc_taskCreate;
	};
	if (!isNil "vip2") then {
		[east,["opfvip2task"],["Protect HVT #2","Protect HVT #2",""],[vip2],"CREATED",1,true,"Protect"] call BIS_fnc_taskCreate;
		[west,["bluvip2task"],["Kill HVT #2","Kill HVT #2",""],[objNull],"CREATED",1,true,"Kill"] call BIS_fnc_taskCreate;
	};
  case west: {
	if (!isNil "vip1") then {
		[west,["bluvip1task"],["Protect HVT #1","Protect HVT #1",""],[vip1],"ASSIGNED",1,true,"Protect"] call BIS_fnc_taskCreate;
		[east,["opfvip1task"],["Kill HVT #1","Kill HVT #1",""],[objNull],"ASSIGNED",1,true,"Kill"] call BIS_fnc_taskCreate;
	};
	if (!isNil "vip2") then {
		[west,["bluvip2task"],["Protect HVT #2","Protect HVT #2",""],[vip2],"CREATED",1,true,"Protect"] call BIS_fnc_taskCreate;
		[east,["opfvip2task"],["Kill HVT #2","Kill HVT #2",""],[objNull],"CREATED",1,true,"Kill"] call BIS_fnc_taskCreate;
	};
  };
};
};

//Update markers
if (vipMarkers) then {
	if (!isNil "vip1") then {
		[] spawn {
			while {alive vip1} do {
				vip1Mark setMarkerPos (getPos vip1);
				sleep vipMarkersUpdateTime;
			};
		};
	};
	if (!isNil "vip2") then {
		[] spawn {
			while {alive vip2} do {
				vip2Mark setMarkerPos (getPos vip2);
				sleep vipMarkersUpdateTime;
			};
		};
	};
};

//Check end conditions
[] spawn {
  while {!gameEnd} do {
  if (!isNil "vip1") then {
	if (!alive vip1 && !vip1KillMessage) then {
      ["VIP #1 has been killed!"] remoteExec ["hint"];
      vip1KillMessage = true;
      ["vip1Mark"] remoteExec ["deleteMarker",0,true];
      if (defendingSide isEqualTo west) then {
        ["bluvip1task","FAILED"] call BIS_fnc_taskSetState;
        ["opfvip1task","SUCCEEDED"] call BIS_fnc_taskSetState;
      };
      if (defendingSide isEqualTo east) then {
        ["bluvip1task","SUCCEEDED"] call BIS_fnc_taskSetState;
        ["opfvip1task","FAILED"] call BIS_fnc_taskSetState;
      };
    };
  };
  if (!isNil "vip2") then {
	if (!alive vip2 && !vip2KillMessage) then {
      ["VIP #2 has been killed!"] remoteExec ["hint"];
      vip2KillMessage = true;
      ["vip2Mark"] remoteExec ["deleteMarker",0,true];
      if (defendingSide isEqualTo west) then {
        ["bluvip2task","FAILED"] call BIS_fnc_taskSetState;
        ["opfvip2task","SUCCEEDED"] call BIS_fnc_taskSetState;
      };
      if (defendingSide isEqualTo east) then {
        ["bluvip2task","SUCCEEDED"] call BIS_fnc_taskSetState;
        ["opfvip2task","FAILED"] call BIS_fnc_taskSetState;
      };
    };
  };
  if (!isNil "vip1" && !isNil "vip2") then {
	if (!alive vip1 && !alive vip2 && !gameEnd) then {
      if (defendingSide isEqualTo east) then {
        ["Both VIPs have been killed.\nBLUFOR wins!"] remoteExec ["hint"];
      };
      if (defendingSide isEqualTo west) then {
        ["Both VIPs have been killed.\nOPFOR wins!"] remoteExec ["hint"];
      };
      gameEnd = true;
      sleep 15;
      "end1" call bis_fnc_endMissionServer;
    };
  };
    sleep 3;
  };
};
