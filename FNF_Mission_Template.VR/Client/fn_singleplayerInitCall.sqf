/*
	Author: Mallen

	Description:
		Used to make spectator and local testing work correctly

	Parameter(s):
		None

	Returns:
		None
*/

if (isDedicated) exitWith {};

if (typeOf player isEqualTo "ace_spectator_virtual") exitWith {call FNF_ClientSide_fnc_init;};

if (hasInterface and isServer) exitwith
{
  call FNF_ClientSide_fnc_init;

  //on export markers are auto set to 0 alpha to hide stuff from players, this imitates that for sequential Sectors
  _markers = allMapMarkers;
  {
    _alpha = markerAlpha _x;
    if (_alpha isEqualTo 0.99) then
    {
      _x setMarkerAlphaLocal 0;
    };
  } forEach _markers;
};
