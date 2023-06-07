/*
	Author: Mallen

	Description:
		Adds a zone based on markers on the map

	Parameter(s):
		0: STRING -  The prefix used in the marker, should be followed by numbers starting from 1 (Example: testing_marker_)
    1: String -  The name to be displayed on the zone
    1: BOOLEAN -  Whether the zone should be shaded or not
    2: BOOLEAN -  Whether the zone should be inverted

	Returns:
		Boolean
*/

params ["_zonePrefix","_displayName","_shaded","_inverted"];

//get all markers with _zonePrefix
_markerPosArray = [];
_markerColor = getMarkerColor (_zonePrefix + "1");

_markerCounter = 1;
//get all marker positions by seeing if i can create the marker, if i cant it exists
while {createMarkerLocal [(_zonePrefix + (str _markerCounter)), player] == ""} do
{
	_markerPos = getMarkerPos (_zonePrefix + (str _markerCounter));
	deleteMarkerLocal (_zonePrefix + (str _markerCounter));

	_markerPosArray pushBack _markerPos;

	_markerCounter = _markerCounter + 1;
};

//remove the last marker that is created while checking
deleteMarkerLocal (_zonePrefix + (str _markerCounter));

//check if enough markers for a zone have been found
if (count _markerPosArray < 3) exitWith
{
  if (fnf_debug) then
  {
    systemChat "WARNING: Zone with prefix '" + _zonePrefix + "' has less than 3 markers, zone has not generated";
  };
  false;
};

_furthestXValue = [0,0,0];

//set up the positions needed for polyline
_polylineInputs = [];
{
	if (_forEachIndex == ((count _markerPosArray) - 1)) then
	{
		_polylineInputs append [_x select 0, _x select 1, (_markerPosArray select 0) select 0, (_markerPosArray select 0) select 1];
	} else
	{
		_polylineInputs append [_x select 0, _x select 1, (_markerPosArray select (_forEachIndex + 1)) select 0, (_markerPosArray select (_forEachIndex + 1)) select 1];
	};

  if ((_x select 0) > (_furthestXValue select 0)) then
  {
    _furthestXValue = _x;
  };
} forEach _markerPosArray;

//create polyline
_markerPolyline = createMarkerLocal [(_zonePrefix + "polyline"), position player];
_markerPolyline setMarkerShapeLocal "POLYLINE";
_markerPolyline setMarkerPolylineLocal _polylineInputs;
_markerPolyline setMarkerColorLocal _markerColor;

//create display name marker
_markerDisplayName = createMarkerLocal [(_zonePrefix + "displayName"),_furthestXValue];
if (_displayName != "") then
{
  _markerDisplayName setMarkerShapeLocal "ICON";
  _markerDisplayName setMarkerTextLocal _displayName;
  _markerDisplayName setMarkerTypeLocal "DOT";
  _markerDisplayName setMarkerColorLocal "ColorBlack";
};

//shade area
if (_shaded) then
{
  [_markerPosArray, _zonePrefix, _inverted, _markerColor] call FNF_ClientSide_fnc_shadeZone;
};

//add to zone list
fnf_zoneList pushBack [_zonePrefix, _markerPosArray, _markerPolyline, _markerDisplayName];

true;
