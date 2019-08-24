if (!isNull findDisplay 602) then {
  closeDialog 602;
};

if !(isnull ( uinamespace getvariable "RSCDisplayArsenal" )) then {
		_display = ( uinamespace getvariable "RSCDisplayArsenal" );
		_display closeDisplay 2;
	};

if (!isNil "deleteGroundClutterEH") then {
  player removeEventhandler ["put", deleteGroundClutterEH];
};
if (!isNil "grenadeAmmoCapPFH") then {
  [grenadeAmmoCapPFH] call CBA_fnc_removePerFrameHandler;
};
if (!isNil "safeStartZonePFH") then {
  [safeStartZonePFH] call CBA_fnc_removePerFrameHandler;
};
