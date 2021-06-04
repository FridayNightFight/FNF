[{!(isNull findDisplay 46) && (!isNil {missionNamespace getVariable ["staffInfo", nil]}) && phx_staggeredLoaded == true}, {
	unitIconsHelperSpec = [{

		// skip if not safe start
		if (!phx_safetyEnabled) then {_handle call CBA_fnc_removePerFrameHandler};

		_cmdUnits = (units playerSide) select {
			["officer", typeOf _x] call BIS_fnc_inString
		};

		// address officers (CMD, PL)
		{
			// skip draw beyond 300m
			if (player distance _x >= 300) exitWith {};

			// skip if ACE spectator is drawing group/name icons so as not to clash
			if (missionNamespace getVariable "ace_spectator_drawunits" && ace_spectator_isSet) exitWith {};

			_iconType = getText(configFile >> "CfgVehicles" >> (typeOf(vehicle _x)) >> "icon");
			_thisName = format["%1: %2", ((roleDescription _x) splitString "@")# 0, name _x];

			_pos = _x modelToWorldVisual [0,0,0];

			drawIcon3D[_iconType, [1, 1, 1, 0.7], [(_pos select 0), (_pos select 1), (_pos select 2) + 2.3], 0.6, 0.6, 0, _thisName, true, 0.03, "PuristaBold", "center"];
		} forEach _cmdUnits;
	}, 0] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;