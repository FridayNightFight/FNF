if (!isServer) exitWith {};

call phx_fnc_serverSafety;
call phx_fnc_radio_genFreqs;
call phx_fnc_sendUniforms;
call phx_fnc_fortifyServer;
call phx_fnc_markCustomObjs;
call phx_fnc_server_setupGame;

[{!(missionNamespace getVariable ["phx_safetyEnabled",true])}, {call phx_fnc_checkAlive}] call CBA_fnc_waitUntilAndExecute;
[{!isNil "phx_safetyEndTime"}, {call phx_fnc_checkTime}] call CBA_fnc_waitUntilAndExecute;

//Create map cover for zone boundary
private _zoneArea = triggerArea zoneTrigger;
zoneTrigger setVariable ["objectArea", [_zoneArea select 0, _zoneArea select 1, _zoneArea select 2]];
[zoneTrigger,[],true] call BIS_fnc_moduleCoverMap;

// Create respawn markers in bottom left corner of map
{
    private _marker = createMarker [_x, [-1000,-1000,0]];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "Empty";
} forEach ["respawn","respawn_west","respawn_east","respawn_guerrila","respawn_civilian"];

// Add editable objects to curator
addZeusEditable = [{
  if (!phx_safetyEnabled) then {[_handle] call CBA_fnc_removePerFrameHandler};
  {
    _x addCuratorEditableObjects
    [
      entities[[],
        ["Logic"],
        true /*Include vehicle crew*/,
        true /*Exclude dead bodies*/
        ],
      true
    ];
  } forEach allCurators;
}, 180] call CBA_fnc_addPerFrameHandler;

//Delete player bodies during safe start
phx_server_disconnectBodies = addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

  if (phx_safetyEnabled) then {
    deleteVehicle _unit;
  };
}];

//Let clients know that server is done setting up
missionNamespace setVariable ["phx_serverGameSetup",true,true];
