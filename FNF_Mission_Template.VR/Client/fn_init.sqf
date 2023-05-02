//Due to modules all Objectives, Zones, and Selectors should be stored, will not be tracked etc yet
_modules = call FNF_ClientSide_fnc_findFNFModules;

//check if init module is found
_initModule = [_modules, "init"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _initModule == 0) exitWith {systemChat "WARNING: No FNF Init found, exiting mission prep"};
if (count _initModule > 1) exitWith {systemChat "WARNING: Multiple FNF Init found, exiting mission prep"};
_initModule = _initModule select 0;
fnf_debug = _initModule getVariable "fnf_debug";

//restrict players vanilla actions
call FNF_ClientSide_fnc_restrictPlayer;

//init zones
call FNF_ClientSide_fnc_initZones;

//check there are objectives
if (isnil "fnf_objectives") then
{
  if (fnf_debug) then {
    systemChat "WARNING: No objectives present"
  };
};

//check if there is a playzone
if (isnil "fnf_playZone") then
{
  if (fnf_debug) then {
    systemChat "WARNING: No playzone present"
  };
};

//check there are safe zones
_safeZoneModules = [_modules, "safeZone"] call FNF_ClientSide_fnc_findSpecificModules;
if (count _safeZoneModules == 0) then
{
  if (fnf_debug) then {
    systemChat "WARNING: No safe zones present";
  };
} else {
  [_safeZoneModules] call FNF_ClientSide_fnc_initSafeZones;
};
