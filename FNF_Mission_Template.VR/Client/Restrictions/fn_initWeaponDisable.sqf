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

fnf_disableGrenades = -1;

fnf_acePlacingPFH = -1;

fnf_disableFiring = -1;

[{
	if (count fnf_weaponDisableRequestList > 0) then
	{
		//if player can be damaged
		if (isDamageAllowed player) then
		{
			//restrict player damage
			player allowDamage false;
		};

		//if player can throw grenades stop them
		if (fnf_disableGrenades isEqualTo -1) then {
			fnf_disableGrenades = player addEventHandler ["FiredMan",
			{
				params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
				deleteVehicle _projectile;
				if (_weapon isEqualTo "Throw") then
				{
					_unit addMagazine _magazine;
				};
			}];
		};

		//if player can advanced throw then stop them
		if (missionNamespace getVariable ["ace_advanced_throwing_enabled", false]) then
		{
			missionNamespace setVariable ["ace_advanced_throwing_enabled", false];
		};

		if (fnf_acePlacingPFH isEqualTo -1) then
		{
			//Allow ACE placing and other actions that rely on left mouse button
			fnf_acePlacingPFH = [{
				if (
					(missionNamespace getVariable ["ace_explosives_placeaction",0] isEqualTo -1) ||
					(missionNamespace getVariable ["ace_fortify_isPlacing",0] isEqualTo -1) ||
					(player getVariable ["ace_dragging_iscarrying",false]) ||
					(player getVariable ["ace_dragging_isdragging",false]) ||
					(player getVariable ["ace_trenches_isplacing",false]) ||
					(player getVariable ["ace_tripod_adjusting",false])
				) then {
					if (fnf_disableFiring isNotEqualTo -1) then {
						player removeAction fnf_disableFiring;
						fnf_disableFiring = -1;
					};
				} else {
					if (fnf_disableFiring isEqualTo -1) then {
						fnf_disableFiring = player addAction ["", {}, nil, 0, false, true, "defaultAction"];
					};
				};

				if (isManualFire vehicle player) then {
					player action ["manualFireCancel", vehicle player];
				};
			}, 0] call CBA_fnc_addPerFrameHandler;
		};
	} else {
		//if player cant be damaged make them mortal
		if (!isDamageAllowed player) then
		{
			player allowDamage true;
		};

		//if player cannot fire gun allow them to
		if (fnf_disableFiring isNotEqualTo -1) then
		{
			player removeAction fnf_disableFiring;
			fnf_disableFiring = -1;
		};

		//if player cannot throw graenades allow them to
		if (fnf_disableGrenades isNotEqualTo -1) then
		{
			player removeEventHandler ["FiredMan", fnf_disableGrenades];
			fnf_disableGrenades = -1;
		};

		//if player is placing something in ace remove the PFH because no need for it
		if (fnf_acePlacingPFH isNotEqualTo -1) then
		{
			[fnf_acePlacingPFH] call CBA_fnc_removePerFrameHandler;
			fnf_acePlacingPFH = -1;
		};

		//enable advanced throwing
		missionNamespace setVariable ["ace_advanced_throwing_enabled", true];
	};
}, 1] call CBA_fnc_addPerFrameHandler;
