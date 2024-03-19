/*
	Author: Mallen

	Description:
		Manually end all safe start zones if the timers for the safezones fail (ONLY TO BE CALLED MANUALLY)

	Parameter(s):
		None

	Returns:
		None
*/

//call FNF_ClientSide_fnc_manuallyEndSafeZones

_modules = call FNF_ClientSide_fnc_findFNFModules;

_safeZoneModules = [_modules, "safeZone"] call FNF_ClientSide_fnc_findSpecificModules;

{
  _zonePrefix = _x getVariable ["fnf_prefix", "FAILED"];

  ["safeZoneGroup", _zonePrefix] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;

  [_zonePrefix] call FNF_ClientSide_fnc_removeZone;
} forEach _safeZoneModules;

call FNF_ClientSide_fnc_disableFortify;

fnf_showSelectors = false;

fnf_timerMessage = nil;
fnf_timerEndTime = nil;
false call FNF_ClientSide_fnc_showTimerInHUD;

["safeZoneGroup"] call FNF_ClientSide_fnc_removeRestrictionGroup;
