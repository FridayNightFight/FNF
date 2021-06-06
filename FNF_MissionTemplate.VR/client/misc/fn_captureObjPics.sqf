captureScreenshots = {

		_prepCamera = {
		showCinemaBorder false;
		_ppGrain = ppEffectCreate ["FilmGrain", 2000];
		_ppColor = ppEffectCreate ["ColorCorrections", 1500];
		_ppGrain ppEffectEnable true;
		_ppColor ppEffectEnable true;
		_ppGrain ppEffectAdjust [0.6, 1, 2, 0, 1];
		_ppColor ppEffectAdjust [
			0.75,
			1.3,
			0,
			[1, 1, 1, 0],
			[1, 1, 1, 0],
			[0.75, 0.25, 0, 1.0]];
		_ppGrain ppEffectCommit 0;
		_ppColor ppEffectCommit 0;
		"HBAOPlus" ppEffectAdjust [1.0, 0.3, 0.1, 0.50, 3.0, 1.0, 4.0, 5.0, 2.0, 0.0];


		// Compile Date text
		_curDate = dateToNumber date;
		_newDate = numberToDate [date # 0, (_curDate - ((random(3) + 4) * (0.0027 + random(0.00003973))))];
		setDate [
			_newDate # 0,
			_newDate # 1,
			_newDate # 2,
			16,
			_newDate # 3
		];

		// while {!(0.20 < sunOrMoon && sunOrMoon < 0.80)} do {
		while {!(0.50 < sunOrMoon && sunOrMoon < 1)} do {
			skipTime 0.1;
		};

		private ["_month", "_day", "_hour", "_minute"];
		_month = str (date select 1);
		_day = str (date select 2);
		_hour = str (date select 3);
		_minute = str (date select 4);

		if (date select 1 < 10) then {_month = format ["0%1", str (date select 1)]};
		if (date select 2 < 10) then {_day = format ["0%1", str (date select 2)]};
		if (date select 3 < 10) then {_hour = format ["0%1", str (date select 3)]};
		if (date select 4 < 10) then {_minute = format ["0%1", str (date select 4)]};

		private ["_time", "_date"];
		_time = format ["%1:%2", _hour, _minute];
		_date = format ["%1-%2-%3", str (date select 0), _month, _day];
		copyToClipboard str [_date, _time];


		// Remove perFrameHandlers including the one limiting view distance
		for "_i" from 0 to 20 do {
			[_i] call CBA_fnc_removePerFrameHandler; 
		};
		[6000] remoteExec ["setViewDistance", 0];
		0 setFog 0;

		[_ppGrain, _ppColor];
	};

	_cleanup = {
		params ["_ppGrain", "_ppColor"];
		ppEffectDestroy _ppGrain;
		ppEffectDestroy _ppColor;
		setAperture -1;
		[phx_maxViewDistance] remoteExec ["setViewDistance", 0];
	};


	switch true do {
		case (phx_gameMode == "neutralSector"): {// NEUTRAL SECTOR
			[_prepCamera, _cleanup] spawn {
				params ["_prepCamera", "_cleanup"];
				_prep = call _prepCamera;
				_prep params ["_ppGrain", "_ppColor"];
				{
					_loc = (getMarkerPos [format["BIS_fnc_moduleSector_iconphx_sector%1", _x], nil]);
					if (!isNil "_loc" && (_loc # 0 > 0)) then {
						_objCamera = "camera" camCreate _loc;
						_objPos = [_loc, random 100, random 360] call BIS_fnc_relPos;
						_objCamera camPreparePos [round(random 150) - 75 + _objPos # 0, (_objPos # 1) - 200 + round (random 100), 250 + round (random 200)];
						_objCamera cameraEffect ["internal", "back"];
						_objCamera camPrepareTarget _loc;
						_objCamera camSetFov 0.3;
						_objCamera camSetFocus [-1, -1];
						_objCamera camCommitPrepared 0;
						waitUntil {camCommitted _objCamera};
						
						setAperture 0.5;
						sleep 2;
						screenshot format["nsector%1.png", _x];
						sleep 1;
						_objCamera cameraEffect ["terminate", "back"];
					};
				} forEach [1, 2, 3];
				[_ppGrain, _ppColor] call _cleanup;
			};
		};
		case (phx_gameMode == "adSector"):{// AD SECTOR
			[_prepCamera, _cleanup] spawn {
				params ["_prepCamera", "_cleanup"];
				_prep = call _prepCamera;
				_prep params ["_ppGrain", "_ppColor"];
				{
					_obj = (missionNamespace getVariable [format["phx_sec%1", _x], nil]);
					if (!isNil "_obj") then {
						_objCamera = "camera" camCreate (getPos _obj);
						_objPos = [getPos _obj, random 100, random 360] call BIS_fnc_relPos;
						_objCamera camPreparePos [round(random 150) - 75 + _objPos # 0, (_objPos # 1) - 200 + round (random 100), 250 + round (random 200)];
						_objCamera cameraEffect ["internal", "back"];
						_objCamera camPrepareTarget _obj;
						_objCamera camSetFov 0.3;
						_objCamera camSetFocus [-1, -1];
						_objCamera camCommitPrepared 0;
						waitUntil {camCommitted _objCamera};
						
						setAperture 0.5;
						sleep 2;

						screenshot format["sector%1.png", _x];
						sleep 1;
						_objCamera cameraEffect ["terminate", "back"];
					};
				} forEach [1, 2, 3];
				[_ppGrain, _ppColor] call _cleanup;
			};
		};
		case (phx_gameMode in ["uplink","connection","rush"]): {// TERMINALS
			[_prepCamera, _cleanup] spawn {
				params ["_prepCamera", "_cleanup"];
				_prep = call _prepCamera;
				_prep params ["_ppGrain", "_ppColor"];
				{
					_obj = (missionNamespace getVariable [format["term%1", _x], nil]);
					if (!isNil "_obj") then {
						_objCamera = "camera" camCreate (getPos _obj);
						_objPos = [getPos _obj, random 100, random 360] call BIS_fnc_relPos;
						_objCamera camPreparePos [round(random 150) - 75 + _objPos # 0, (_objPos # 1) - 200 + round (random 100), 250 + round (random 200)];
						_objCamera cameraEffect ["internal", "back"];
						_objCamera camPrepareTarget _obj;
						_objCamera camSetFov 0.3;
						_objCamera camSetFocus [-1, -1];
						_objCamera camCommitPrepared 0;
						waitUntil {camCommitted _objCamera};

						setAperture 0.5;
						sleep 2;
						
						screenshot format["terminal%1.png", _x];
						sleep 1;
						_objCamera cameraEffect ["terminate", "back"];
					};
				} forEach [1, 2, 3];
				[_ppGrain, _ppColor] call _cleanup;
			};
		};


		case (phx_gameMode == "destroy"):{// DESTROY (CACHES)
			[_prepCamera, _cleanup] spawn {
				params ["_prepCamera", "_cleanup"];
				_prep = call _prepCamera;
				_prep params ["_ppGrain", "_ppColor"];
				{
					_obj = _x;
					if (!isNil "_obj" && !isNull _obj) then {
						_objCamera = "camera" camCreate (getPos _obj);
						_objPos = [getPos _obj, round (random 100) - 50, random 360] call BIS_fnc_relPos;
						_objCamera camPreparePos [round(random 150) - 75 + _objPos # 0, (_objPos # 1) - 200 + round (random 100), 250 + round (random 200)];
						_objCamera cameraEffect ["internal", "back"];
						_objCamera camPrepareTarget _objPos;
						_objCamera camSetFov 0.4;
						_objCamera camSetFocus [-1, -1];
						_objCamera camCommitPrepared 0;
						waitUntil {camCommitted _objCamera};

						setAperture 0.5;
						sleep 2;
		
						screenshot format["%1.png", _x];
						sleep 1;
						_objCamera cameraEffect ["terminate", "back"];
					};
				} forEach phx_destroyObjs;
				[_ppGrain, _ppColor] call _cleanup;
			};
		};
	};
};

if (!isMultiplayer) then {
	player addAction [
		"<t color='#00FFFF'>Capture Objective Screenshots</t>",
		{
			_units = entities "";
			_units - [player];
			{
				deleteVehicle _x;
			} forEach _units;
			[] call captureScreenshots;
		},
		nil,
		0,
		false,
		true
	];
};