call phx_fnc_radio_genFreqs;

call phx_fnc_server_setupGame;

true spawn phx_fnc_serverSafety;

call phx_fnc_fortifyServer;

//Set maximum client view distance
setViewDistance 3000;

//Run checks to see if side is eliminated
[] spawn phx_fnc_checkAlive;

//Check mission run-time
[] spawn phx_fnc_checkTime;

// Create respawn markers in bottom left corner of map
{
    private _marker = createMarker [_x, [-1000,-1000,0]];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "Empty";
} forEach ["respawn", "respawn_west","respawn_east","respawn_guerrila","respawn_civilian"];
