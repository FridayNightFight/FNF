if (!hasInterface) exitWith {};

ctf_flag disableCollisionWith player;

phx_flagDropAction = {
  player setVariable ["phx_flagUnit",true,true];

  phx_client_flagCarrierPFH = [{
    if (player getVariable ["ace_isunconscious",false]) then {
      [player] remoteExec ["phx_server_dropFlag",2,false];
      player removeAction phx_client_dropFlagAction;
      player setVariable ["phx_flagUnit",false,true];
      [_handle] call CBA_fnc_removePerFrameHandler;
    };
  }, 0.1] call CBA_fnc_addPerFrameHandler;

  phx_client_dropFlagAction = player addaction ["Drop Flag",{
    [player] remoteExec ["phx_server_dropFlag",2,false];
    player removeAction phx_client_dropFlagAction;
    player setVariable ["phx_flagUnit",false,true];
    [phx_client_flagCarrierPFH] call CBA_fnc_removePerFrameHandler;
  },nil,1.5,false,false,"","_this == _target"];
};

if (playerSide == phx_attackingSide) then {
  phx_clientFlagPoleAction = [
    player,
    "Take flag",
    "",
    "",
    "player distance ctf_flagPole < 5",
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
  "(player distance ctf_flag < 3.5) && (attachedTo ctf_flag isEqualTo objNull) && (isNull ctf_flagPole) && (playerSide == phx_attackingSide)",
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
