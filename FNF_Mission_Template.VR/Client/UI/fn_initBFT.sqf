/*
	Author: Mallen

	Description:
    Creates markers to display players with LR radios on map

	Parameter(s):
		None

	Returns:
		None
*/

_markerType = "b_inf";
switch (playerSide) do {
  case east: {_markerType = "o_inf";};
  case independent: {_markerType = "n_inf";};
};


[{
  //delete all previous markers
  _markers = allMapMarkers;
  {
    if (_x find "HK_BFT_SYSTEM_LR_" isNotEqualTo -1) then
    {
      deleteMarkerLocal _x;
    };
  } forEach _markers;

  _allPlayers = call BIS_fnc_listPlayers;
  _allPlayers = _allPlayers select {(backpack _x) in [
  "TFAR_mr3000_rhs",
  "UK3CB_LSM_B_B_CARRYALL_RADIO_OLI",
  "UK3CB_BAF_B_Bergen_MTP_Radio_H_B",
  "UK3CB_LNM_O_B_CARRYALL_RADIO_WDL_02",
  "TFAR_mr3000",
  "UK3CB_LSM_B_B_CARRYALL_RADIO_OLI"]};
  _allPlayers = _allPlayers select {(side _x) isEqualTo playerSide};

  {
    _playerName = name _x;
    _pos = getPos _x;
    _marker = createMarkerLocal [("HK_BFT_SYSTEM_LR_" + _playerName), _pos];
    _marker setMarkerShapeLocal "ICON";
    _marker setMarkerTypeLocal (_this select 0);

    _marker setMarkerTextLocal ((groupId (group _x)) + " (" + _playerName + ")");
  } forEach _allPlayers;
}, 1, _markerType] call CBA_fnc_addPerFrameHandler;
