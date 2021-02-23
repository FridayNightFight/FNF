//Determine if client can play the round, if not, spectate
if !(call phx_fnc_clientCanPlay) exitWith {call phx_fnc_spectatorInit};

call phx_fnc_hideMarkers; //Hide markers player shouldn't see
call phx_fnc_briefInit; //Briefing
call phx_fnc_clientSetupGame; //Client portion of game modes
call phx_fnc_safety; //Enable safety
call phx_fnc_staggeredLoad; //Start staggered load timer
call phx_fnc_initLoadout; //Loadout vars
call phx_fnc_radio_waitGear; //Start radio preset functions

//Disable chat typing for mission display
[{!(isNull findDisplay 46) && !(isNull player)}, {46 call phx_fnc_disableTyping}] call CBA_fnc_waitUntilAndExecute;
//Set player loadout after stagger time
[{missionNamespace getVariable ["phx_staggeredLoaded",false]}, {call phx_fnc_setLoadout}] call CBA_fnc_waitUntilAndExecute;
// Wait for mission to start, then execute various restrictions and make sure player has gear
[{time > 0}, {call phx_fnc_restrictions; call phx_fnc_checkLoadout;}] call CBA_fnc_waitUntilAndExecute;
//Client-side fortify, and gear selector
[{missionNamespace getVariable ["phx_loadoutAssigned",false]}, {call phx_fnc_fortifyClient; call phx_fnc_gearSelector;}] call CBA_fnc_waitUntilAndExecute;

//Marking
[] execVM "client\icons\QS_icons.sqf";

//Start spectator fnc when player is killed
player addEventHandler ["Killed", {
  call phx_fnc_spectatorInit;
}];

//Unflip - by KiloSwiss (https://steamcommunity.com/sharedfiles/filedetails/?id=1383176987)
[] spawn phx_fnc_unflipVehicleAddAction;
