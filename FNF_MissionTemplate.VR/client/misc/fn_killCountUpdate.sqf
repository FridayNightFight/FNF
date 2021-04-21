/*
Creates and update kill count display
*/

if (!hasInterface) exitWith {};

disableSerialization;

//Create displays in top right
("killRsc" call BIS_fnc_rscLayer) cutRsc ["killcountStructText", "PLAIN"];
//If displays weren't created then exit the script
if (uiNameSpace getVariable "killcountStructText" isEqualTo displayNull) exitWith {hint "KILLCOUNT display not defined in description.ext"};

phx_killCountUI_PFH = [{
  params ["_handle"];

  //Update text in the displays to match the points markers
  _display = uiNameSpace getVariable "killcountStructText";
  _setText = _display displayCtrl 1004;
  _killInt = acex_killtracker_killcount;
  _friendlyFires = 0;
  _forEachIndex = 0;
  while {_forEachIndex < count acex_killtracker_eventsarray} do {
    (_array select _forEachIndex) call code;
    if ((acex_killtracker_eventsarray select _forEachIndex) find "Friendly Fire" != -1) then {
      _friendlyFires = _friendlyFires + 1;
    };
    _forEachIndex = _forEachIndex + 1;
  };

  _killInt = _killInt - _friendlyFires;
  _setText ctrlSetStructuredText parseText (format ["Round Kills: %1",str _killInt]);
}, 1] call CBA_fnc_addPerFrameHandler;
