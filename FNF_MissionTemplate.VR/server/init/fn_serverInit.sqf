if (!isServer) exitWith {};

phx_adminChannelId = radioChannelCreate [
	[1,1,0,1], // RGBA color
	"Staff Channel", // channel name
	"[STAFF] %UNIT_SIDE %UNIT_GRP_NAME %UNIT_NAME", // callsign
  []
];
publicVariable "phx_adminChannelId";

missionNamespace setVariable [
  "TFAR_DefaultRadio_Personal_Guer",
  TFAR_DefaultRadio_Personal_Independent,
  true
];
missionNamespace setVariable [
  "TFAR_DefaultRadio_Backpack_Guer",
  TFAR_DefaultRadio_Backpack_Independent,
  true
];

call phx_fnc_serverSafety;
call phx_fnc_radio_genFreqs;
call phx_fnc_sendUniforms;
call phx_fnc_fortifyServer;
call phx_fnc_markCustomObjs;
call phx_fnc_server_setupGame;
call phx_admin_fnc_adminPatch;
call phx_fnc_webhook_roundPrep;

call phx_fnc_populateORBATs;
call phx_fnc_keyVehicles;
call phx_fnc_vehicleRadios;


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


["TeamkillDetected", {
  params ["_killed", "_killer"];

  if (isNil "DiscordEmbedBuilder_fnc_buildCfg") exitWith {diag_log text "Failed to send Teamkill webhook -- mod not loaded!"};
  // if (count allPlayers < 14) exitWith {diag_log text "Less than 14 players connected -- skipping RoundPrep Discord post"};

  [
    "BotNotifications",
    format["%1 teamkilled %2 with a %3", name _killer, name _killed, weaponState _killer select 0],
    "",
    "",
    []
	] call DiscordEmbedBuilder_fnc_buildSqf;
}] call CBA_fnc_addEventHandler;

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

// Receives event when a player submits a report
// Determines logged-in admin and sends Discord embed with contents of report and the admin @'ed
phxAdminMessageReceiver = ["phxAdminMessageServer", {
  private _arr = +_this;

  _loggedInAdmins = allPlayers select {
    (admin owner _x) isEqualTo 2 &&
    (getPlayerUID _x) in fnf_staffInfo;
  };
  private _adminDiscordID = "";
  if (count _loggedInAdmins > 0) then {
    _loggedInAdmin = fnf_staffInfo get (getPlayerUID (_loggedInAdmins # 0));
    _adminDiscordID = _loggedInAdmin # 2;
    _arr set [0, _adminDiscordID];
  };

  ["AdminMsg", _arr] call DiscordEmbedBuilder_fnc_buildCfg;
}] call CBA_fnc_addEventHandler;

//Let clients know that server is done setting up
missionNamespace setVariable ["phx_serverGameSetup",true,true];
