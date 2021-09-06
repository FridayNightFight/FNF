if (!hasInterface) exitWith {};

ctf_flag disableCollisionWith player;

phx_clientFlagDropped = {
  [player] remoteExec ["phx_server_dropFlag",2,false];
  [phx_client_flagCarrierPFH] call CBA_fnc_removePerFrameHandler;
  player removeAction phx_client_dropFlagAction;
  player setVariable ["phx_flagUnit",false,true];
  player setAnimSpeedCoef 1;
};

phx_flagDropAction = {
  player setVariable ["phx_flagUnit",true,true];

  phx_client_flagCarrierPFH = [{
    player setAnimSpeedCoef 0.75;

    if (player getVariable ["ace_isunconscious",false]) then {
      phx_clientFlagDropped call CBA_fnc_directCall;
    };
  }, 0.1] call CBA_fnc_addPerFrameHandler;

  phx_client_dropFlagAction = player addaction ["Drop Flag",{
    phx_clientFlagDropped call CBA_fnc_directCall;
  },nil,1.5,false,false,"","_this == _target"];
};

if (playerSide == phx_attackingSide) then {
  phx_clientFlagPoleAction = [
    player,
    "Take flag",
    "",
    "",
    "player distance ctf_flagPole < 5 && !phx_safetyEnabled",
    "player distance ctf_flagPole < 5",
    {},
    {},
    {
      [player,playerSide] remoteExec ["phx_server_flagTaken",2,false];
      call phx_flagDropAction
    },
    {},
    [],
    3,
    0,
    true,
    false
  ] call BIS_fnc_holdActionAdd;
};

private _attackSpawnMark = switch (phx_attackingSide) do {
  case east: {"opforSafeMarker"};
  case west: {"bluforSafeMarker"};
  case independent: {"indforSafeMarker"};
};

if (playerside == phx_attackingSide || ctf_flagPole inArea _attackSpawnMark) then {
  "capZoneMark" setMarkerAlphaLocal 1;
  "capZoneMarkText" setMarkerAlphaLocal 1;
} else {
  "capZoneMark" setMarkerAlphaLocal 0;
  "capZoneMarkText" setMarkerAlphaLocal 0;
};

phx_clientFlagAction = [
  player,
  "Take flag",
  "",
  "",
  "(player distance ctf_flag < 3.5) && (attachedTo ctf_flag isEqualTo objNull) && (isNull ctf_flagPole) && (playerSide == phx_attackingSide || ctf_flag inArea ctf_attackTrig)",
  "player distance ctf_flag < 3.5",
  {},
  {},
  {
    [player,playerSide] remoteExec ["phx_server_flagTaken",2,false];
    call phx_flagDropAction
  },
  {},
  [],
  1,
  0,
  false,
  false
] call BIS_fnc_holdActionAdd;
