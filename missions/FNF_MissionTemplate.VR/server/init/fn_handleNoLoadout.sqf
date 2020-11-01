/*Make sure players have lodout assigned after 60 seconds, if not, kick player*/

phx_server_noLoadout = [];

phx_server_clientLoaded = {
  _uid = _this select 0;
  phx_server_noLoadout deleteAt (phx_server_noLoadout findIf {(_x select 0) == _uid});
};

phx_server_loadout_connectedEH = addMissionEventHandler ["PlayerConnected", {
  params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

  if (isNil "CBA_missionTime") then {CBA_missionTime = 0;};
  if (_owner != 2) then {
    phx_server_noLoadout pushBack [_uid, CBA_missionTime + 60];
  };
}];

phx_server_loadout_disconnectedEH = addMissionEventHandler ["PlayerDisconnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

  phx_server_noLoadout deleteAt (phx_server_noLoadout findIf {(_x select 0) == _uid});
}];

waitUntil {(missionNamespace getVariable ["phx_safetyEnabled",false]) && (CBA_missionTime > 1)};
sleep 1;

phx_server_commandPass = "";
if (isDedicated) then {
  phx_server_commandPass = call compile preprocessFileLineNumbers "\userconfig\pass.hpp";
};

[{
  if (!phx_safetyEnabled) exitWith {
    [_handle] call CBA_fnc_removePerFrameHandler;
    removeMissionEventHandler ["PlayerConnected", phx_server_loadout_connectedEH];
    removeMissionEventHandler ["PlayerDisconnected", phx_server_loadout_disconnectedEH];
    phx_server_noLoadout = [];
  };


  {
    _uid = _x select 0;
    _time = _x select 1;

    if (_time < CBA_missionTime) then {
      phx_server_commandPass serverCommand format ["#kick %1", _uid];
      phx_server_noLoadout deleteAt _forEachIndex;
    };
  } forEach phx_server_noLoadout;
},[], 3] call CBA_fnc_addPerFrameHandler;
