/* ----------------------------------------------------------------------------
Function: phx_fnc_serverJIP
Description:
    Sets a publicVariable with the current mission state. False for still in briefing, true for in game world.
---------------------------------------------------------------------------- */
if (!isServer) exitWith {};

phx_hasGameStarted = false;
publicVariable "phx_hasGameStarted";

// Add PFH that checks for game start
[{
    params ["_args","_handle"];
    
    if (isNil "f_var_mission_timer") exitWith {};
    if (isNil "CBA_missionTime") exitWith {};
    
    private _safestartTime = ["f_param_mission_timer",10] call BIS_fnc_getParamValue;
    _safestartTime = _safestartTime * 60;
    if (f_var_mission_timer <= 0 && {(CBA_missionTime > 0)}) then {
        phx_hasGameStarted = true;
        publicVariable "phx_hasGameStarted";
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;

// ====================================================================================================
// Add EH for deleting disconnected player's bodies during safestart
addMissionEventHandler ["HandleDisconnect",{
    params ["_unit","_id","_uid","_name"];

    if (!isNil "f_var_mission_timer" && {f_var_mission_timer >= 0}) then {
        deleteVehicle _unit;
    };
}];

// Add EH for JIP player connect
"phx_JIP_playerConnected" addPublicVariableEventHandler {
	params ["_varName", "_jipPlayer"];
    
    phx_JIP_latestJIPplayer = _jipPlayer;
    if (isNil "phx_spect_spectatorList") then {phx_spect_spectatorList = [];};
    [{
        [phx_JIP_latestJIPplayer, phx_spect_spectatorList] remoteExec ["phx_fnc_disableCJIP",0];
    }] call CBA_fnc_execNextFrame;
};

// Add EH for spectator list
"phx_spectatorPV" addPublicVariableEventHandler {
	params ["_varName", "_spectator"];
    
    if (isNil "phx_spect_spectatorList") then {phx_spect_spectatorList = [];};
    phx_spect_spectatorList pushBack _spectator;
};
phx_spect_serverPVEHAdded = true;
publicVariable "phx_spect_serverPVEHAdded";
