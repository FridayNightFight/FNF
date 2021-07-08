//Only run server-side
if (!isServer) exitWith {};

#include "..\..\mode_config\ctf.sqf"

phx_firstFlag = false;
phx_flagCaptureTime = _flagCaptureTime;

ctf_flag = createVehicle ["rhs_Flag_chdkz", getPosATL ctf_flagPole, [], 0, "CAN_COLLIDE"];
publicVariable "ctf_flag";
ctf_banner = "Banner_01_F" createVehicle [0,0,0];
ctf_flag hideObjectGlobal true;
ctf_flag enableSimulation false;

{_x allowDamage false;} forEach [ctf_flag, ctf_flagPole, ctf_banner];

ctf_banner attachTo [ctf_flagPole, [0.82,-0.38,2.45]];

switch (phx_defendingSide) do {
  case east: {ctf_banner setObjectTextureGlobal [0,"\A3\Data_F\Flags\flag_red_co.paa"]};
  case west: {ctf_banner setObjectTextureGlobal [0,"\A3\Data_F\Flags\flag_blue_co.paa"]};
  case independent: {ctf_banner setObjectTextureGlobal [0,"\A3\Data_F\Flags\flag_green_co.paa"]};
};

ctf_attackTrig setTriggerStatements ["ctf_flag inArea thisTrigger", "", "call phx_server_flagOutZone"];

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

"capZoneMark" setMarkerAlpha 0;
"capZoneMarkText" setMarkerAlpha 0;

//Show flag zone to spectators and attackers
["capZoneMark",1] remoteExec ["setMarkerAlphaLocal", [sideLogic, phx_attackingSide], true];
["capZoneMarkText",1] remoteExec ["setMarkerAlphaLocal", [sideLogic, phx_attackingSide], true];

switch (phx_attackingSide) do {
  case east: {"capZoneMark" setMarkerColor "colorRed"};
  case west: {"capZoneMark" setMarkerColor "colorBlue"};
  case independent: {"capZoneMark" setMarkerColor "colorGreen"};
};

createMarker ["flagMark", position ctf_flagPole];
"flagMark" setMarkerType "hd_flag";
"flagMark" setMarkerColor "colorOrange";

[phx_defendingSide,"ctfDefendID",[format ["Flag capture time: %1",([phx_flagCaptureTime, "MM:SS"] call BIS_fnc_secondsToString)], "Defend The Flag"],objNull,"ASSIGNED"] call BIS_fnc_taskCreate;
[phx_attackingSide,"ctfAttackID",[format ["Flag capture time: %1",([phx_flagCaptureTime, "MM:SS"] call BIS_fnc_secondsToString)], "Capture The Flag"],objNull,"ASSIGNED"] call BIS_fnc_taskCreate;

[_flagMarkUpdateTime] spawn {
  params ["_updateTime"];
  while {!isNull ctf_flag} do {
    "flagMark" setMarkerPos (position ctf_flag);
    sleep _updateTime;
  };
};

phx_server_flagTaken = {
  params ["_player","_side"];

  if (!phx_firstFlag) then {
    deleteVehicle ctf_flagPole;
    deleteVehicle ctf_banner;
    [player, phx_clientFlagPoleAction] remoteExec ["BIS_fnc_holdActionRemove",-2,false];
    ctf_flag hideObjectGlobal false;
    "capZoneMark" setMarkerAlpha 1;
    "capZoneMarkText" setMarkerAlpha 1;
    phx_firstFlag = true;
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
    }]] remoteExec ["phx_fnc_hintThenClear"];
  };
};

phx_server_dropFlag = {
  params ["_player"];

  if (_player getVariable ["phx_flagUnit",false]) then {
    _player setVariable ["phx_flagUnit",false,true];
  };

  _dummy = objNull;

  _pos = ASLtoATL (((lineIntersectsSurfaces [getPosASL ctf_flag, [(getPosASL ctf_flag) select 0,(getPosASL ctf_flag) select 1,-200], vehicle _player]) select 0) select 0);

  if (surfaceIsWater _pos) then {
    _pos = [_pos select 0, _pos select 1, abs getTerrainHeightASL _pos];
  };

  if (vehicle _player != _player) then {
    _dummy = createVehicle ["Land_HelipadEmpty_F", _pos, [], 0, "NONE"];
  } else {
    _dummy = createVehicle ["Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE"];
  };

  ctf_flag attachTo [_dummy, [0,0,1.5]];
  detach ctf_flag;
  deleteVehicle _dummy;

  if !(ctf_flag inArea ctf_attackTrig) then {
    ctf_flag setFlagTexture "\A3\Data_F\Flags\flag_white_co.paa";
    "flagMark" setMarkerColor "colorOrange";
    ["The flag has been dropped!"] remoteExec ["phx_fnc_hintThenClear"];
  };
};

[] spawn {
  _flagInZoneTex = false;

  while {!phx_gameEnd} do {
    if (phx_flagCaptureTime <= 0) then {
      phx_gameEnd = true;
      publicVariable "phx_gameEnd";

      deleteVehicle ctf_flag;
      deleteMarker "flagMark";

      ["ctfDefendID", "FAILED", true] call BIS_fnc_taskSetState;
      ["ctfAttackID", "SUCCEEDED", true] call BIS_fnc_taskSetState;

      [phx_attackingSide, "has successfully captured and held the flag!"] spawn phx_fnc_gameEnd;
    };

    if (phx_flagCaptureTime > 0 && (ctf_flag inArea ctf_attackTrig) && (isNull attachedTo ctf_flag)) then {
      _timer = format ["Flag capture time remaining: %1", [phx_flagCaptureTime,"MM:SS"] call BIS_fnc_secondsToString];
      _timer remoteExec ["hintSilent"];

      if (!_flagInZoneTex) then {
        switch (phx_attackingSide) do {
          case east: {ctf_flag setFlagTexture "\A3\Data_F\Flags\flag_red_co.paa"};
          case west: {ctf_flag setFlagTexture "\A3\Data_F\Flags\flag_blue_co.paa"};
          case independent: {ctf_flag setFlagTexture "\A3\Data_F\Flags\flag_green_co.paa"};
        };

        _flagInZoneTex = true;
      };

      phx_flagCaptureTime = phx_flagCaptureTime - 1;
    } else {
      if (_flagInZoneTex) then {_flagInZoneTex = false};
    };

    sleep 1;
  };
};

phx_server_flagOutZone = {
  if (!isNull ctf_flag && !(ctf_flag inArea ctf_attackTrig)) then {
    ["The flag has left the capture zone!"] remoteExec ["phx_fnc_hintThenClear"];
  };
};

waitUntil {!phx_safetyEnabled};

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

  if (_unit getVariable ["phx_flagUnit",false]) then {
    [_unit] call phx_server_dropFlag;
    _unit setVariable ["phx_flagUnit",false];
  };
}];

addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];

  if (_unit getVariable ["phx_flagUnit",false]) then {
    [_unit] call phx_server_dropFlag;
    _unit setVariable ["phx_flagUnit",false];
  };
}];

{
  _x addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];

    if (_unit getVariable ["phx_flagUnit",false]) then {
      ctf_flag attachTo [_vehicle, [0,0,1.3]];
    };
  }];

  _x addEventHandler ["GetOutMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];

    if (_unit getVariable ["phx_flagUnit",false]) then {
      ctf_flag attachTo [_unit, [0,0.4,1.3], "aiming_axis"];
    };
  }];
} forEach allPlayers;
