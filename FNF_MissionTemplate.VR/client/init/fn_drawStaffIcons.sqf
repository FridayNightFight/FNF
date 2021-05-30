[{!(isNull findDisplay 46) && (!isNil {missionNamespace getVariable ["staffInfo", nil]}) && phx_staggeredLoaded == true}, {

	missionNamespace setVariable ["staffPlayers", createHashMap];

	staffIdentifier = [] spawn {
		// remove if not safe start
		while {phx_safetyEnabled} do {

			_staffInfo = missionNamespace getVariable "staffInfo";

			{
				private _staffMember = _x call BIS_fnc_getUnitByUID;
				if (!isNull _staffMember) then {
					staffPlayers set [_x, [_y # 0, _y # 1, _staffMember]];
				};
			} forEach _staffInfo;
			sleep 15;
		};
	};

	staffIconHelper = [{

		// remove if not safe start
		if (!phx_safetyEnabled) then {_handle call CBA_fnc_removePerFrameHandler};

		// skip if ACE spectator is drawing group/name icons so as not to clash
		if (missionNamespace getVariable ["ace_spectator_drawunits", false] && ace_spectator_isSet) exitWith {};

		{
			_staffMember = _y # 2;
			_name = _y # 0;
			_role = _y # 1;
			_text = format["STAFF | %1 | %2", _name, _role];
			_pos = _staffMember modelToWorldVisual [0,0,0];

			if (player distance _staffMember >= 15 && player distance _staffMember <= 300) then {
				drawIcon3D[getMissionPath "fnfsmall.paa", [1, 1, 1, 0.3], [(_pos select 0), (_pos select 1), 3], 0.6, 0.6, 0, "", true, 0.05, "PuristaBold", "center"];
			} else {
				if (player distance _staffMember < 15) then {
					drawIcon3D[getMissionPath "fnfsmall.paa", [1, 1, 1, 1], [(_pos select 0), (_pos select 1), 3], 1, 1, 0, _text, true, 0.05, "PuristaBold", "center"];
				};
			};
		} forEach (missionNamespace getVariable "staffPlayers");
	}, 0] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;