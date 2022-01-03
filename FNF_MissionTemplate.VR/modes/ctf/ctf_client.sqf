if (!hasInterface) exitWith {};


[{!isNil "ctf_flag"}, {
  ctf_flag disableCollisionWith player;
}] call CBA_fnc_waitUntilAndExecute;

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
    "player distance ctf_flagPole < 5 && !phx_safetyEnabled && (vehicle player isEqualTo player)",
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

phx_clientFlagAction = [
  player,
  "Take flag",
  "",
  "",
  "(player distance ctf_flag < 4) && (attachedTo ctf_flag isEqualTo objNull) && (isNull ctf_flagPole) && (playerSide == phx_attackingSide || ctf_flag inArea ctf_attackTrig) && (vehicle player isEqualTo player)",
  "player distance ctf_flag < 4",
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


CTFNoArmedVehicles = player addEventHandler ["GetInMan", {
  params ["_unit", "_role", "_vehicle", "_turret"];
  private _thisConfig = (configFile >> "CfgVehicles" >> (typeOf _vehicle));
  private _threat = [_thisConfig, "threat"] call BIS_fnc_returnConfigEntry;
  if (_threat select 0 > 0.2 && player getVariable ["phx_flagUnit",false]) then {
    _unit action ["Eject", _vehicle];
    ["<t align='center'>You cannot board an armed vehicle while carrying the flag!</t>", "warning", 7] call phx_ui_fnc_notify;
  };
}];
