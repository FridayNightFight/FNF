if !((typeOf player == "B_officer_F") || (typeOf player == "O_officer_F") || (typeOf player == "I_officer_F")) exitWith {};

phx_fnc_leadAdds = {
  actionSelected = 0;
  playerSelected = 0;

  _display = findDisplay 5000;

  _actionsListboxControl = _display displayCtrl 5001;
  _playerListboxControl = _display displayCtrl 5002;

  _actionsListboxControl lbAdd "Teleport to you";
  _actionsListboxControl lbAdd "Teleport to";
  _actionsListboxControl lbAdd "Teleport all group leaders to you";
  _actionsListboxControl lbAdd "Teleport all players to you for briefing";

  unitsOnSide = [];
  {if ((side _x) == playerSide) then {unitsOnSide pushBack _x}} forEach allUnits;
  unitsOnSide deleteAt (unitsOnSide find player);

  _unitNames = [];
  {
    _unitNames pushBack ((name _x) + " - " + ([str (group _x),2] call BIS_fnc_trimString));
  } forEach unitsOnSide;

  _unitNamesSorted = _unitNames call BIS_fnc_sortAlphabetically;

  {
    _playerListboxControl lbAdd _x;
  } forEach _unitNamesSorted;


  unitNamesSortedGlobal = _unitNamesSorted;

  _actionListboxSelect =  _actionsListboxControl ctrlAddEventHandler  ["LBSelChanged",{
    params ["_control", "_selectedIndex"];

    actionSelected = _selectedIndex;
  }];

  _playerListboxSelect =  _playerListboxControl ctrlAddEventHandler  ["LBSelChanged",{
    params ["_control", "_selectedIndex"];

    playerSelected = unitNamesSortedGlobal select _selectedIndex;
    {
      if (([(name _x), playerSelected, false] call BIS_fnc_inString)) then {
        playerSelected = _x;
      };
    } forEach unitsOnSide;
  }];
};

//Group lead UI action
leadAction = player addaction ["<t size='1.5'><t color='#ff0a0a'>Leadership Menu</t>",{createdialog "FNFLeaderMenu"; call phx_fnc_leadAdds;},nil,1.5,false,false,"","_this == _target"];
