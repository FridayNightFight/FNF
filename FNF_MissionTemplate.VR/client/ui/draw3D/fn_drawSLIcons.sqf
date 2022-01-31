[{!(isNull findDisplay 46) && missionNamespace getVariable ["phx_staggeredLoaded",false]}, {
	_facColor = [playerSide, false] call BIS_fnc_sideColor;
	_facColor = _facColor apply {
		if (_x != 0) then {
			(_x + 0.3) min 1
		} else {
			_x
		};
	};
	missionNamespace setVariable ["factionColor", _facColor];

	// [squadLeadIconsHelper] call CBA_fnc_removePerFrameHandler;
	squadLeadIconsHelper = [{

		// remove if not safe start
		if (!(missionNamespace getVariable ["phx_safetyEnabled", true])) then {_handle call CBA_fnc_removePerFrameHandler};

		// skip if ACE spectator is drawing group/name icons so as not to clash
		if (missionNamespace getVariable ["ace_spectator_drawunits", false] && ace_spectator_isSet) exitWith {};

		// skip if in objectivePreviewCamera
		if (!isNil "phx_fnc_objectivePreview_Cam") exitWith {};

		_slUnits = (units playerSide) select {
			(_x getVariable ["phxLoadout", ""]) isEqualTo ROLE_SL &&
			_x == leader (group _x)
		};

		private _cameraPositionAGL = positionCameraToWorld[0,0,0];
		private _cameraPositionASL = AGLtoASL _cameraPositionAGL;
		private _zoom = (
					(
						[0.5,0.5]
						distance2D
						worldToScreen
						positionCameraToWorld
						[0,3,4]
					) * (
						getResolution
						select 5
					) / 2
		) + 0.66666;

		// address squad leads (_Soldier_SL_F unit class & is leader of their group, to exclude CMD HQ auxiliaries)
		{
			// referenced https://github.com/Quailsnap/WHA-Nametags
			_targetPositionAGLTopRef = _x modelToWorldVisual (_x selectionPosition "pilot") vectorAdd [0,0, 5 + (0.5 * (_player distance _x))];
			_targetPositionAGLBotRef = _x modelToWorldVisual [0,0,0] vectorAdd [0,0,((0.1 * (player distance _x)))];

			private _camDistance = _cameraPositionAGL distance _targetPositionAGLTopRef;
			private _distance = _player distance _targetPositionAGLTopRef;

			private _vectorDir = eyePos player vectorFromTo (positionCameraToWorld[0,0,1]);
			private _vectorDiff = vectorNormalized (((_vectorDir) vectorCrossProduct (vectorUp player)) vectorCrossProduct (_targetPositionAGLTopRef vectorDiff _cameraPositionAGL));
			private _targetPositionAGLTop = _targetPositionAGLTopRef vectorAdd ((_vectorDiff vectorMultiply (0.1 * _camDistance / _zoom)) vectorMultiply 0.6);
			private _targetPositionAGLBottom = _targetPositionAGLBotRef vectorAdd ((_vectorDiff vectorMultiply (0.1 * _camDistance / _zoom)) vectorMultiply -1);

			private _thisName = "";
			private _role = "";
			if (["@", roleDescription _x] call BIS_fnc_inString) then {
				_role = (roleDescription _x splitString '@');
				if (count _role > 1) then {
					if (count (_role # 1) > 0) then {
						_thisName = _role # 1;
					} else {
						_thisName =  roleDescription _x;
					};
				} else {
					_thisName = _role;
				};
			} else {
				_thisName = roleDescription _x;
			};


			if (alive _x && !(player isEqualTo _x)) then {
				switch (true) do {
					// case (player distance _x <= 15): {
					// 	private _facColor = +factionColor;
					// 	_facColor pushBack 0.8;
					// 	drawIcon3D["", _facColor, [(_pos select 0), (_pos select 1), (_pos select 2)], 0, 0, 0, _thisName, true, 0.03 / (getResolution select 5), "PuristaBold", "center"];
					// };
					case (player distance _x <= 300): {
						private _facColor = +factionColor;
						_facColor set [3, 0.9];
						drawIcon3D["", _facColor, _targetPositionAGLTop, 0, 0, 0, _thisName, true, 0.015 / (getResolution select 5), "PuristaBold", "center"];
					};
				};
			};
		} forEach (_slUnits select {!(isNull _x)});
	}, 0] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;
