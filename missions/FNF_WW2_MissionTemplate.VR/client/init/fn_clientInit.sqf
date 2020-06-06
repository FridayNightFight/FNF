//Disable global chat
0 enableChannel false;

if (typeOf player == "ace_spectator_virtual") exitWith {call phx_fnc_spectatorInit};

//Hide markers player shouldn't see
call phx_fnc_markerVisibility;

//Call safety if mission hasn't started yet. If mission has started, call JIP function
if (phx_safetyEnabled) then {[] spawn phx_fnc_safety};
if (!phx_safetyEnabled) exitWith {[] spawn phx_fnc_clientJIP};

//Set loadout
call phx_fnc_setLoadout;

// Set the group IDs
call phx_fnc_setGroupIDs;

// Create briefing
[] execVM "client\briefing\briefing.sqf";

//Make sure player stays inside start marker
call phx_fnc_startBoundary;

//Make sure player stays within mission zone
call phx_fnc_zoneBoundary;

//Unflip - by KiloSwiss (https://steamcommunity.com/sharedfiles/filedetails/?id=1383176987)
[] spawn phx_fnc_unflipVehicleAddAction;

//Preset radios
phx_radHandle1 = [phx_fnc_radio_waitGear, 0.1, []] call CBA_fnc_addPerFrameHandler;

//Client-side fortify
//call phx_fnc_fortifyClient;

//Wait for the server to finish setting up the game then call client setup
[{!isNil "phx_serverGameSetup"}, {call phx_fnc_client_setupGame}] call CBA_fnc_waitUntilAndExecute;

//Platoon lead menu
call phx_fnc_platoonActions;

//Marker System
[] execVM "client\QS_icons.sqf";

// Generate ORBAT page
[] execVM "client\briefing\f_orbatNotes.sqf";

//Weapon selector
[] spawn phx_fnc_gearSelection;

//TFAR set volume to whisper
[] spawn {
  waitUntil {sleep 0.25; !isNil "TF_speak_volume_meters"};
  5 call TFAR_fnc_setVoiceVolume;
  TF_speak_volume_level = "whispering";
};

//[] spawn phx_fnc_getKeys;

//Stop high gamma setting if phx_antiGammaDoping = true in config
phx_gammaWarn = false;
if (phx_antiGammaDoping) then {
  [{
    if (isNull findDisplay 5) exitWith {};
    _gamma = parseNumber (ctrlText (findDisplay 5 displayCtrl 109));
    if (_gamma > 1.1 && !phx_gammaWarn) then {
      cutText ["Gamma setting cannot exceed 1.1 for this mission", "BLACK"];
      phx_gammaWarn = true;
    } else {
      if (_gamma <= 1.1 && phx_gammaWarn) then {
        cutText ["", "BLACK IN"];
        phx_gammaWarn = false;
      };
    };
  } , 0.1] call CBA_fnc_addPerFrameHandler;
};

//Make sure player gets assigned gear, if not then kick back to lobby
call phx_fnc_checkLoadout;

//////////////////////////////////////////////////////////////////////////////////////////
// Wait for mission to start, then execute post briefing init
[{CBA_missionTime > 0}, {
    call phx_fnc_postBriefing;
}, []] call CBA_fnc_waitUntilAndExecute;
