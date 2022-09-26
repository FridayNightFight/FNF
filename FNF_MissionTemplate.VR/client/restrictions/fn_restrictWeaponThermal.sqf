/*
Restricts switching camera views on certain weapons with thermals.
*/

fnf_restrictedThermalViews = ["launch_O_Vorona_green_F", "launch_O_Vorona_brown_F"];

[{!isNull findDisplay 46}, {
  (findDisplay 46) displayAddEventHandler ["KeyDown", {
    if (_this select 1 in actionKeys 'nightVision' && currentWeapon vehicle player in fnf_restrictedThermalViews && cameraView == "GUNNER") then { true } else { false };
  }];
}] call CBA_fnc_waitUntilAndExecute;
