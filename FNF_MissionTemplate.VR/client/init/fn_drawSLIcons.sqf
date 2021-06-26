[{!(isNull findDisplay 46) && (!isNil "staffInfo") && missionNamespace getVariable ["phx_staggeredLoaded",false]}, {
	squadLeadIconsHelper = [{

		// skip if not safe start
		if (!phx_safetyEnabled) then {_handle call CBA_fnc_removePerFrameHandler};

		_slUnits = (units playerSide) select {
			["_Soldier_SL_F", typeOf _x] call BIS_fnc_inString &&
			_x == leader group _x;
		};

		// address squad leads (_Soldier_SL_F unit class & is leader of their group, to exclude CMD HQ auxiliaries)
		{
			// skip if ACE spectator is drawing group/name icons so as not to clash
			if (missionNamespace getVariable "ace_spectator_drawunits" && ace_spectator_isSet) exitWith {};

			// skip if in objectivePreviewCamera
			if (!isNil "phx_fnc_objectivePreview_Cam") exitWith {};

			_thisName = groupId (group _x);

			_pos = _x modelToWorldVisual [0,0,0];

			// skip draw beyond 300m
			if (player distance _x <= 300) then {
				drawIcon3D["", [1, 1, 0.6, 0.5], [(_pos select 0), (_pos select 1), (_pos select 2) + 2.3], 0.6, 0.6, 0, _thisName, true, 0.05, "PuristaBold", "center"];
			};
		} forEach _slUnits;
	}, 0] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;