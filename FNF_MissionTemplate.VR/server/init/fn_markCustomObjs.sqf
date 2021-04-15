//objects that don't inherit from buildings class that still need a mark
private _notBuilding = ["CUP_A2_Road_PMC_bridge_asf_PMC", "CUP_A2_Road_Bridge_wood_25", "CUP_A2_Road_bridge_asf1_25"];

//Function to check if object is large enough to deserve a marker
_isBigEnough = {
  private _box = boundingBox _this;
  _box select 2 > 8;
};

//get buildings to create markers for - only include objects large enough
private _objectsToMark = allMissionObjects "Building";
_objectsToMark append ((allMissionObjects "Base_CUP_A2_Road") select {(typeOf _x) in _notBuilding});
_objectsToMark = _objectsToMark select {_x call _isBigEnough};

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
  _marker setMarkerColorLocal "ColorBlack";
  _marker setMarkerAlphaLocal 0.5;
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
