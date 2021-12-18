/*
Creates and update mission time remaining display
*/

if (!hasInterface) exitWith {};

disableSerialization;
//Create displays in bottom left
("timeRsc" call BIS_fnc_rscLayer) cutRsc ["timeleftStructText", "PLAIN"];
//If displays weren't created then exit the script
if (uiNameSpace getVariable "timeleftStructText" isEqualTo displayNull) exitWith {hint "TIMELEFT display not defined in description.ext"};

phx_safeStartTimeUI_PFH = [{
  params ["_missionTime", "_handle"];

  //Update text in the displays to match the points markers
  _display = uiNameSpace getVariable "timeleftStructText";
  _setText = _display displayCtrl 1003;
  if (missionNamespace getVariable ["phx_safetyEnabled", true]) then {
    _setText ctrlSetStructuredText parseText (format ["Safe Start Remaining: %1", [f_var_mission_timer, "MM:SS"] call BIS_fnc_secondsToString]);
  } else {
    uiNameSpace getVariable "timeleftStructText" closeDisplay 1;
    [_handle] call CBA_fnc_removePerFrameHandler;
  };
}, 1] call CBA_fnc_addPerFrameHandler;
