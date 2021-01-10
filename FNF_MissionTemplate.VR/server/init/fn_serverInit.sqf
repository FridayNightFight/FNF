if (!isServer) exitWith {};

call phx_fnc_serverSafety;
call phx_fnc_radio_genFreqs;
call phx_fnc_sendUniforms;
call phx_fnc_fortifyServer;
call phx_fnc_server_setupGame;
call phx_fnc_checkTime;

[{!(missionNamespace getVariable ["phx_safetyEnabled",true])}, {call phx_fnc_checkAlive}] call CBA_fnc_waitUntilAndExecute;

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

//Clear vic inventory
{
  if (((_x call BIS_fnc_objectType) select 0) isEqualTo "Vehicle") then {
    clearWeaponCargoGlobal _x;
    clearMagazineCargoGlobal _x;
  };
} forEach vehicles;

//Delete player bodies during safe start
phx_server_disconnectBodies = addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

  if (phx_safetyEnabled) then {
    deleteVehicle _unit;
  };
}];

//Let clients know that server is done setting up
missionNamespace setVariable ["phx_serverGameSetup",true,true];
