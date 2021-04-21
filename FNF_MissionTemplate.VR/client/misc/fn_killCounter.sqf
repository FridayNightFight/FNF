/*
Creates and update kill count display
*/

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
  _kills = acex_killtracker_killcount;

  {
    if ("Friendly Fire" in _x) then {
      _kills = _kills - 2; //subtract 2 because ff kill still adds 1 to kill count
    };
  } forEach acex_killtracker_eventsarray;

  _setText ctrlSetStructuredText parseText (format ["Round Kills: %1", _kills]);
}, 1] call CBA_fnc_addPerFrameHandler;
