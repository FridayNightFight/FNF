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

  // if not carrying the flag, disregard restriction
  if !(player getVariable ["fnf_flagUnit",false]) exitWith {};

  // check by air
  if (_vehicle isKindOf "Air") exitWith {
    _unit action ["getOut", _vehicle];
    ["<t align='center'>You cannot board an air vehicle while carrying the flag!</t>", "warning", 7] call fnf_ui_fnc_notify;
  };

  // check by threat
  // _armedVehiclesManual = ["m1165a1_gmv"];
  // if ((_threat select 0 > 0.2 || ({(typeOf _vehicle) find _x > -1} count _armedVehiclesManual) > 0)) exitWith {

  // check if primary turret exists, is not FFV, and has a weapon
  private _allTurrets = allTurrets _vehicle;
  if ((_allTurrets find [0] > -1) && count (_vehicle weaponsTurret [0]) > 0) then {
    _unit action ["getOut", _vehicle];
    ["<t align='center'>You cannot board an armed vehicle while carrying the flag!</t>", "warning", 7] call fnf_ui_fnc_notify;
  };

}];
