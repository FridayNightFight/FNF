[{!isNil "phx_scavHuntTransports"}, {
	{
		private _truckMarkName = _x getVariable ["truckMarkName", "Truck"];
		private _transportSide = ([_x, true] call BIS_fnc_objectSide);

		if (playerSide isEqualTo _transportSide) then {
			[{
				_args = (_this # 0);
				_args params ["_truck", "_side", "_markName"];
				_markName setMarkerPosLocal (getPos _truck);
			}, 10, [_x, _transportSide, _truckMarkName]] call CBA_fnc_addPerFrameHandler;
		} else {
			_truckMarkName setMarkerAlphaLocal 0;
		};
	} forEach phx_scavHuntTransports;
}] call CBA_fnc_waitUntilAndExecute;