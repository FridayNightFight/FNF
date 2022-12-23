disableSerialization;

fnf_playerNumberDisplayActive = false;

//Create displays in top right
("playerNumberRsc" call BIS_fnc_rscLayer) cutRsc ["playerNumberStructText", "PLAIN"];
//If displays weren't created then exit the script
if (uiNameSpace getVariable "playerNumberStructText" isEqualTo displayNull) exitWith {hint "playerNumberTracker display not defined in description.ext"};

fnf_killCountUI_PFH = [{
  params ["_handle"];

  //Update text in the displays to match the points markers
  _display = uiNameSpace getVariable "playerNumberStructText";
  _setText = _display displayCtrl 1005;

  _westCount = 0;
  _eastCount = 0;
  _guerCount = 0;

  {
    switch (side _x) do
    {
      case west: {_westCount = _westCount + 1};
      case east: {_eastCount = _eastCount + 1};
      case independent: {_guerCount = _guerCount + 1};
    };
  } forEach allPlayers;

  _attackingNumber = 0;
  _defendingNumber = 0;

  switch (fnf_attackingSide) do
  {
    case west: {_attackingNumber = _westCount};
    case east: {_attackingNumber = _eastCount};
    case independent: {_attackingNumber = _guerCount};
  };
  switch (fnf_defendingSide) do
  {
    case west: {_defendingNumber = _westCount};
    case east: {_defendingNumber = _eastCount};
    case independent: {_defendingNumber = _guerCount};
  };

  _totalNumber = _attackingNumber + _defendingNumber;

  _advantage = (((((_totalNumber / 2) - _defendingNumber) * 2) / _totalNumber) * 100);

  _setText ctrlSetStructuredText parseText (format ["%1: %2<br/>%3: %4<br/>ADVANTAGE: %5%6</t>", fnf_attackingSide, _attackingNumber, fnf_defendingSide, _defendingNumber, _advantage, "%"]);
}, 1] call CBA_fnc_addPerFrameHandler;

("playerNumberRsc" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
