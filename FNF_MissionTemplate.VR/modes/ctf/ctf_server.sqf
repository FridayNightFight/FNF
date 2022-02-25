//Only run server-side
if (!isServer) exitWith {};

#include "..\..\mode_config\ctf.sqf"


fnf_firstFlag = false;
fnf_flagCaptureTime = _flagCaptureTime;
publicVariable "fnf_ctf_allowAirVehicleCarry";

ctf_flag = createVehicle ["rhs_Flag_chdkz", getPosATL ctf_flagPole, [], 0, "CAN_COLLIDE"];
publicVariable "ctf_flag";
ctf_banner = "Banner_01_F" createVehicle [0,0,0];
ctf_flag hideObjectGlobal true;
ctf_flag enableSimulation false;

{_x allowDamage false;} forEach [ctf_flag, ctf_flagPole, ctf_banner];

ctf_banner attachTo [ctf_flagPole, [0.82,-0.38,2.45]];

switch (fnf_defendingSide) do {
  case east: {ctf_banner setObjectTextureGlobal [0,"\A3\Data_F\Flags\flag_red_co.paa"]};
  case west: {ctf_banner setObjectTextureGlobal [0,"\A3\Data_F\Flags\flag_blue_co.paa"]};
  case independent: {ctf_banner setObjectTextureGlobal [0,"\A3\Data_F\Flags\flag_green_co.paa"]};
};

ctf_attackTrig setTriggerStatements ["ctf_flag inArea thisTrigger", "", "call fnf_server_flagOutZone"];

createMarker ["capZoneMark", position ctf_attackTrig];
_trigProps = triggerArea ctf_attackTrig;
"capZoneMark" setMarkerSize [_trigProps select 0, _trigProps select 1];
if (_trigProps select 3) then {
  "capZoneMark" setMarkerShape "RECTANGLE";
} else {
  "capZoneMark" setMarkerShape "ELLIPSE";
};
"capZoneMark" setMarkerDir (_trigProps select 2);

createMarker ["capZoneMarkText", position ctf_attackTrig];
"capZoneMarkText" setMarkerType "hd_dot";
"capZoneMarkText" setMarkerText "Flag Capture Zone";

//Hide capture zone if set to hidden in config and show to spectators and attackers
if !(_showCapZoneGlobal) then {
  {_x setMarkerAlpha 0} forEach ["capZoneMark","capZoneMarkText"];
};

["capZoneMark",1] remoteExec ["setMarkerAlphaLocal", [sideLogic, fnf_attackingSide], true];
["capZoneMarkText",1] remoteExec ["setMarkerAlphaLocal", [sideLogic, fnf_attackingSide], true];

switch (fnf_attackingSide) do {
  case east: {"capZoneMark" setMarkerColor "colorRed"};
  case west: {"capZoneMark" setMarkerColor "colorBlue"};
  case independent: {"capZoneMark" setMarkerColor "colorGreen"};
};

createMarker ["flagMark", position ctf_flagPole];
"flagMark" setMarkerType "hd_flag";
"flagMark" setMarkerColor "colorOrange";

[fnf_defendingSide,"ctfDefendID",[format ["Flag capture time: %1",([fnf_flagCaptureTime, "MM:SS"] call BIS_fnc_secondsToString)], "Defend The Flag"],objNull,"ASSIGNED"] call BIS_fnc_taskCreate;
[fnf_attackingSide,"ctfAttackID",[format ["Flag capture time: %1",([fnf_flagCaptureTime, "MM:SS"] call BIS_fnc_secondsToString)], "Capture The Flag"],objNull,"ASSIGNED"] call BIS_fnc_taskCreate;

[_flagMarkUpdateTime] spawn {
  params ["_updateTime"];
  while {!isNull ctf_flag} do {
    "flagMark" setMarkerPos (position ctf_flag);

    if (side (attachedTo ctf_flag) == fnf_defendingSide) then {
      sleep 1;
    } else {
      sleep _updateTime;
    };
  };
};

fnf_server_flagTaken = {
  params ["_player","_side"];

  if (!fnf_firstFlag) then {
    deleteVehicle ctf_flagPole;
    deleteVehicle ctf_banner;
    [player, fnf_clientFlagPoleAction] remoteExec ["BIS_fnc_holdActionRemove",-2,false];
    ctf_flag hideObjectGlobal false;
    "capZoneMark" setMarkerAlpha 1;
    "capZoneMarkText" setMarkerAlpha 1;
    fnf_firstFlag = true;
  };

  switch (_side) do {
    case east: {ctf_flag setFlagTexture "\A3\Data_F\Flags\flag_red_co.paa"; "flagMark" setMarkerColor "colorRed";};
    case west: {ctf_flag setFlagTexture "\A3\Data_F\Flags\flag_blue_co.paa"; "flagMark" setMarkerColor "colorBlue";};
    case independent: {ctf_flag setFlagTexture "\A3\Data_F\Flags\flag_green_co.paa"; "flagMark" setMarkerColor "colorGreen";};
  };

  ctf_flag attachTo [_player, [0,0.4,1.3], "aiming_axis"];

  if !(ctf_flag inArea ctf_attackTrig) then {
    [format ["%1 controls the flag!",
    switch (_side) do {
      case east: {"OPFOR"};
      case west: {"BLUFOR"};
      case independent: {"INDFOR"};
    }]] remoteExec ["fnf_fnc_hintThenClear"];
  };
};

fnf_server_dropFlag = {
  params ["_player"];

  if (_player getVariable ["fnf_flagUnit",false]) then {
    _player setVariable ["fnf_flagUnit",false,true];
  };

  _dummy = objNull;

  //Get new position for flag (draws a line under the flag, and the position at the first surface that the line intersects is chosen for the new flag pos)
  _posASL = (((lineIntersectsSurfaces [getPosASL ctf_flag, [(getPosASL ctf_flag) select 0, (getPosASL ctf_flag) select 1, -1000], vehicle _player]) select 0) select 0);
  _posATL = ASLtoATL _posASL; //Convert ASL to ATL for use with createVehicle

  //If flag position is under water, push it to water surface
  if (_posASL select 2 < -0.75) then {
    _posATL = [_posATL select 0, _posATL select 1, abs getTerrainHeightASL _posATL];
  };

  //Spawn dummy object and attach/detach flag to it
  if (vehicle _player != _player) then {
    _dummy = createVehicle ["Land_HelipadEmpty_F", _posATL, [], 0, "NONE"];
  } else {
    _dummy = createVehicle ["Land_HelipadEmpty_F", _posATL, [], 0, "CAN_COLLIDE"];
  };

  ctf_flag attachTo [_dummy, [0,0,1.5]];
  detach ctf_flag;
  deleteVehicle _dummy;

  ctf_flag setVectorUp [0,0,1];

  if !(ctf_flag inArea ctf_attackTrig) then {
    ctf_flag setFlagTexture "\A3\Data_F\Flags\flag_white_co.paa";
    "flagMark" setMarkerColor "colorOrange";
    ["The flag has been dropped!"] remoteExec ["fnf_fnc_hintThenClear"];
  };
};

[] spawn {
  _flagInZoneTex = false;

  while {!fnf_gameEnd} do {
    if (fnf_flagCaptureTime <= 0) then {
      fnf_gameEnd = true;
      publicVariable "fnf_gameEnd";

      deleteVehicle ctf_flag;
      deleteMarker "flagMark";

      ["ctfDefendID", "FAILED", true] call BIS_fnc_taskSetState;
      ["ctfAttackID", "SUCCEEDED", true] call BIS_fnc_taskSetState;

      [fnf_attackingSide, "has successfully captured and held the flag!"] spawn fnf_server_fnc_gameEnd;
    };

    if (fnf_flagCaptureTime > 0 && (ctf_flag inArea ctf_attackTrig) && (isNull attachedTo ctf_flag)) then {
      _timer = format ["Flag capture time remaining: %1", [fnf_flagCaptureTime,"MM:SS"] call BIS_fnc_secondsToString];
      _timer remoteExec ["hintSilent"];

      if (!_flagInZoneTex) then {
        switch (fnf_attackingSide) do {
          case east: {ctf_flag setFlagTexture "\A3\Data_F\Flags\flag_red_co.paa"};
          case west: {ctf_flag setFlagTexture "\A3\Data_F\Flags\flag_blue_co.paa"};
          case independent: {ctf_flag setFlagTexture "\A3\Data_F\Flags\flag_green_co.paa"};
        };

        _flagInZoneTex = true;
      };

      fnf_flagCaptureTime = fnf_flagCaptureTime - 1;
    } else {
      if (_flagInZoneTex) then {_flagInZoneTex = false};
    };

    //Make sure flag stays on ground/touching surface
    if (isNull attachedTo ctf_flag && ((getPos ctf_flag) select 2) > 0.6) then {
      getpos ctf_flag params ["_x","_y"];
      ctf_flag setPos ([_x,_y] findEmptyPosition [2, 100, typeOf ctf_flag]);
    };

    sleep 1;
  };
};

fnf_server_flagOutZone = {
  if (!isNull ctf_flag && !(ctf_flag inArea ctf_attackTrig)) then {
    ["The flag has left the capture zone!"] remoteExec ["fnf_fnc_hintThenClear"];
  };
};

waitUntil {!(missionNamespace getVariable ["fnf_safetyEnabled", true])};

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

  if (_unit getVariable ["fnf_flagUnit",false]) then {
    [_unit] call fnf_server_dropFlag;
    _unit setVariable ["fnf_flagUnit",false];
  };
}];

addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];

  if (_unit getVariable ["fnf_flagUnit",false]) then {
    [_unit] call fnf_server_dropFlag;
    _unit setVariable ["fnf_flagUnit",false];
  };
}];

{
  _x addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];

    if (_unit getVariable ["fnf_flagUnit",false]) then {
      ctf_flag attachTo [_vehicle, [0,0,1.3]];
    };
  }];

  _x addEventHandler ["GetOutMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];

    if (_unit getVariable ["fnf_flagUnit",false]) then {
      ctf_flag attachTo [_unit, [0,0.4,1.3], "aiming_axis"];
    };
  }];
} forEach allPlayers;
