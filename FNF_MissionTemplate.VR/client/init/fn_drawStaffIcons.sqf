[{!(isNull findDisplay 46) && (!isNil "fnf_staffInfo") && missionNamespace getVariable ["phx_staggeredLoaded",false]}, {

	missionNamespace setVariable ["staffPlayers", createHashMap];
	phx_fnfIconSmall = getMissionPath "description\images\fnfsmall.paa";

	staffIdentifier = [] spawn {
		// remove if not safe start
		while {phx_safetyEnabled} do {

			_info = missionNamespace getVariable "fnf_staffInfo";

			{
				private _staffMember = _x call BIS_fnc_getUnitByUID;
				if (!isNull _staffMember) then {
					staffPlayers set [_x, [_y # 0, _y # 1, _staffMember]];
				};
			} forEach _info;
			sleep 15;
		};
	};


	// testUnits = [];
	// {
	// 	testUnits pushBack (selectRandom (units playerSide select {_x == leader group _x}));
	// 	true;
	// } count [1,2,3,4,5];

	// [staffIconHelper] call CBA_fnc_removePerFrameHandler;
	staffIconHelper = [{

		// remove if not safe start
		if (!phx_safetyEnabled) then {_handle call CBA_fnc_removePerFrameHandler};

		// skip if ACE spectator is drawing group/name icons so as not to clash
		if (missionNamespace getVariable ["ace_spectator_drawunits", false] && ace_spectator_isSet) exitWith {};

		// skip if in objectivePreviewCamera
		if (!isNil "phx_fnc_objectivePreview_Cam") exitWith {};

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

		{
			_staffMember = _y # 2;
			_name = _y # 0;
			_role = _y # 1;
			_text = format["STAFF | %1 | %2", _name, _role];

			// referenced https://github.com/Quailsnap/WHA-Nametags
			_targetPositionAGLTopRef = _staffMember modelToWorldVisual (_staffMember selectionPosition "pilot") vectorAdd [0,0, 5 + (0.5 * (_player distance _staffMember))];
			_targetPositionAGLBotRef = _staffMember modelToWorldVisual [0,0,0] vectorAdd [0,0,((0.1 * (player distance _staffMember)))];
			
			private _camDistance = _cameraPositionAGL distance _targetPositionAGLTopRef;
			private _distance = _player distance _targetPositionAGLTopRef;

			private _vectorDir = eyePos player vectorFromTo (positionCameraToWorld[0,0,1]);
			private _vectorDiff = vectorNormalized (((_vectorDir) vectorCrossProduct (vectorUp player)) vectorCrossProduct (_targetPositionAGLTopRef vectorDiff _cameraPositionAGL));
			private _targetPositionAGLTop = _targetPositionAGLTopRef vectorAdd ((_vectorDiff vectorMultiply (0.1 * _camDistance / _zoom)) vectorMultiply 1.3);
			private _targetPositionAGLBottom = _targetPositionAGLBotRef vectorAdd ((_vectorDiff vectorMultiply (0.1 * _camDistance / _zoom)) vectorMultiply -1);

			// _staffMember = _x;
			// _text = "STAFF | John | Staff Guy";

			// _pos = _staffMember modelToWorldVisual [0,0,3];

			if (alive _staffMember && !(player isEqualTo _staffMember)) then {
				switch (true) do {
					case (player distance _staffMember <= 15): {
						drawIcon3D[phx_fnfIconSmall, [1, 1, 1, 1], _targetPositionAGLTop, 0.5 / (getResolution select 5), 0.5 / (getResolution select 5), 0, _text, true, 0.02 / (getResolution select 5), "PuristaBold", "center"];
					};
					case (player distance _staffMember <= 300): {
						drawIcon3D[phx_fnfIconSmall, [1, 1, 1, 0.3], _targetPositionAGLTop, 0.3 / (getResolution select 5), 0.3 / (getResolution select 5), 0, "", true, 0.02 / (getResolution select 5), "PuristaBold", "center"];
					};
				};
			};
		// } forEach testUnits;
		} forEach (missionNamespace getVariable "staffPlayers");
	}, 0] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;
