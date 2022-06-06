if (!isServer) exitWith {};

call phx_fnc_getZoneBoundary;
call phx_fnc_handleSafeMarkers;
call phx_fnc_clearVics;
call phx_fnc_serverSafety;
call phx_fnc_radio_genFreqs;
//call phx_fnc_sendUniforms;
call phx_fnc_fortifyServer;
call phx_fnc_markCustomObjs;
call phx_fnc_server_setupGame;
call phx_fnc_webhook_roundPrep;
call phx_fnc_processVehicles;

[{!(missionNamespace getVariable ["phx_safetyEnabled",true])}, {call phx_fnc_checkAlive}] call CBA_fnc_waitUntilAndExecute;
[{!isNil "phx_safetyEndTime"}, {call phx_fnc_checkTime}] call CBA_fnc_waitUntilAndExecute;

// Create respawn markers in bottom left corner of map
{
    private _marker = createMarker [_x, [-1000,-1000,0]];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "Empty";
} forEach ["respawn","respawn_west","respawn_east","respawn_guerrila","respawn_civilian"];

//Delete player bodies during safe start
phx_server_disconnectBodies = addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

  if (phx_safetyEnabled) then {
    deleteVehicle _unit;
  };
}];

//Let clients know that server is done setting up
missionNamespace setVariable ["phx_serverGameSetup",true,true];
