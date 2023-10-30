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
      //restrict player damage and weapon firing
			player allowDamage false;
    };

    if (fnf_disableGrenades == -1) then {
			fnf_disableGrenades = player addEventHandler ["FiredMan",
			{
				params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
				deleteVehicle _ammo;
				_unit addMagazine _mode;
			}];
    };

    if (missionNamespace getVariable ["ace_advanced_throwing_enabled", false]) then
    {
      missionNamespace setVariable ["ace_advanced_throwing_enabled", false];
    };

    if (fnf_acePlacingPFH == -1) then
    {
      //Allow ACE placing and other actions that rely on left mouse button
      fnf_acePlacingPFH = [{
        if (
          (missionNamespace getVariable ["ace_explosives_placeaction",0] == -1) ||
          (missionNamespace getVariable ["ace_fortify_isPlacing",0] == -1) ||
          (player getVariable ["ace_dragging_iscarrying",false]) ||
          (player getVariable ["ace_dragging_isdragging",false]) ||
          (player getVariable ["ace_trenches_isplacing",false]) ||
          (player getVariable ["ace_tripod_adjusting",false])
        ) then {
          if (fnf_disableFiring != -1) then {
            player removeAction fnf_disableFiring;
            fnf_disableFiring = -1;
          };
        } else {
          if (fnf_disableFiring == -1) then {
            fnf_disableFiring = player addAction ["", {}, nil, 0, false, true, "defaultAction"];
          };
        };

        if (isManualFire vehicle player) then {
          player action ["manualFireCancel", vehicle player];
        };
      }, 0] call CBA_fnc_addPerFrameHandler;
		};
	} else {
    //if player cant be damaged make them mortal and allow guns
		if (!isDamageAllowed player) then
		{
			player allowDamage true;
    };

    if (fnf_disableFiring != -1) then
    {
      player removeAction fnf_disableFiring;
      fnf_disableFiring = -1;
    };

    if (fnf_disableGrenades != -1) then
    {
			player removeEventHandler ["FiredMan", fnf_disableGrenades];
      fnf_disableGrenades = -1;
    };

    if (fnf_acePlacingPFH != -1) then
    {
      [fnf_acePlacingPFH] call CBA_fnc_removePerFrameHandler;
      fnf_acePlacingPFH = -1;
    };

		missionNamespace setVariable ["ace_advanced_throwing_enabled", true];
	};
}, 1] call CBA_fnc_addPerFrameHandler;
