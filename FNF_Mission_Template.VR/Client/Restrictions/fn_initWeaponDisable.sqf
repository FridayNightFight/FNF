/*
	Author: Mallen

	Description:
		sets up the weapon disable system to be used by the zone system

	Parameter(s):
		None

	Returns:
		None
*/

fnf_weaponDisableRequestList = [];

fnf_disableFiring = "";
fnf_disableGrenades = -1;

[{
	if (count fnf_weaponDisableRequestList > 0) then
	{
		if (isDamageAllowed player) then
		{
			player allowDamage false;
			fnf_disableFiring = player addAction ["", {}, nil, 0, false, true, "defaultAction"];
			fnf_disableGrenades = player addEventHandler ["FiredMan",
			{
				params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
				deleteVehicle _ammo;
				_unit addMagazine _mode;
			}];
			[{missionNamespace getVariable ["ace_advanced_throwing_enabled",false]}, {ace_advanced_throwing_enabled = false}] call CBA_fnc_waitUntilAndExecute;
		};
	} else
	{
		if (!isDamageAllowed player) then
		{
			player allowDamage true;
			player removeAction fnf_disableFiring;
			player removeEventHandler ["FiredMan", fnf_disableGrenades];
			missionNamespace setVariable ["ace_advanced_throwing_enabled", true];
		}
	};
}, 1] call CBA_fnc_addPerFrameHandler;