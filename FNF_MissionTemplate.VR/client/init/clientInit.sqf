if (!hasInterface) exitWith {};

waitUntil {!isNil "phx_serverGameSetup" && !isNil "phx_safetyEnabled"};

uiSleep 1;

46 spawn phx_fnc_disableTyping; //Disable chat typing for mission display

//Determine if client can play the round, if not, spectate
if !(call phx_fnc_clientCanPlay) exitWith {call phx_fnc_spectatorInit};

call phx_fnc_hideMarkers; //Hide markers player shouldn't see

call phx_fnc_briefInit; //Briefing

call phx_fnc_clientSetup; //Client portion of game modes

call phx_fnc_safety; //Enable safety

call phx_fnc_setLoadout; //Give loadout

call phx_fnc_checkLoadout; //Make sure player gets assigned gear, if not, kick back to lobby

call phx_fnc_radio_waitGear; //Start radio preset functions

//Unflip - by KiloSwiss (https://steamcommunity.com/sharedfiles/filedetails/?id=1383176987)
[] spawn phx_fnc_unflipVehicleAddAction;

// Wait for mission to start, then execute various restrictions
[{CBA_missionTime > 0}, {call phx_fnc_restrictions}] call CBA_fnc_waitUntilAndExecute;

//Client-side fortify
[{missionNamespace getVariable ["phx_loadoutAssigned",false]}, {call phx_fnc_fortifyClient; call phx_fnc_restrictETool;}] call CBA_fnc_waitUntilAndExecute;

//Gear selector
[{missionNamespace getVariable ["phx_loadoutAssigned",false]}, {call phx_fnc_gearSelector}] call CBA_fnc_waitUntilAndExecute;

//Marking
[] execVM "client\icons\QS_icons.sqf";

player addEventHandler ["Killed", {
  call phx_fnc_spectatorInit;
}];
