if (!isServer) exitWith {};

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

fnf_safeZones = [
  ["STD_WEST", [
    "west_safeZone_marker_"
  ]],
  ["STD_EAST", [
    "east_safeZone_marker_"
  ]],
  ["STD_GUER", [
    "guer_safeZone_marker_"
  ]],
  ["SA_WEST", [
    "safeZone_BLUFOR_marker",
    "rally_west_marker"
  ]],
  ["SA_EAST", [
    "safeZone_OPFOR_marker",
    "rally_east_marker"
  ]],
  ["SA_GUER", [
    "safeZone_Independent_marker",
    "rally_independent_marker"
  ]]
];
publicVariable "fnf_safeZones";

// Is this a night mission?
private _sunrise = (date call BIS_fnc_sunriseSunsetTime) select 0;
private _sunset = (date call BIS_fnc_sunriseSunsetTime) select 1;
if (fnf_isNightMission isEqualTo -1) then {
  missionNamespace setVariable ["fnf_environment_isDaytime", dayTime > _sunrise && dayTime < _sunset, true];
} else {
  missionNamespace setVariable ["fnf_environment_isDaytime", [false, true] select fnf_isNightMission, true];
};

estimatedTimeLeft (60 * (fnf_safeStartTime + fnf_missionTimeLimit));

call fnf_server_fnc_safety;
call fnf_briefing_fnc_setGroupIDs;
call fnf_server_fnc_genRadioFreqs;
call fnf_server_fnc_sendUniforms;
call fnf_server_fnc_fortifyServer;
call fnf_server_fnc_markCustomObjs;
call fnf_admin_fnc_serverCommands;

call fnf_server_fnc_setupGame;
call fnf_server_fnc_newPlayers;
call fnf_server_fnc_webhook_roundPrep;

// after custom building markers are up, recreate safe markers so they're on top and visible
[
  {
    missionNamespace getVariable ["fnf_markCustomObjs_ready", false] &&
    missionNamespace getVariable ["fnf_serverSetupGame", false]
  }, {
    private _safeMarkers = [objNull, nil, true] call fnf_fnc_inSafeZone;

    {
      if (markerShape _x != "") then {
        _x setMarkerType "mil_dot";
        _ogMark = _x call BIS_fnc_markerToString;
        deleteMarker _x;
        _ogMark call BIS_fnc_stringToMarker;
        // [{_this call BIS_fnc_stringToMarker}, _ogMark, 1] call CBA_fnc_waitAndExecute;
      };
    } forEach _safeMarkers;
    missionNamespace setVariable ["fnf_markCustomObjs_done", true, true];
}] call CBA_fnc_waitUntilAndExecute;

call fnf_server_fnc_populateORBATS;
call fnf_server_fnc_keyVehicles;
call fnf_server_fnc_vehicleRadios;

//Create map cover for zone boundary
if (!isNil "zoneTrigger") then {
  // if zoneTrigger exists, use standard functionality
  private _zoneArea = triggerArea zoneTrigger;
  zoneTrigger setVariable ["objectArea", [_zoneArea select 0, _zoneArea select 1, _zoneArea select 2]];
  [zoneTrigger,[],true] call BIS_fnc_moduleCoverMap;
} else {
  // if not, use markers
  fnf_zoneBoundary_boundsLine_marker = createMarker ["fnf_zoneBoundary_boundsLine", [0,0,0], -1];
  fnf_zoneBoundary_boundsLine_marker setMarkerShape "POLYLINE";
  fnf_zoneBoundary_boundsLine_marker setMarkerColor "ColorCIV";
  fnf_zoneBoundary_boundaryMarks = [];
  fnf_zoneBoundary_boundaryPos = [];

  for "_i" from 1 to 50 do {
    private _markerName = format["fnf_zoneBoundary_marker_%1", _i];
    if (markerShape _markerName != "") then {
      _markerName setMarkerType "mil_dot";
      _markerName setMarkerAlpha 0;
      fnf_zoneBoundary_boundaryMarks pushBack (_markerName);
      fnf_zoneBoundary_boundaryPos pushBack (markerPos _markerName);
    };
  };

  publicVariable "fnf_zoneBoundary_boundaryMarks";
  publicVariable "fnf_zoneBoundary_boundaryPos";
  publicVariable "fnf_zoneBoundary_boundsLine_marker";

  {
    _x setMarkerText "";
  } forEach fnf_zoneBoundary_boundaryMarks;

  fnf_zoneBoundary_boundsLine_points = [];
  {
    if (_forEachIndex + 1 < (count fnf_zoneBoundary_boundaryPos)) then {
      fnf_zoneBoundary_boundsLine_points append (_x select [0, 2]);
      fnf_zoneBoundary_boundsLine_points append ((fnf_zoneBoundary_boundaryPos select (_forEachIndex + 1)) select [0, 2]);
    } else {
      fnf_zoneBoundary_boundsLine_points append (_x select [0, 2]);
      fnf_zoneBoundary_boundsLine_points append ((fnf_zoneBoundary_boundaryPos select 0) select [0, 2]);
    }
  } forEach fnf_zoneBoundary_boundaryPos;
  fnf_zoneBoundary_boundsLine_marker setMarkerPolyline fnf_zoneBoundary_boundsLine_points;


  if (count fnf_zoneBoundary_boundaryMarks < 3) then {
    "[FNF] (ZoneBoundary) Warning: If not using zoneTrigger, must place at least 3 ""fnf_zoneBoundary_marker_x"" markers" remoteExecCall ["systemChat", 0, true];
  };
};

if !(fnf_gameMode == "sustainedAssault") then {
  // Create respawn markers in bottom left corner of map
  {
    private _marker = createMarker [_x, [-1000,-1000,0]];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "Empty";
  } forEach ["respawn","respawn_west","respawn_east","respawn_guerrila","respawn_civilian"];

  [{!(missionNamespace getVariable ["fnf_safetyEnabled",true])}, {call fnf_server_fnc_checkAlive}] call CBA_fnc_waitUntilAndExecute;
  [{!isNil "fnf_safetyEndTime"}, {call fnf_server_fnc_checkTime}] call CBA_fnc_waitUntilAndExecute;
};

// turn on collision lights for air vehicles if it's night
{
  if ((getLightingAt _x) select 1 <= 1500) then {
    [_x, true] remoteExecCall ["setCollisionLight", _x];
  };
} forEach (entities[["Air"], [], false, true]);

// Clear vehicle inventories
["All", "InitPost", {
  private _vic = (_this select 0);
  if (_vic isKindOf "Man") exitWith {}; //Exit so the code below doesn't run for infantry units

  if (_vic getVariable ["fnf_clearInventory", true]) then {
    clearBackpackCargoGlobal _vic;
    clearWeaponCargoGlobal _vic;
    clearItemCargoGlobal _vic;
    clearMagazineCargoGlobal _vic;
  };
}, true, ["CAManBase", "Static"], true] call CBA_fnc_addClassEventHandler;

// Disable sensors
["Air", "InitPost", {
  private _vic = (_this select 0);
  private _sensors = listVehicleSensors _vic;
  if (count _sensors > 0) then {
    _sensors = _sensors apply {if (typeName _x == "ARRAY") then {_x # 0} else {_x}};
    {_vic enableVehicleSensor [_x, false]} forEach _sensors;
  };
}, true, [], true] remoteExec ["CBA_fnc_addClassEventHandler", 0, true];


["TeamkillDetected", {
  params ["_killed", "_killer"];

  if !(isClass (configFile >> "CfgPatches" >>  "CAU_DiscordEmbedBuilder")) exitWith {diag_log text "Failed to send Teamkill webhook -- mod not loaded!"};
  if (count allPlayers < 14) exitWith {diag_log text "Less than 14 players connected -- skipping TeamKill Notification Discord post"};

  private _systemTimeFormat = ["%1-%2-%3 %4:%5:%6"];
  _systemTimeFormat append (systemTimeUTC apply {if (_x < 10) then {"0" + str _x} else {str _x}});
  private _inVehicle = "N/A";
  if (vehicle _killer != _killer) then {
    _inVehicle = getText(configFile >> "CfgVehicles" >> (typeOf (vehicle _killer)) >> "displayName");
  };

  private _killerOrgGroup = groupId (group _killer);
  if ((roleDescription _killer) find '@' > -1) then {
    _killerOrgGroup = (roleDescription _killer) splitString '@' select 1;
  };
  private _killedOrgGroup = groupId (group _killed);
  if ((roleDescription _killed) find '@' > -1) then {
    _killedOrgGroup = (roleDescription _killed) splitString '@' select 1;
  };

  [
    "BotNotifications",
    // "Testing",
    "",
    "",
    "",
    false,
    [
      [
        format["TEAMKILL [%1]",[side (group _killer)] call BIS_fnc_sideName],
        format[
          "KILLER: `%1 (%2)`
VICTIM: `%4 (%5)`
VEH: %3 | WEP: `%6` | RNG: `%7m`
ELAPSED: `%8`
UTC: `%9`
MISSION: `%10`",
          name _killer,
          // groupId (group _killer),
          _killerOrgGroup,
          format["`%1`", _inVehicle],
          name _killed,
          // groupId (group _killed),
          _killedOrgGroup,
          getText(configFile >> "CfgWeapons" >> (weaponState _killer select 0) >> "displayName"),
          str(ceil(_killer distance _killed)),
          cba_missionTime,
          format _systemTimeFormat,
          missionName
        ],
        "",
        "00FF00",
        false,
        "",
        "",
        [],
        [],
        []
      ]
    ]
	] call DiscordEmbedBuilder_fnc_buildSqf;
}] call CBA_fnc_addEventHandler;

// Staff channel
fnf_adminChannelId = radioChannelCreate [
	[1,1,0,1], // RGBA color
	"Staff Channel", // channel name
	"[STAFF] %UNIT_SIDE %UNIT_GRP_NAME %UNIT_NAME", // callsign
  allPlayers select {getPlayerUID _x in fnf_staffInfo}
];
publicVariable "fnf_adminChannelId";

addMissionEventHandler ["PlayerConnected", {
  if !(missionNamespace getVariable ["fnf_safetyEnabled", true]) exitWith {removeMissionEventHandler ["PlayerConnected", _thisEventHandler]};

  [{!isNull ((_this # 1) call BIS_fnc_getUnitByUid)}, {
    params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
    if !(missionNamespace getVariable ["fnf_safetyEnabled",true]) exitWith {};
    if (!_jip) exitWith {};
    private _unit = (_uid call BIS_fnc_getUnitByUid);
    private _sides = _unit call BIS_fnc_friendlySides select {_x != sideFriendly};
    [{
      params [["_unit", objNull], ["_sides", [sideUnknown]]];
      {
        [] remoteExec ["fnf_briefing_fnc_createOrbat", units _x];
      } forEach _sides;
    }, [_unit, _sides], 5] call CBA_fnc_waitAndExecute;
  }, _this] call CBA_fnc_waitUntilAndExecute;
}];

addMissionEventHandler ["PlayerDisconnected", {
  if !(missionNamespace getVariable ["fnf_safetyEnabled", true]) exitWith {removeMissionEventHandler ["PlayerDisconnected", _thisEventHandler]};

	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
  private _unit = (_uid call BIS_fnc_getUnitByUid);
  private _sides = _unit call BIS_fnc_friendlySides select {_x != sideFriendly};
  [{
    params [["_unit", objNull], ["_sides", [sideUnknown]]];
    {
      [] remoteExec ["fnf_briefing_fnc_createOrbat", units _x];
    } forEach _sides;
  }, [_unit, _sides], 5] call CBA_fnc_waitAndExecute;
}];

//Delete player bodies during safe start
fnf_server_disconnectBodies = addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

  if (missionNamespace getVariable ["fnf_safetyEnabled", true]) then {
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
fnfAdminMessageReceiver = ["fnfAdminMessageServer", {
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
missionNamespace setVariable ["fnf_serverGameSetup",true,true];
