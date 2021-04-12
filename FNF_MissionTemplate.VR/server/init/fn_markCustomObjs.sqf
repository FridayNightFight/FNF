// Used for unique marker names
_markerNum = 0;
{
    // Check if object is a Helipad (do not want to mark helipads)
    if (not (_x isKindOf "HeliH")) then {
        // Create marker locally to save network bandwidth
        _marker = createMarkerlocal ["ObjectMarker" + str _markerNum, getPosATL _x];
        
        // increase marker number for unique marker names
        _markerNum = _markerNum + 1;
        
        // format marker and set direction
        _marker setMarkerShapeLocal "Rectangle";
        _marker setMarkerBrushLocal "SolidFull";
        _marker setMarkerColorLocal "ColorBlack";
        _marker setMarkerAlphaLocal 0.25;
        _marker setMarkerDirLocal getDir _x;
        
        // Grab dimensions of bounding box of the object
        _bbr = boundingBoxReal _x;
        _p1 = _bbr select 0;
        _p2 = _bbr select 1;
        _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
        _maxLength = abs ((_p2 select 1) - (_p1 select 1));
        
        // set marker size to size of bounding box
        _marker setMarkersize [_maxWidth / 2, _maxLength / 2];
    };
    // run for everything considered a "Building" placed in editor
} forEach (allMissionObjects "Building");
{
    // Grab name of object
    _name = typeOf _x;
    
    // check for literally just these 3 bridges because they are awkward and not labelled correctly
    if ((_name == "CUP_A2_Road_PMC_bridge_asf_PMC") or (_name == "CUP_A2_Road_Bridge_wood_25") or (_name == "CUP_A2_Road_bridge_asf1_25")) then {
        // Create marker locally to save network bandwidth
        _marker = createMarkerlocal ["ObjectMarker" + str _markerNum, getPosATL _x];
        
        // increase marker number for unique marker names
        _markerNum = _markerNum + 1;
        
        // format marker and set direction
        _marker setMarkerShapeLocal "Rectangle";
        _marker setMarkerBrushLocal "SolidFull";
        _marker setMarkerColorLocal "ColorBlack";
        _marker setMarkerAlphaLocal 0.25;
        _marker setMarkerDirLocal getDir _x;
        
        // Grab dimensions of bounding box of the object
        _bbr = boundingBoxReal _x;
        _p1 = _bbr select 0;
        _p2 = _bbr select 1;
        _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
        _maxLength = abs ((_p2 select 1) - (_p1 select 1));
        
        // set marker size to size of bounding box
        _marker setMarkersize [_maxWidth / 2, _maxLength / 2];
    };
    // run for the base class of the bridges
} forEach (allMissionObjects "Base_CUP_A2_Road");
