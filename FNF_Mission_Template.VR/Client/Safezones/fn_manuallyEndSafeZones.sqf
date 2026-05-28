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

_miscOptionsModule = [_modules, "miscOptions"] call FNF_ClientSide_fnc_findSpecificModules;
_miscOptionsModule = _miscOptionsModule select 0;

_deathMode = (_miscOptionsModule getVariable ["fnf_deathMode", "reinsert"]);

if (_deathMode isEqualTo "reinsert") then
{
	//check if init module is found
	_initModule = [_modules, "init"] call FNF_ClientSide_fnc_findSpecificModules;
	_initModule = _initModule select 0;

	_disableWindow = (_initModule getVariable ["fnf_timeToDisableReinsertsAfterSafeStart", 20]);

	fnf_timerMessage = "Reinsert Window Remaining: %1";
	fnf_timerEndTime = _disableWindow * 60;
} else {
	fnf_timerMessage = nil;
	fnf_timerEndTime = nil;
};

{
	_zonePrefix = _x getVariable ["fnf_prefix", "FAILED"];

	["safeZoneGroup", _zonePrefix] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;

	_switchingZone = _x getVariable ["fnf_switchToNonRestrictive", false];

	if (!_switchingZone) then
	{
		["safeZoneSwitchingGroup", _zonePrefix] call FNF_ClientSide_fnc_removeZoneFromRestrictionGroup;
		[_zonePrefix] call FNF_ClientSide_fnc_removeZone;
	};
} forEach _safeZoneModules;

_fortifyAfterSafeStart = (_miscOptionsModule getVariable ["fnf_fortifyAfterSafeStart", false]);

if (not _fortifyAfterSafeStart) then
{
	call FNF_ClientSide_fnc_disableFortify;
};

player setVariable ["fnf_backpackLocked", 2, true];

false call FNF_ClientSide_fnc_showTimerInHUD;

["safeZoneGroup"] call FNF_ClientSide_fnc_removeRestrictionGroup;
