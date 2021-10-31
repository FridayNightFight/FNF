//Determine if client can play the round, if not, spectate
if !(call phx_fnc_clientCanPlay) exitWith {call phx_fnc_spectatorInit};
player enableSimulation false;
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


//Set player loadout after stagger time
[{missionNamespace getVariable ["phx_staggeredLoaded",false]}, {
  call phx_loadout_fnc_applyCfgLoadout;
}] call CBA_fnc_waitUntilAndExecute;
// Wait for mission to start, then execute various restrictions and make sure player has gear
[{time > 0}, {
  call phx_fnc_restrictions;
  call phx_fnc_checkLoadout;
}] call CBA_fnc_waitUntilAndExecute;
//Client-side fortify, and gear selector
[{missionNamespace getVariable ["phx_loadoutAssigned",false]}, {
  call phx_fnc_fortifyClient;
  call phx_fnc_selector_init;
  player enableSimulation true;
}] call CBA_fnc_waitUntilAndExecute;

//Start kill counter when game ends or player is dead
//[{missionNamespace getVariable ["phx_gameEnd",false] || !alive player}, {call phx_fnc_killCounter}] call CBA_fnc_waitUntilAndExecute;
//Start spectator fnc when player is killed
player addEventHandler ["Killed", {[{call phx_fnc_spectatorInit}, [], 3] call cba_fnc_waitAndExecute;}];

//Marking
[] execVM "client\icons\QS_icons.sqf";
//Unflip - by KiloSwiss (https://steamcommunity.com/sharedfiles/filedetails/?id=1383176987)
[] spawn phx_fnc_unflipVehicleAddAction;


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
