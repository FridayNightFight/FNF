[{!(isNull findDisplay 46) && (!isNil {missionNamespace getVariable ["staffInfo", nil]}) && phx_staggeredLoaded == true}, {
	staffIconHelper = [{
		{
			
			// skip if not safe start
			if (!phx_safetyEnabled) then {_handle call CBA_fnc_removePerFrameHandler};
			// skip draw beyond 300m
			if (player distance _x >= 300) exitWith {};

			// skip if ACE spectator is drawing group/name icons so as not to clash
			if (missionNamespace getVariable "ace_spectator_drawunits" && ace_spectator_isSet) exitWith {};

			_staff = missionNamespace getVariable["staffInfo", nil];
			if (isNil "_staff") exitWith {};

			_staffInfo = _staff getOrDefault[(getPlayerUID _x), nil];
			if (isNil "_staffInfo") exitWith {};

			// _staffInfo = parseSimpleArray _staffInfo;
			_name = _staffInfo # 0;
			_role = _staffInfo # 1;
			_text = format["STAFF | %1 | %2", _name, _role];
			_pos = visiblePosition _x;

			if (player distance _x >= 15) then {
				drawIcon3D[getMissionPath "fnfsmall.paa", [1, 1, 1, 0.3], [(_pos select 0), (_pos select 1), 3], 0.6, 0.6, 0, "", true, 0.05, "PuristaBold", "center"];
			} else {
				drawIcon3D[getMissionPath "fnfsmall.paa", [1, 1, 1, 1], [(_pos select 0), (_pos select 1), 3], 1, 1, 0, _text, true, 0.05, "PuristaBold", "center"];
			};
		} forEach(units playerSide);
	}, 0] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;