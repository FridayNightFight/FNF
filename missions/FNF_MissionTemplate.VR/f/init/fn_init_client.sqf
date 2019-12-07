//====================================================================================================
// Client init - Player is not null by this point

//Set marker visibility
side player execVM "f\init\clientMarkerVisibilty.sqf";

// Set loadouts
call phx_fnc_loadout_set;

// Set the group IDs
[] call compile preprocessFileLineNumbers "f\setGroupID\f_setGroupIDs.sqf";

f_param_radios = ["phx_param_radios",0] call BIS_fnc_getParamValue;
if (f_param_radios isEqualTo 1) then {
  // Preset radios
  phx_radHandle1 = [phx_fnc_radio_waitGear, 0.1, []] call CBA_fnc_addPerFrameHandler;
};

phx_end_clientWait = [phx_fnc_end_clientWait, 5, []] call CBA_fnc_addPerFrameHandler;

//Make sure player stays within safe start markers
[] execVM "f\safeStart\f_playerInStart.sqf";

//Make sure player stays within mission boundary if present
_zoneRestriction = "phx_zoneRestriction" call BIS_fnc_getParamValue;

if !(_zoneRestriction isEqualTo 0) then {
  [] execVM "f\misc\zoneRestriction_client.sqf";
};

// Create briefing
[] execVM "briefing.sqf";

// Generate ORBAT page
[] execVM "f\briefing\f_orbatNotes.sqf";

//Marker System
[] execVM "QS_icons.sqf";

//Gear selector UI
[] spawn phx_fnc_gearSelector;

//ORBAT updater
[] spawn {
  sleep 15;

  orbatUpdatePFH = [{
    [] execVM "f\briefing\f_updateOrbat.sqf";
  }, 60, []] call CBA_fnc_addPerFrameHandler;
};

//====================================================================================================
phx_clientInitFinished = true;

// Call init function for scripts that are shared between clients and server
call phX_fnc_init_shared;
