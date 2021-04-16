private _baseClasses = ["Static"]; //anything that is a subtype of these classes and is big enough will be marked
private _blacklist = ["Land_DataTerminal_01_F","Wreck_Base"]; //blacklist of item or parent classes to never mark

//checks bounding sphere value to see if object is large enough to mark and also not in the blacklist
_canMark = {
  params ["_obj"];
  //private _size = getNumber (configFile >> "CfgVehicles" >> typeOf _obj >> "mapSize");
  private _size = (boundingBox _x) select 2;

  _size > 1.5
  &&
  {if (_obj isKindOf _x) exitWith {false}; true} forEach _blacklist;
};

//get buildings to create markers for - only include objects large enough
private _objectsToMark = [];
{_objectsToMark append allMissionObjects _x} forEach _baseClasses;
_objectsToMark = _objectsToMark select {_x call _canMark};

// Used for unique marker names
private _markerNum = 0;

_createMarker = {
  private _obj = _this;

  // Create marker locally to save network bandwidth
  private _marker = createMarkerlocal ["ObjectMarker" + str _markerNum, getPos _obj];

  // increase marker number for unique marker names
  _markerNum = _markerNum + 1;

  // format marker and set direction
  _marker setMarkerShapeLocal "Rectangle";
  _marker setMarkerBrushLocal "SolidFull";
  //_marker setMarkerColorLocal "ColorGrey";
  _marker setMarkerColorLocal "ColorBlack";
  //_marker setMarkerAlphaLocal 0.5;
  _marker setMarkerDirLocal getDir _obj;

  // Grab dimensions of bounding box of the object
  _bbr = boundingBoxReal _obj;
  _p1 = _bbr select 0;
  _p2 = _bbr select 1;
  _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
  _maxLength = abs ((_p2 select 1) - (_p1 select 1));

  // set marker size to size of bounding box
  _marker setMarkersize [_maxWidth / 2, _maxLength / 2];
};

{_x call _createMarker} forEach _objectsToMark;
