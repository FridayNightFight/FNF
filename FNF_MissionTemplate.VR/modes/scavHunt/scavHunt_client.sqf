

// Get present sides
fnf_sidesInMission = [east, west, independent] select {playableSlotsNumber _x > 3};


// CAP ZONE MARKERS
fnf_scavHuntCapZones = [];
{
	private _marker = ("scavHuntCap" + str _x);
	if (((markerPos _marker) select 0) != 0) then {

		fnf_scavHuntCapZones pushBack _marker;

		// hide if side isn't playerside, so long as the player isn't spectating
		if (!(_x isEqualTo playerSide) && !ace_spectator_isset) then {
			_marker setMarkerAlphaLocal 0;
		};
	};
} forEach fnf_sidesInMission;





[{!isNil "fnf_scavHuntTransports" && !isNil "fnf_scavHuntObjs"}, {
	// OBJECTIVES
	{
		// ensure invincibility of objectives
		_x addEventHandler ["Local", {
			params ["_obj", "_isLocal"];
			if (_isLocal) then {
				_obj allowDamage false;
			};
		}];
	} forEach fnf_scavHuntObjs;


	// TRANSPORTS
	{
		// private _truckMarkName = _x getVariable ["truckMarkName", "Truck"];
		private _transportSide = ([_x, true] call BIS_fnc_objectSide);
		private _transportSideColor = [_transportSide, true] call BIS_fnc_sideColor;

		if (playerSide isEqualTo _transportSide) then {

			private _truckID = _x getVariable ["truckID", 0];
			private _truckMarkName = format["Transport%1%2", str _transportSide, _truckID];

			// truck markers for owning side
			private _markStr = [
				_truckMarkName, // markerName
				getPos _x, // markerPos
				"c_car", // markerType
				"ICON", // markerShape
				[0.75, 0.75], //markerSize
				0, // markerDir
				"Solid", //markerBrush
				_transportSideColor, //markerColor
				1, // markerAlpha
				format["Truck %1", _truckID] // markerText
			] joinString '|';

			[format["|%1", _markStr]] call BIS_fnc_stringToMarkerLocal;

			// set handler to update marks
			[{
				_args = (_this # 0);
				_args params ["_truck", "_side", "_markName"];
				_markName setMarkerPosLocal (getPos _truck);
			}, 10, [_x, _transportSide, _truckMarkName]] call CBA_fnc_addPerFrameHandler;
		};


		// ensure invincibility of trucks
		_x addEventHandler ["Local", {
			params ["_truck", "_isLocal"];
			if (_isLocal) then {
				_truck allowDamage false;
			};
		}];



		[{
			// handle wheel removal by re-adding wheel to truck and deleting nearest wheel in 10m
			(_this # 0) params ["_transport"];

			// if (local _transport) then {
			_hitParts = [];
			{
				_hitParts pushBack (configName _x);
			} forEach ([configFile >> "CfgVehicles" >> typeOf _transport >> "HitPoints", 0] call BIS_fnc_returnChildren);
			{
				if (_transport getHitPointDamage _x > 0) then {
					_transport allowDamage true;
					_transport setHitPointDamage [_x, 0];
					_transport allowDamage false;
					private _nearWheels = nearestObjects [_transport, ["ACE_Wheel"], 10, true];
					if (count _nearWheels > 0) then {
						deleteVehicle (_nearWheels # 0)
					};
				};
			} forEach (_hitParts select {['wheel', _x] call BIS_fnc_inString});
			// };
		}, 5, [_x]] call CBA_fnc_addPerFrameHandler;


	} forEach fnf_scavHuntTransports;
}] call CBA_fnc_waitUntilAndExecute;







fnf_scavHuntAnyScore = {
  private _scores = [
    count(fnf_scavHuntObjs select {(_x getVariable ["capturedBy", sideUnknown]) isEqualTo east}),
    count(fnf_scavHuntObjs select {(_x getVariable ["capturedBy", sideUnknown]) isEqualTo west}),
    count(fnf_scavHuntObjs select {(_x getVariable ["capturedBy", sideUnknown]) isEqualTo independent})
  ];

  private _highScore = selectMax _scores;
  (_highScore > 0)
};

[ // at 15 minutes after safe start, or when first score is made, reveal cap zones
  {
    (!(missionNamespace getVariable ["fnf_safetyEnabled", true]) && (cba_missiontime - (missionNamespace getVariable ["fnf_safetyEndTime", 1])) / 60 >= 15) ||
    (call fnf_scavHuntAnyScore)
  },
  {
    {
      _x setMarkerAlphaLocal 1;
    } forEach fnf_scavHuntCapZones;
    ["All capture zones have been revealed!"] remoteExec ["fnf_fnc_hintThenClear",0];
  }
] call CBA_fnc_waitUntilAndExecute;
