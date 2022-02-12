if (!hasInterface) exitWith {};


[{!isNil "ctf_flag"}, {
  ctf_flag disableCollisionWith player;
}] call CBA_fnc_waitUntilAndExecute;

fnf_clientFlagDropped = {
  [player] remoteExec ["fnf_server_dropFlag",2,false];
  [fnf_client_flagCarrierPFH] call CBA_fnc_removePerFrameHandler;
  player removeAction fnf_client_dropFlagAction;
  player setVariable ["fnf_flagUnit",false,true];
  player setAnimSpeedCoef 1;
};

fnf_flagDropAction = {
  player setVariable ["fnf_flagUnit",true,true];

  fnf_client_flagCarrierPFH = [{
    player setAnimSpeedCoef 0.75;

    if (player getVariable ["ace_isunconscious",false]) then {
      fnf_clientFlagDropped call CBA_fnc_directCall;
    };
  }, 0.1] call CBA_fnc_addPerFrameHandler;

  fnf_client_dropFlagAction = player addaction ["Drop Flag",{
    fnf_clientFlagDropped call CBA_fnc_directCall;
  },nil,1.5,false,false,"","_this == _target"];
};

if (playerSide == fnf_attackingSide) then {
  fnf_clientFlagPoleAction = [
    player,
    "Take flag",
    "",
    "",
    "player distance ctf_flagPole < 5 && !fnf_safetyEnabled && (vehicle player isEqualTo player)",
    "player distance ctf_flagPole < 5",
    {},
    {},
    {
      [player,playerSide] remoteExec ["fnf_server_flagTaken",2,false];
      call fnf_flagDropAction
    },
    {},
    [],
    3,
    0,
    true,
    false
  ] call BIS_fnc_holdActionAdd;
};


fnf_clientFlagAction = [
  player,
  "Take flag",
  "",
  "",
  "(player distance ctf_flag < 4) && (attachedTo ctf_flag isEqualTo objNull) && (isNull ctf_flagPole) && (playerSide == fnf_attackingSide || ctf_flag inArea ctf_attackTrig) && (vehicle player isEqualTo player)",
  "player distance ctf_flag < 4",
  {},
  {},
  {
    [player,playerSide] remoteExec ["fnf_server_flagTaken",2,false];
    call fnf_flagDropAction
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
  if (_threat select 0 > 0.2 && player getVariable ["fnf_flagUnit",false]) then {
    _unit action ["Eject", _vehicle];
    ["<t align='center'>You cannot board an armed vehicle while carrying the flag!</t>", "warning", 7] call fnf_ui_fnc_notify;
  };
}];
