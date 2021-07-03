[{!(isNull findDisplay 46) && missionNamespace getVariable ["phx_staggeredLoaded",false]}, {

	_sideColor = str playerSide;
	_colorStr = format["Color%1", _sideColor];
	_facColor = [];
	{
		_facColor pushback (call compile _x);
	} forEach (getArray(configfile >> "CfgMarkerColors" >> _colorStr >> "color"));
	_facColor = _facColor apply {
		if (_x + 0.3 > 1) then {
			_x = 1
		} else {
			if (_x != 0) then {
				_x + 0.3
			} else {
				_x
			};
		};
	};
	missionNamespace setVariable ["factionColor", _facColor];

	// [squadLeadIconsHelper] call CBA_fnc_removePerFrameHandler;
	squadLeadIconsHelper = [{

		// remove if not safe start
		if (!phx_safetyEnabled) then {_handle call CBA_fnc_removePerFrameHandler};

		// skip if ACE spectator is drawing group/name icons so as not to clash
		if (missionNamespace getVariable ["ace_spectator_drawunits", false] && ace_spectator_isSet) exitWith {};

		// skip if in objectivePreviewCamera
		if (!isNil "phx_fnc_objectivePreview_Cam") exitWith {};

		_slUnits = (units playerSide) select {
			["_Soldier_SL_F", typeOf _x] call BIS_fnc_inString &&
			_x == leader group _x;
		};

		// address squad leads (_Soldier_SL_F unit class & is leader of their group, to exclude CMD HQ auxiliaries)
		{
			_thisName = groupId (group _x);

			_pos = _x modelToWorldVisual [0,0,5];

			switch (true) do {
				// case (player distance _x <= 15): {
				// 	private _facColor = +factionColor;
				// 	_facColor pushBack 0.8;
				// 	drawIcon3D["", _facColor, [(_pos select 0), (_pos select 1), (_pos select 2)], 0, 0, 0, _thisName, true, 0.03 / (getResolution select 5), "PuristaBold", "center"];
				// };
				case (player distance _x <= 300): {
					private _facColor = +factionColor;
					_facColor pushBack 0.9;
					drawIcon3D["", _facColor, _pos, 0, 0, 0, _thisName, true, 0.03 / (getResolution select 5), "PuristaBold", "center"];
				};
			};
		} forEach _slUnits;
	}, 0] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;
