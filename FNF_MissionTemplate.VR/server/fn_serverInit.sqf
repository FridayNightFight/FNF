if (!isServer) exitWith {};

call phx_fnc_serverSafety;
call phx_fnc_markCustomObjs;

phx_blueTeamScore = 0;
phx_redTeamScore = 0;

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

//Delete player bodies during safe start
phx_server_disconnectBodies = addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

  if (phx_safetyEnabled) then {
    deleteVehicle _unit;
  };
}];

[{!isNil "phx_safetyEndTime"}, {call phx_fnc_checkTime}] call CBA_fnc_waitUntilAndExecute;

call PHX_fnc_terminalServerSetup;
