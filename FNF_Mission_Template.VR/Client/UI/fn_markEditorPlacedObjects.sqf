/*
	Author: Mallen

	Description:
		Marks custom placed objects on the map provided they aren't excluded

	Parameter(s):
		None

	Returns:
		None
*/

_baseClasses = ["Static","Cargo_base_F"]; //anything that is a subtype of these classes and is big enough will be marked

//checks bounding sphere value to see if object is large enough, not in the blacklist, and not in an excluded start zone
_canMark = {
  params ["_obj"];

  _classBlacklist = ["Land_DataTerminal_01_F","Wreck_Base","FlagCarrierCore","Base_CUP_Plant"];

  if (_obj getVariable ["fnf_autoMarkExclude", false]) exitWith {false};
  _size = (boundingBox _x) select 2;

  _size > 1.5
  and
  {if (_obj isKindOf _x) exitWith {false}; true} forEach _classBlacklist
};

//get buildings to create markers for - only include objects large enough
_objectsToMark = [];
{_objectsToMark append allMissionObjects _x} forEach _baseClasses;
_objectsToMark = _objectsToMark select {_x call _canMark};

_createMarker = {
  params["_obj","_markerNum"];

  // Create marker locally to save network bandwidth
  _marker = createMarkerlocal ["fnf_ObjectMarker" + str _markerNum, getPos _obj];

  // format marker and set direction
  _marker setMarkerShapeLocal "Rectangle";
  _marker setMarkerBrushLocal "SolidFull";
  _marker setMarkerColorLocal "ColorBlack";
  _marker setMarkerDirLocal getDir _obj;

  // Grab dimensions of bounding box of the object
  _bbr = boundingBoxReal _obj;
  _p1 = _bbr select 0;
  _p2 = _bbr select 1;
  _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
  _maxLength = abs ((_p2 select 1) - (_p1 select 1));

  // set marker size to size of bounding box
  _marker setMarkersizeLocal [_maxWidth / 2, _maxLength / 2];
};

// Used for unique marker names
_markerNum = 0;

{
  [_x, _markerNum] call _createMarker;
  _markerNum = _markerNum + 1;
} forEach _objectsToMark;
