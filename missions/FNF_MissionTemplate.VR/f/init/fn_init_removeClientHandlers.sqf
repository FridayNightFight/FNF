if (!isNil "safeStartZonePFH") then {
  [safeStartZonePFH] call CBA_fnc_removePerFrameHandler;
  safeStartZonePFH = nil;
};
