[{!(isNull findDisplay 46) && (!isNil "staffInfo") && missionNamespace getVariable ["phx_staggeredLoaded",false]}, {

	// [commandIconsHelper] call CBA_fnc_removePerFrameHandler;
	commandIconsHelper = [{

		// remove if not safe start
		if (!phx_safetyEnabled) then {_handle call CBA_fnc_removePerFrameHandler};

		_cmdUnits = (units playerSide) select {
			["officer", typeOf _x] call BIS_fnc_inString
		};

		// address officers (CMD, PL)
		{
			// skip if ACE spectator is drawing group/name icons so as not to clash
			if (missionNamespace getVariable ["ace_spectator_drawunits", false] && ace_spectator_isSet) exitWith {};

			// skip if in objectivePreviewCamera
			if (!isNil "phx_fnc_objectivePreview_Cam") exitWith {};

			// _thisName = format["%1: %2", ((roleDescription _x) splitString "@")# 0, name _x];
			_thisName = groupId (group _x);

			_pos = _x modelToWorldVisual [0,0,2.5];

			switch (true) do {
				// case (player distance _x <= 15): {
				// 	drawIcon3D["", [1, 1, 1, 0.8], _pos, 0.6, 0.6, 0, _thisName, true, 0.015 / (getResolution select 5), "PuristaBold", "center"];
				// };
				case (player distance _x <= 300): {
					drawIcon3D["", [1, 1, 1, 0.9], _pos, 0.6 / (getResolution select 5), 0.6 / (getResolution select 5), 0, _thisName, true, 0.015 / (getResolution select 5), "PuristaBold", "center"];
				};
			};
		} forEach _cmdUnits;
	}, 0] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;