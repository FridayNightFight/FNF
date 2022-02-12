[{!(isNull findDisplay 46) && missionNamespace getVariable ["fnf_staggeredLoaded",false]}, {

	// [commandIconsHelper] call CBA_fnc_removePerFrameHandler;
	commandIconsHelper = [{

		// remove if not safe start
		if (!(missionNamespace getVariable ["fnf_safetyEnabled", true])) then {_handle call CBA_fnc_removePerFrameHandler};

		_cmdUnits = (units playerSide) select {
			["officer", typeOf _x] call BIS_fnc_inString
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

		// address officers (CMD, PL)
		{
			// skip if ACE spectator is drawing group/name icons so as not to clash
			if (missionNamespace getVariable ["ace_spectator_drawunits", false] && ace_spectator_isSet) exitWith {};

			// skip if in objectivePreviewCamera
			if (!isNil "fnf_fnc_objectivePreview_Cam") exitWith {};

			// referenced https://github.com/Quailsnap/WHA-Nametags
			_targetPositionAGLTopRef = _x modelToWorldVisual (_x selectionPosition "pilot") vectorAdd [0,0, 5 + (0.5 * (_player distance _x))];
			_targetPositionAGLBotRef = _x modelToWorldVisual [0,0,0] vectorAdd [0,0,((0.1 * (player distance _x)))];

			private _camDistance = _cameraPositionAGL distance _targetPositionAGLTopRef;
			private _distance = _player distance _targetPositionAGLTopRef;

			private _vectorDir = eyePos player vectorFromTo (positionCameraToWorld[0,0,1]);
			private _vectorDiff = vectorNormalized (((_vectorDir) vectorCrossProduct (vectorUp player)) vectorCrossProduct (_targetPositionAGLTopRef vectorDiff _cameraPositionAGL));
			private _targetPositionAGLTop = _targetPositionAGLTopRef vectorAdd ((_vectorDiff vectorMultiply (0.1 * _camDistance / _zoom)) vectorMultiply 1);
			private _targetPositionAGLBottom = _targetPositionAGLBotRef vectorAdd ((_vectorDiff vectorMultiply (0.1 * _camDistance / _zoom)) vectorMultiply -1);

			// _thisName = format["%1: %2", ((roleDescription _x) splitString "@")# 0, name _x];
			_thisName = groupId (group _x);

			if (alive _x && !(player isEqualTo _x)) then {
				switch (true) do {
					// case (player distance _x <= 15): {
					// 	drawIcon3D["", [1, 1, 1, 0.8], _pos, 0.6, 0.6, 0, _thisName, true, 0.015 / (getResolution select 5), "PuristaBold", "center"];
					// };
					case (player distance _x <= 300): {
						drawIcon3D["", [1, 1, 1, 0.9], _targetPositionAGLTop, 0.6 / (getResolution select 5), 0.6 / (getResolution select 5), 0, _thisName, true, 0.015 / (getResolution select 5), "PuristaBold", "center"];
					};
				};
			};
		} forEach _cmdUnits;
	}, 0] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;
