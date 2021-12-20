//Determine if client can play the round, if not, spectate
if !(call phx_fnc_clientCanPlay) exitWith {call phx_fnc_spectatorInit};
player enableSimulation false;

phx_loadout_roles = [
  ["PL","Platoon Leader"],
  ["SGT","Platoon Sergeant"],
  ["SL","Squad Leader"],
  ["TL","Team Leader"],
  ["AR","Autorifleman"],
  ["ARA","Asst. Autorifleman"],
  ["GR","Grenadier"],
  ["GRIR","Sr. Grenadier"],
  ["MG","Machine Gunner"],
  ["MGA","Asst. Machine Gunner"],
  ["CE","Combat Engineer"],
  ["LAT","AT Rifleman"],
  ["MAT1","AT Specialist"],
  ["MATA1","Asst. AT Specialist"],
  ["MAT2","AT Specialist"],
  ["MATA2","Asst. AT Specialist"],
  ["RI","Rifleman"],
  ["RIS","Sr. Rifleman"],
  ["DM","Marksman"],
  ["SNP","Sniper"],
  ["CRL","Vehicle Cmdr"],
  ["CR","Crewman"],
  ["PI","Pilot"],
  ["MED","Medic"],
  ["SHQAUX","Crew/Wpn Operator"],
  ["BASE","Crew/Wpn Operator"]
];

call phx_fnc_hideMarkers; //Hide markers player shouldn't see
call phx_fnc_briefInit; //Briefing
call phx_fnc_clientSetupGame; //Client portion of game modes
call phx_fnc_safety; //Enable safety
call phx_fnc_staggeredLoad; //Start staggered load timer

call phx_fnc_radio_waitGear; //Start radio preset functions
call phx_fnc_contactStaffInit; // Init handling for player reports
call phx_fnc_assetDiaryInfo; // Add diary entries for assets
if (isMultiplayer) then {
	call phx_fnc_drawStaffIcons; // Draw labels over staff members
	call phx_fnc_drawCmdIcons; // Draw labels over CMD, PL
	call phx_fnc_drawSLIcons; // Draw labels over squad leaders
};
call phx_fnc_populateORBATs;
call phx_fnc_teleportInit; // Add leadership teleport options
// Admin player patch jip support
if (CBA_missionTime > 10 && floor(CBA_missionTime) < (phx_safeStartTime * 60)) then {
	// call phx_admin_fnc_jipPatch;
};

//Set player loadout after stagger time
[{missionNamespace getVariable ["phx_staggeredLoaded",false]}, {
  call phx_fnc_clientSafeStartTime;
  [player getVariable "phxLoadout"] call phx_fnc_applyCfgLoadout;
  call phx_briefing_startingLoadout;
}] call CBA_fnc_waitUntilAndExecute;
// Wait for mission to start, then execute various restrictions and make sure player has gear
[{time > 0}, {
  call phx_fnc_restrictions;
  call phx_fnc_checkLoadout;
}] call CBA_fnc_waitUntilAndExecute;
//Client-side fortify, and gear selector
[{missionNamespace getVariable ["phx_loadoutAssigned",false]}, {
  call phx_fnc_fortifyClient;
  call phx_selector_fnc_init;
  player enableSimulation true;
}] call CBA_fnc_waitUntilAndExecute;


//Start kill counter when game ends or player is dead
//[{missionNamespace getVariable ["phx_gameEnd",false] || !alive player}, {call phx_fnc_killCounter}] call CBA_fnc_waitUntilAndExecute;
//Start spectator fnc when player is killed
player addEventHandler ["Killed", {[{call phx_fnc_spectatorInit}, [], 3] call cba_fnc_waitAndExecute;}];
phx_showMissionStatusHandleMap = ["visibleMap", {call BIS_fnc_showMissionStatus}, true] call CBA_fnc_addPlayerEventHandler;


player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
  if (!isNull _instigator && (side (group _instigator) == playerSide) && (_unit != _instigator)) exitWith {
    ["TeamkillDetected", [_unit, _instigator]] call CBA_fnc_serverEvent;
  };
  if (side (group _killer) == playerSide && (_unit != _killer)) exitWith {
    ["TeamkillDetected", [_unit, _killer]] call CBA_fnc_serverEvent;
  };
}];

//Marking
[] execVM "client\icons\QS_icons.sqf";
//Unflip - by KiloSwiss (https://steamcommunity.com/sharedfiles/filedetails/?id=1383176987)
[] spawn phx_fnc_unflipVehicleAddAction;

// adds ACE Self-interact to fix uniform bug
// private _action = [
// 	"FixUniformBug",
// 	"Fix ""No Uniform"" Bug",
// 	"",
// 	{[player] call phx_fnc_fixUniformBug},
// 	{phx_safetyEnabled}
// ] call ace_interact_menu_fnc_createAction;
// [
// 	player,
// 	1,
// 	["ACE_SelfActions"],
// 	_action
// ] call ace_interact_menu_fnc_addActionToObject;


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
			(missionNamespace getVariable ["phx_lastAdminReporter", [objNull, [0,0,0]]]) params ["_player", "_pos"];
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
