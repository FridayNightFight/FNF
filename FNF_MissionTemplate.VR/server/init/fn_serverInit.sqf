if (!isServer) exitWith {};

call phx_fnc_serverSafety;
call phx_fnc_radio_genFreqs;
call phx_fnc_sendUniforms;
call phx_fnc_fortifyServer;
call phx_fnc_markCustomObjs;
call phx_fnc_server_setupGame;
[] spawn phx_fnc_webhook_roundPrep;

call phx_fnc_populateORBATs;

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

//Clear vehicle inventories
["AllVehicles", "init", {
  private _vic = (_this select 0);
  if (_vic isKindOf "Man") exitWith {}; //Exit so the code below doesn't run for infantry units

  if (_vic getVariable ["fnf_clearInventory", true]) then {
    clearBackpackCargoGlobal _vic;
    clearWeaponCargoGlobal _vic;
    clearItemCargoGlobal _vic;
    clearMagazineCargoGlobal _vic;
  };
}, true, [], true] call CBA_fnc_addClassEventHandler;

//Delete player bodies during safe start
phx_server_disconnectBodies = addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

  if (phx_safetyEnabled) then {
    deleteVehicle _unit;
  } else {
    //Not needed with ace_respawn_removeDeadBodiesDisconnected = false
    //After safety ends, keep player bodies by transfering ownership of the unit to the server and then killing it
    //[{owner (_this select 0) == 2}, {(_this select 0) setDamage 1;}, [_unit], 15] call CBA_fnc_waitUntilAndExecute;
    //true;
  };
}];

//Let clients know that server is done setting up
missionNamespace setVariable ["phx_serverGameSetup",true,true];
