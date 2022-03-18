fnf_loadout_roles = [
  ["PL",["Platoon Leader","LIEUTENANT"]],
  ["SGT",["Platoon Sergeant","SERGEANT"]],
  ["SL",["Squad Leader","SERGEANT"]],
  ["TL",["Team Leader","CORPORAL"]],
  ["AR",["Autorifleman","PRIVATE"]],
  ["ARA",["Asst. Autorifleman","PRIVATE"]],
  ["GR",["Grenadier","PRIVATE"]],
  ["GRIR",["Sr. Grenadier","CORPORAL"]],
  ["MG",["Machine Gunner","PRIVATE"]],
  ["MGA",["Asst. Machine Gunner","PRIVATE"]],
  ["CE",["Combat Engineer","PRIVATE"]],
  ["LAT",["AT Rifleman","PRIVATE"]],
  ["MAT1",["AT Specialist","PRIVATE"]],
  ["MATA1",["Asst. AT Specialist","PRIVATE"]],
  ["MAT2",["AT Specialist","PRIVATE"]],
  ["MATA2",["Asst. AT Specialist","PRIVATE"]],
  ["RI",["Rifleman","PRIVATE"]],
  ["RIS",["Sr. Rifleman","CORPORAL"]],
  ["DM",["Marksman","PRIVATE"]],
  ["SNP",["Sniper","CORPORAL"]],
  ["CRL",["Vehicle Cmdr","SERGEANT"]],
  ["CR",["Crewman","CORPORAL"]],
  ["PI",["Pilot","LIEUTENANT"]],
  ["MED",["Medic","CORPORAL"]],
  ["SHQAUX",["Crew/Wpn Operator","PRIVATE"]],
  ["BASE",["Crew/Wpn Operator","PRIVATE"]]
];

player linkItem "ItemMap";

//Determine if client can play the round, if not, spectate
if !(call fnf_client_fnc_canplay) exitWith {
  diag_log formatText [
    "[FNF] (clientInit) typeOf ""%1"" player %2 was placed in spectator at join. Safestart %3",
    typeOf player,
    name player,
    (if (missionNamespace getVariable ["fnf_safetyEnabled", true]) then {"is active"} else {"is not active"})
  ];
  call fnf_fnc_contactStaffInit; // Init handling for player reports
  call fnf_briefing_fnc_createBriefSpec; // Set up briefing for UI panel
  call fnf_briefing_fnc_assetDiaryStruct; // Add diary entries for assets
  call fnf_spectator_fnc_init;
};
player enableSimulation false;

call fnf_client_fnc_setupGame; //Client portion of game modes
[{missionNamespace getVariable ["fnf_markCustomObjs_done", false]}, {
  call fnf_restrictions_fnc_hideMarkers; //Hide markers player shouldn't see
  call fnf_briefing_fnc_init; //Briefing
  call fnf_briefing_fnc_createBriefSpec; // Set up briefing for UI panel
  call fnf_briefing_fnc_assetDiary; // Add diary entries for assets
}] call CBA_fnc_waitUntilAndExecute;
call fnf_safety_fnc_init; //Enable safety
call fnf_client_fnc_staggeredLoad; //Start staggered load timer
call fnf_radio_fnc_waitGear; //Start radio preset functions
call fnf_fnc_contactStaffInit; // Init handling for player reports

[{missionNamespace getVariable ["fnf_briefCreated", false]}, {
  call fnf_briefing_fnc_assetDiaryStruct; // Prep global vars for UI info panel
}] call CBA_fnc_waitUntilAndExecute;

call fnf_ui_fnc_drawStaffIcons; // Draw labels over staff members
call fnf_ui_fnc_drawCmdIcons; // Draw labels over CMD, PL
call fnf_ui_fnc_drawSLIcons; // Draw labels over squad leaders

call fnf_server_fnc_populateORBATS;
call fnf_fnc_teleportInit; // Add leadership teleport options
[] spawn fnf_briefing_fnc_setupTablesClient;


if (fnf_gameMode != "sustainedAssault") then {
  [{missionNamespace getVariable ["fnf_serverSetupGame", false]}, {
    // Add teleport option to flagpole between safezones in Standard
    // must wait until global vars initialized by server
    call fnf_client_fnc_teleportActions_STD;
  }] call CBA_fnc_waitUntilAndExecute;
} else {
  call fnf_client_fnc_teleportActions_SA; // Add MSP teleport option to flagpole if sustainedAssault
};

//Set player loadout after stagger time
[{missionNamespace getVariable ["fnf_staggeredLoaded",false] && !(call BIS_fnc_isLoading)}, {
  call fnf_fnc_showTimeOnMap;
  [player getVariable "fnfLoadout"] call fnf_loadout_fnc_applyLoadout;
}] call CBA_fnc_waitUntilAndExecute;

// at end of staggered load, check the player's limited FNF play count & notify server if they're new
[{missionNamespace getVariable ["fnf_staggeredLoaded",false] && time > 0 && !(call BIS_fnc_isLoading)}, {
  private _timesPlayed = profileNamespace getVariable ["fnf_isNewPlayer", 0];
  if (_timesPlayed >= 0 && _timesPlayed <= 3) then {
    ["FNF_NewPlayers_AddToGroup", [group player, player, _timesPlayed]] call CBA_fnc_serverEvent;
    profileNamespace setVariable ["fnf_isNewPlayer", _timesPlayed + 1];
  };
}] call CBA_fnc_waitUntilAndExecute;

// Wait for mission to start, then execute various restrictions and make sure player has gear
[{time > 0}, {
  call fnf_restrictions_fnc_init;
  call fnf_loadout_fnc_checkLoadout;
  [false] call fnf_briefing_fnc_parseGear;

  ["init"] call fnf_ui_fnc_drawHelpers;

  // disable ambient life
  [] spawn {sleep 0.1; enableEnvironment [false, true]};

  // disable raycast CPU processing of visibility between entities, not needed in all-PvP
  [] spawn {sleep 0.1; disableRemoteSensors true};


  // show tiled panel with mission context
  // Compile Date text
  date params ["_year", "_month", "_day", "_hour", "_minute"];

  if (_month < 10) then {_month = format ["0%1", _month]};
  if (_day < 10) then {_day = format ["0%1", _day]};
  if (_hour < 10) then {_hour = format ["0%1", _hour]};
  if (_minute < 10) then {_minute = format ["0%1", _minute]};

  private ["_time", "_date"];
  _time = format ["%1:%2", _hour, _minute];
  _date = format ["%1-%2-%3", _year, _month, _day];

  private _locationTypes = [
    "NameCity",
    "NameCityCapital",
    "NameLocal",
    "NameMarine",
    "NameVillage"
  ];
  private _locationText = "In the middle of nowhere";
  private _locations = nearestLocations [player, _locationTypes, 2000, player];
  if (count _locations > 0) then {
    _locationText = format["Near %1", text (_locations select 0)];
  };

  private _showText = composeText [
    "Welcome to ", serverName, lineBreak,
    briefingName, lineBreak,
    _date, " ", _time, " ", _locationText, lineBreak,
    "Game mode: ", (toUpper fnf_gameMode), lineBreak
  ];

  [
    _showText, // content
    true, // position
    10, // tileSize
    10, // duration
    1 // fadeInOutTime
  ] spawn BIS_fnc_textTiles;
}] call CBA_fnc_waitUntilAndExecute;

//Client-side fortify, and gear selector
[{missionNamespace getVariable ["fnf_loadoutAssigned",false]}, {
  if !(fnf_gameMode == "sustainedAssault") then {
    call fnf_fnc_fortifyClient;
  };
  player enableSimulation true;
}] call CBA_fnc_waitUntilAndExecute;


fnf_showMissionStatusHandleMap = ["visibleMap", {call BIS_fnc_showMissionStatus}, true] call CBA_fnc_addPlayerEventHandler;
player addEventHandler ["Respawn", {_this call fnf_fnc_handleRespawn}];
// disable rating adjustments
player addEventHandler ["HandleRating", {0}];

if !(fnf_gameMode == "sustainedAssault") then {
  //Start kill counter when game ends or player is dead
  //[{missionNamespace getVariable ["fnf_gameEnd",false] || !alive player}, {call fnf_fnc_killCounter}] call CBA_fnc_waitUntilAndExecute;
  //Start spectator fnc when player is killed
  player addEventHandler ["Killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    {[_unit, _x] call CBA_fnc_dropWeapon} forEach [primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit];
    [{call fnf_spectator_fnc_init}, [], 3] call cba_fnc_waitAndExecute;
  }];


  player addEventHandler ["Killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    if (!isNull _instigator && (side (group _instigator) == playerSide) && (_unit != _instigator)) exitWith {
      ["TeamkillDetected", [_unit, _instigator]] call CBA_fnc_serverEvent;
    };
    if (side (group _killer) == playerSide && (_unit != _killer)) exitWith {
      ["TeamkillDetected", [_unit, _killer]] call CBA_fnc_serverEvent;
    };
  }];
} else {
  player setVariable ["ACE_canMoveRallypoint", false, true];
};

if (getPlayerUID player in (missionNamespace getVariable ["fnf_staffInfo",[]]) || serverCommandAvailable "#kick") then {
  ["FNF_UIPanelAdmin_ReturnStatus", {
    [
      format [
        "<t align='center' size='1.4' color='#FFFF00'>ADMIN ACTION</t><br/>%1",
        _this
      ],
      "warning",
      10
    ] call fnf_ui_fnc_notify;

    if (isNil "fnf_adminDisplay") exitWith {};
    private _display = (fnf_adminDisplay select 0);
    private "_resultBox";
    if (_display == displayNull) exitWith {
      // [_thisType, _thisId] call CBA_fnc_removeEventHandler;
    };

    _resultBox = _display displayCtrl 10020;
    _resultBox ctrlSetStructuredText (parseText _this);
  }] call CBA_fnc_addEventHandlerArgs;
};

//Marking
[] execVM "client\icons\QS_icons.sqf";
//Unflip - by KiloSwiss (https://steamcommunity.com/sharedfiles/filedetails/?id=1383176987)
[] spawn fnf_fnc_unflipVehicleAddAction;

// adds ACE Self-interact to fix uniform bug
private _action = [
  "FixUniformBug",
  "Fix ""No Uniform"" Bug",
  "",
  {[player] call fnf_fnc_fixUniformBug},
  {true}
] call ace_interact_menu_fnc_createAction;
[
  player,
  1,
  ["ACE_SelfActions"],
  _action
] call ace_interact_menu_fnc_addActionToObject;


// remove ACE SOG Compat digging additions of small trench and spiderholes that doesn't require ETool
// remove ETool-less trench from all
// remove spiderholes from non-NVA loadouts
[{!isNil "mySideGearSelection" && !is3DEN}, {
  if (isClass ((configOf player) >> "ACE_SelfActions" >> "ACE_Equipment" >> "ace_compat_sog_digSpiderhole")) then {
    if !(["NVA", mySideGearSelection] call BIS_fnc_inString) then {
      [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment", "ace_compat_sog_digSpiderhole"]] call ace_interact_menu_fnc_removeActionFromClass;
      [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment", "ace_compat_sog_digSpiderholeAngled"]] call ace_interact_menu_fnc_removeActionFromClass;
      [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment", "ace_compat_sog_digSpiderholeDual"]] call ace_interact_menu_fnc_removeActionFromClass;
    };
    [(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment", "ace_trenches_digEnvelopeSmall"]] call ace_interact_menu_fnc_removeActionFromClass;
  };
}, [], 5] call CBA_fnc_waitUntilAndExecute;

// Zeus actions
_action = [
  "Zeus_GoToLastReport",
  "Zoom to Last Admin Report",
  "\A3\ui_f\data\igui\cfg\simpleTasks\types\heal_ca.paa",
  {
    [] spawn {
      (missionNamespace getVariable ["fnf_lastAdminReporter", [objNull, [0,0,0]]]) params ["_player", "_pos"];
      if (!isNull _player && !(_player in ([] call ace_spectator_fnc_players))) then {
        [
          ((_player getPos [50, 180]) vectorAdd [0,0,30]),
          _player,
          true
        ] spawn BIS_fnc_setCuratorCamera;
      } else {
        if (_pos isEqualTo [0,0,0]) exitWith {
          ["Last Player Report", "Player/location not saved. Have any reports been sent?", 5] call BIS_fnc_curatorHint;
        };
        [
          ((_pos getPos [50, 180]) vectorAdd [0,0,30]),
          _pos,
          true
        ] spawn BIS_fnc_setCuratorCamera;
      };
    };
  },
  {true}
] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;
