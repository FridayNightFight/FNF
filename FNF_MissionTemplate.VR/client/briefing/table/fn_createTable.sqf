/*
 * Author: Seb, with optimisations by Leopard20
 *
 * This function creates a minified representation of a marker area on a table, both given as arguments. It
 *
 * Arguments:
 * 0: Table on which to create the minified representation. If a minified representation already exists, it will be cleared before starting. <OBJECT>
 * 1: AREA marker string representation (i.e "marker_0") <STRING>
 * 2: Optional  <NUMBER> (default: 20) - Terrain resolution (x*y resolution of terrain cubes). Setting this too high will be VERY laggy.
 * 4: Optional  <NUMBER> (default: 1) - Scale multiplier. 3 = map is 3x the size of the table. Useful for spanning multiple tables.
 * 4: Optional <BOOL> (default: true). Use terrain. If false then the map will be entirely flat. Just like the earth ;)
 * 5: Optional <BOOL> (default: true) - Create environment sounds tirgger:
 *                                      Create a trigger that disables envionmental sounds when the current unit comes near, and puts it back to its original state when the player leaves.
 *                                      This is because all the bushes that appear on the table will still play cricket sounds, buildings will play air conditoner hums etc.
 * 6: Optional <NUMBER> (default: 0) - Offset Z height. If your map doesn't fit on your table quite right, use this to tweak how high the entire thing shows up.
 *
 * Return Value:
 * NONE
 *
 * Example:
 *   TABLE OBJECT INIT:
 *      [this, "marker_0", 20, 1, true, true, 0] call fnf_briefing_fnc_createTable;
 *
 *   SCRIPT CALL (Multiplayer & Join in progress COMPATIBLE):
 *      [table, "marker_0", 20, 1, true, true, 0] remoteExec ["fnf_briefing_fnc_createTable", 0, table];
 *
 *  NEVER EVER EVER REMOTEXEC FROM OBJECT INIT!
 *
 * Public: [No]
 */
if !(hasInterface) exitWith {};
params [
    "_table",
    "_marker",
    "_viewName",
    ["_terrainResolution", 20],
    ["_scaleMultiplier", 1],
    ["_useTerrainHeight", true],
    ["_createTrigger", true],
    ["_manualZoffset", 0]
];

if (isNil "_table"// || {
    // isNull _table || {
    //     _marker == "" || {
    //         private _temp = createMarkerLocal [_marker, [0,0,0]];
    //         deleteMarkerLocal _temp;
    //         _temp != "" //a duplicate marker should fail; otherwise this marker didn't exist at all
    //     }
    // }
    // isNull _table
// }
) exitWith {
  systemChat "Failed to load table";
};

if (isNull _table) exitWith {
  systemChat "Failed to load table";
};

// ["LoadTable", ""] call BIS_fnc_startLoadingScreen;

_table enableSimulation false;
[_table, nil, true] call fnf_briefing_fnc_clearTable;
private _tableObjects = [];

private _bbr = 2 boundingBoxReal _table;
private _p1 = _bbr#0;
private _p2 = _bbr#1;
private _tableWidth = abs ((_p2#0) - (_p1#0));
private _tableLength = abs ((_p2#1) - (_p1#1));
private _tableHeight = abs ((_p2#2) - (_p1#2));

private _markerDir = markerDir _marker;
private _markerPos = getMarkerPos _marker;
private _markerSize = getMarkerSize _marker;
private _maxSize = _markerSize#0 max _markerSize#1; // longest edge of marker
// _marker setMarkerSizeLocal [_maxSize, _maxSize]; // Marker must be square

private _tableDir = getDir _table;
private _tableSize = ((_tableWidth min _tableLength) / 2) * _scaleMultiplier * 0.9;    // Gets shortest edge of table. Why do I have to divide by 2???????????????
private _scale = _tableSize/_maxSize; // fit longest edge of marker on table

private _squareDist = sqrt (2*_maxSize*_maxSize);
private _objects = (nearestTerrainObjects [_markerPos, [],  _squareDist, false, true]) inAreaArray _marker; // Terrian objects
_objects append ((_markerPos nearObjects ["Static", _squareDist]) inAreaArray _marker); // Will pick up custom placed objects, but contains duplicates from above
_objects = _objects arrayIntersect _objects; // removes duplicates



// exclusions
// don't get anything below terrain, to exclude destroyed and non-hidden objects
// don't get any fortification objects, to avoid metagaming defensive zones
_objects = _objects select {
  (getPosATL _x) select 2 > -10 &&
  !(isObjectHidden _x) &&
  {(((boundingBoxReal  _x)#2) * _scale * getObjectScale _x ) > 0.005} &&
  isNil {_x getVariable "fnf_isFortifyObject"}
};

private _dummy = "Land_HelipadEmpty_F" createVehicleLocal _markerPos;
_markerPos set [2, (0 max getTerrainHeightASL _markerPos) + 1];
_dummy enableSimulation false;
_dummy setPosASL _markerPos;
_dummy setDir _markerDir;

private _zOffset = if (_useTerrainHeight) then {
  private _minHeight = 100000;
  {
    _minHeight = _minHeight min (getPosASL _x)#2;
  } forEach _objects;
  (getPosASL _dummy#2) - _minHeight
} else {
  0
};
private _vectorDiff = [0, 0, _tableHeight/2 + (_zOffset * _scale) + 0.05 + _manualZoffset]; // neatly fit all the stuff on the top of the table

{
  private _model = _x getVariable ["originalModel", (getModelInfo _x)#1];
  if (_model != "") then {
    isNil {
      private _relCentre = _dummy worldToModel (ASLtoAGL getPosWorld _x);
      private _relVectDir = _dummy vectorWorldToModel (vectorDir _x);
      private _relVectUp = _dummy vectorWorldToModel (vectorUp _x);
      // private _tableObj = createSimpleObject [_model, [0, 0, 0], true];
      private _tableObj = [[
          "",
          _model
        ],
        [0,0,0],
        0,
        false, // followTerrain
        true, // force superSimpleObject
        true // local
      ] call BIS_fnc_createSimpleObject;

      private _scaledPos = _relCentre vectorMultiply _scale;
      private _newPos = if (_useTerrainHeight) then {
        (_table modelToWorldWorld (_scaledPos vectorAdd _vectorDiff))
      } else {
        _table modelToWorldWorld (_scaledPos vectorAdd _vectorDiff)
      };
      _tableObj setPosWorld _newPos;
      _tableObj setVectorDirAndUp [_table vectorModelToWorld _relVectDir, _table vectorModelToWorld _relVectUp];
      _tableObj setObjectScale _scale * getObjectScale _x;
      _tableObjects pushBack _tableObj;
    };
  };
} forEach _objects;

if (!isNil "fnf_briefingTable_highlightAreas") then {
  {
    _x params ["_position", "_size"];
    if !(_position inArea _marker) then {continue};
    if (typeName _size == "ARRAY") then {_size = _size#0};
    _size = _size * 2;

    private _relCentre = _dummy worldToModel _position;
    private _relVectDir = _dummy vectorWorldToModel [0,1,0];
    private _relVectUp = _dummy vectorWorldToModel [0,0,1];
    // private _tableObj = [[
    //     "",
    //     "a3\structures_f_heli\vr\helpers\sign_sphere100cm_f.p3d"
    //   ],
    //   [0,0,0],
    //   0,
    //   false, // followTerrain
    //   false, // force superSimpleObject
    //   true // local
    // ] call BIS_fnc_createSimpleObject;

    private _tableObj = createSimpleObject ["Sign_Sphere100cm_F", [0,0,0], true];
    _tableObj enableSimulation false;

    private _scaledPos = _relCentre vectorMultiply _scale;
    private _newPos = if (_useTerrainHeight) then {
      (_table modelToWorldWorld (_scaledPos vectorAdd _vectorDiff))
    } else {
      _table modelToWorldWorld (_scaledPos vectorAdd _vectorDiff)
    };
    _tableObj setPosWorld _newPos;
    _tableObj setVectorDirAndUp [_table vectorModelToWorld _relVectDir, _table vectorModelToWorld _relVectUp];
    _tableObj setObjectScale (_size * _scale);
    _tableObj setObjectTexture [0, "#(argb,8,8,3)color(1,0.8,0.1,0.03,ca)"];
    _tableObjects pushBack _tableObj;
  } forEach fnf_briefingTable_highlightAreas;
};

// private _roadsToRender = [];
private _roadMaterials = createHashMapFromArray [
  ["HIDE", ["a3\roads_f\roads_new\data\Path_ca.paa", "a3\roads_f\roads_new\data\Path.rvmat"]],
  ["ROAD", ["a3\roads_f\roads_new\data\Highway_CA.paa", "a3\roads_f\roads_new\data\Highway.rvmat"]],
  ["MAIN ROAD", ["a3\roads_f\roads_new\data\city_road_CA.paa", "a3\roads_f\roads_new\data\city_road.rvmat"]],
  ["TRACK", ["a3\roads_f\roads_new\data\Road_CA.paa", "a3\roads_f\roads_new\data\Road.rvmat"]],
  ["TRAIL", ["a3\roads_f\roads_new\data\Path_ca.paa", "a3\roads_f\roads_new\data\Path.rvmat"]]
];

private _step = 2/_terrainResolution;
private _dirAndUp = [vectorDir _table, vectorUp _table];
for "_posX" from -1 to 1 step _step do {
  isNil {
    for "_posY" from -1 to 1 step _step do {
      isNil {
        private _tablePos = [_posX*_tableSize, _posY*_tableSize, 0];
        private _worldPos = (_dummy modelToWorld (_tablePos vectorMultiply 1/_scale)); // divide by scale to scale back up
        private _texture = surfaceTexture _worldPos;
        private _material = "\a3\data_f\default.rvmat";

        // {
        //   _roadsToRender pushBack _x;
        // } forEach ((_worldPos nearRoads _terrainResolution) apply {[getPos _x, _x]});
        private "_dir";
        private _road = roadAt (_worldPos select [0,2]);
        if (!isNull _road) then {
          private _roadInfo = getRoadInfo _road;
          if !(_roadInfo#8) then {
            _material = (_roadMaterials get _roadInfo#0)#1;
            _texture = (_roadMaterials get _roadInfo#0)#0;
            _dir = (_roadInfo#6) getDir (_roadInfo#7);
          };
        };

        if (surfaceIsWater _worldPos) then {
          _texture = "#(rgb,8,8,3)color(0.2,0.3,0.8,0.2,dt)";
          // _texture = getText(configfile >> "CfgMaterials" >> "Water" >> "Stage1" >> "texture");
          // _texture = selectRandom([
          //   getText(configfile >> "CfgMaterials" >> "Water" >> "Stage1" >> "texture"),
          //   "\a3\data_f\SeaTexture_CO.paa"
          // ]);
        };

        private _normal = vectorUp _table;
        private _cubeSize = _step * _tableSize;
        if (_useTerrainHeight) then {
          private _normals = [];
          private _averageStep = _step/2;
          // Sample normals over cube area:
          for "_normalX" from -2*_averageStep to 2*_averageStep step _averageStep do {
              for "_normalY" from -2*_averageStep to 2*_averageStep step _averageStep do {
                  private _checkPos = _worldPos vectorAdd [_normalX, _normalY];
                  _normals pushBack (surfaceNormal _checkPos);
              };
          };
          {
              _normal = _normal vectorAdd _x;
          } forEach _normals;
          // You don't need to average the normals for the normal to look good.
          // _normal = _normal vectorMultiply 1/count _normals;
          // I have no idea why.
          _normal = [_normal, _tableDir -_markerDir, 2] call BIS_fnc_rotateVector3D; // Not sure why I have to do this.
          private _cos = abs (vectorUp _table vectorCos _normal);
          private _dynamicSize = 1.1/_cos; // scale cubes based on angle
          _cubeSize = _cubeSize * _dynamicSize; //
          _tablePos set [2, -(_worldPos#2 * _scale + _cubeSize/(2*_cos) + 0.5)]; // Z flip from worldpos. wtf?.
        } else {
          _tablePos set [2, -0.5 - _cubeSize/2]
        };
        private _groundObject = createSimpleObject ["Land_VR_Shape_01_cube_1m_F", [0,0,0], true];
        _groundObject enableSimulation false;
        _groundObject setPosASL (_table modelToWorldWorld (_tablePos vectorAdd _vectorDiff));
        _groundObject setVectorDirAndUp _dirAndUp;
        if (!isNil "_dir") then {_groundObject setDir _dir};
        _groundObject setVectorUp _normal;
        for "_selection" from 0 to 6 do {
            _groundObject setObjectMaterial [_selection, _material];
            _groundObject setObjectTexture [_selection, _texture];
        };
        _groundObject setObjectScale _cubeSize;
        _tableObjects pushBack _groundObject;
      };
    };
  };
  sleep 0.012;
};


_table setVariable ["sebs_briefing_table_tableObjects", _tableObjects];
_table setVariable ["loadedView", _viewName];
deleteVehicle _dummy;

if (_createTrigger) then {
  _trg = createTrigger ["EmptyDetector", getPos _table, false];
  _trg setTriggerArea [_tableSize + 15, _tableSize + 15, getDir _table, true];
  if (isNil {sebs_briefing_table_originalEnv}) then {
    sebs_briefing_table_originalEnv = environmentEnabled
  };
  _trg setTriggerActivation ["NONE", "PRESENT", true];
  _trg setTriggerStatements [
    "player inArea thisTrigger",
    "enableEnvironment false",
    "enableEnvironment sebs_briefing_table_originalEnv"
  ];
  _trg setTriggerInterval 1;
  _tableObjects pushBack _trg;
};

if !(_table getVariable ["seb_briefing_table_hasDeletedEH", false]) then {
  _table addEventHandler ["Deleted", {
    params ["_entity"];
    _tableObjects = _entity getVariable ["sebs_briefing_table_tableObjects", []];
    reverse _tableObjects;
    [{_this spawn fnf_briefing_fnc_clearTable}, [_entity, _tableObjects], 3] call CBA_fnc_waitAndExecute;
    _markers = _entity getVariable ["tableTarget", []];
    if (count _markers == 3) then {
      {deleteMarkerLocal _x} forEach (_markers select [1, 2]);
    };
  }];
  _table setVariable ["seb_briefing_table_hasDeletedEH", true];
};

// "LoadTable" call BIS_fnc_endLoadingScreen;
