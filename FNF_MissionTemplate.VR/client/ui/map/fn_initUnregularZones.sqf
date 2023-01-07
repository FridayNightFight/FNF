//playzone generation
if (isNil "zoneTrigger") then {
  _boundryMarkers = [];
  {
    if (_x regexMatch "^fnf_custom_zoneBoundary_1_marker_\d+$") then
    {
      _boundryMarkers pushBack (_x);
    };
  } forEach allMapMarkers;

  _boundryMarkers = [_boundryMarkers, [], {
    _results = _x regexFind ["\d+", 0];
    parseNumber (((_results select 1) select 0) select 0);
  }] call BIS_fnc_sortBy;

  [_boundryMarkers, "ColorBlack"] call fnf_ui_fnc_genPolylineFromMarkers;
  [_boundryMarkers, [0,0,0,0.5], true] call fnf_ui_fnc_triangulateAndShadePolygon;
} else {
  _markersToDelete = [];
  {
    if (_x regexMatch "^fnf_custom_zoneBoundary_1_marker_\d+$") then
    {
      _markersToDelete pushBack _x;
    };
  } forEach allMapMarkers;
  {
    deleteMarkerLocal _x;
  } forEach _markersToDelete;
};

//safezone generation
if (fnf_gameMode != "sustainedAssault") then
{
  //array key: [[normal_safezone, true], [[not_normal_safezone_markers], false]]
  _westSafeZones = [];
  _eastSafeZones = [];
  _guerSafeZones = [];

  _markersToDelete = [];

  {
    _matchFound = false;
    if (_x regexMatch "^west_safeZone_marker_\d+$") then
    {
      _westSafeZones pushBack [_x, true];
      _results = _x regexFind ["\d+", 0];
      _zoneNumber = parseNumber (((_results select 0) select 0) select 0);
      _indexToDeleteFrom = -1;
      {
        if (!(_x select 1)) then {
          _results = ((_x select 0) select 0) regexFind ["\d+", 0];
          _checkingZoneNumber = parseNumber (((_results select 0) select 0) select 0);
          if (_zoneNumber == _checkingZoneNumber) then
          {
            _indexToDeleteFrom = _forEachIndex;
          };
        };
      } forEach _westSafeZones;
      if (_indexToDeleteFrom != -1) then
      {
        {
          _markersToDelete pushBack _x;
        } forEach ((_westSafeZones select _indexToDeleteFrom) select 0);
        _westSafeZones deleteAt _indexToDeleteFrom;
      };
    };
    if (_x regexMatch "^east_safeZone_marker_\d+$") then
    {
      _eastSafeZones pushBack [_x, true];
      _results = _x regexFind ["\d+", 0];
      _zoneNumber = parseNumber (((_results select 0) select 0) select 0);
      _indexToDeleteFrom = -1;
      {
        if (!(_x select 1)) then {
          _results = ((_x select 0) select 0) regexFind ["\d+", 0];
          _checkingZoneNumber = parseNumber (((_results select 0) select 0) select 0);
          if (_zoneNumber == _checkingZoneNumber) then
          {
            _indexToDeleteFrom = _forEachIndex;
          };
        };
      } forEach _eastSafeZones;
      if (_indexToDeleteFrom != -1) then
      {
        {
          _markersToDelete pushBack _x;
        } forEach ((_eastSafeZones select _indexToDeleteFrom) select 0);
        _eastSafeZones deleteAt _indexToDeleteFrom;
      };
    };
    if (_x regexMatch "^guer_safeZone_marker_\d+$") then
    {
      _guerSafeZones pushBack [_x, true];
      _results = _x regexFind ["\d+", 0];
      _zoneNumber = parseNumber (((_results select 0) select 0) select 0);
      _indexToDeleteFrom = -1;
      {
        if (!(_x select 1)) then {
          _results = ((_x select 0) select 0) regexFind ["\d+", 0];
          _checkingZoneNumber = parseNumber (((_results select 0) select 0) select 0);
          if (_zoneNumber == _checkingZoneNumber) then
          {
            _indexToDeleteFrom = _forEachIndex;
          };
        };
      } forEach _guerSafeZones;
      if (_indexToDeleteFrom != -1) then
      {
        {
          _markersToDelete pushBack _x;
        } forEach ((_guerSafeZones select _indexToDeleteFrom) select 0);
        _guerSafeZones deleteAt _indexToDeleteFrom;
      };
    };
    if (_x regexMatch "^fnf_custom_safeZone_west_\d+_marker_\d+$") then
    {
      _results = _x regexFind ["\d+", 0];
      _zoneNumber = parseNumber (((_results select 0) select 0) select 0);
      _needNewSafeZone = true;
      _indexToAddTo = -1;
      {
        if (_x select 1) then {
          if (_x select 0 == "west_safeZone_marker_" + str _zoneNumber) then
          {
            _needNewSafeZone = false;
          };
        } else {
          _results = ((_x select 0) select 0) regexFind ["\d+", 0];
          _checkingZoneNumber = parseNumber (((_results select 0) select 0) select 0);
          if (_zoneNumber == _checkingZoneNumber) then
          {
            _needNewSafeZone = false;
            _indexToAddTo = _forEachIndex;
          };
        };
      } forEach _westSafeZones;
      if (_indexToAddTo != -1) then
      {
        ((_westSafeZones select _indexToAddTo) select 0) pushBack _x;
      };
      if (_indexToAddTo == -1 && !_needNewSafeZone) then
      {
        _markersToDelete pushBack _x;
      };
      if (_needNewSafeZone) then
      {
        _westSafeZones pushBack [[_x], false];
      };
    };
    if (_x regexMatch "^fnf_custom_safeZone_east_\d+_marker_\d+$") then
    {
      _results = _x regexFind ["\d+", 0];
      _zoneNumber = parseNumber (((_results select 0) select 0) select 0);
      _needNewSafeZone = true;
      _indexToAddTo = -1;
      {
        if (_x select 1) then {
          if (_x select 0 == "east_safeZone_marker_" + str _zoneNumber) then
          {
            _needNewSafeZone = false;
          };
        } else {
          _results = ((_x select 0) select 0) regexFind ["\d+", 0];
          _checkingZoneNumber = parseNumber (((_results select 0) select 0) select 0);
          if (_zoneNumber == _checkingZoneNumber) then
          {
            _needNewSafeZone = false;
            _indexToAddTo = _forEachIndex;
          };
        };
      } forEach _eastSafeZones;
      if (_indexToAddTo != -1) then
      {
        ((_eastSafeZones select _indexToAddTo) select 0) pushBack _x;
      };
      if (_indexToAddTo == -1 && !_needNewSafeZone) then
      {
        _markersToDelete pushBack _x;
      };
      if (_needNewSafeZone) then
      {
        _eastSafeZones pushBack [[_x], false];
      };
    };
    if (_x regexMatch "^fnf_custom_safeZone_guer_\d+_marker_\d+$") then
    {
      _results = _x regexFind ["\d+", 0];
      _zoneNumber = parseNumber (((_results select 0) select 0) select 0);
      _needNewSafeZone = true;
      _indexToAddTo = -1;
      {
        if (_x select 1) then {
          if (_x select 0 == "guer_safeZone_marker_" + str _zoneNumber) then
          {
            _needNewSafeZone = false;
          };
        } else {
          _results = ((_x select 0) select 0) regexFind ["\d+", 0];
          _checkingZoneNumber = parseNumber (((_results select 0) select 0) select 0);
          if (_zoneNumber == _checkingZoneNumber) then
          {
            _needNewSafeZone = false;
            _indexToAddTo = _forEachIndex;
          };
        };
      } forEach _guerSafeZones;
      if (_indexToAddTo != -1) then
      {
        ((_guerSafeZones select _indexToAddTo) select 0) pushBack _x;
      };
      if (_indexToAddTo == -1 && !_needNewSafeZone) then
      {
        _markersToDelete pushBack _x;
      };
      if (_needNewSafeZone) then
      {
        _guerSafeZones pushBack [[_x], false];
      };
    };
  } forEach allMapMarkers;

  {
    deleteMarkerLocal _x;
  } forEach _markersToDelete;

  //safezones established, extra markers deleted, start triangulation and shading

  {
    if (!(_x select 1)) then
    {
      _boundryMarkers = [_x select 0, [], {
        _results = _x regexFind ["\d+", 0];
        parseNumber (((_results select 1) select 0) select 0);
      }] call BIS_fnc_sortBy;

      if (fnf_enemyStartVisible || playerSide == west || playerSide == sideLogic) then
      {
        [_boundryMarkers, "ColorWEST"] call fnf_ui_fnc_genPolylineFromMarkers;
        [_boundryMarkers, [0,0.3,0.6,0.5], false] call fnf_ui_fnc_triangulateAndShadePolygon;
      } else {
        {
          _x setMarkerTypeLocal "Empty";
          _x setMarkerTextLocal "";
        } forEach _boundryMarkers;
      };
    } else {
      if (!fnf_enemyStartVisible && playerSide != west && playerSide != sideLogic) then
      {
        _markerPos = getMarkerPos (_x select 0);
        deleteMarkerLocal (_x select 0);
        createMarkerLocal [(_x select 0), _markerPos];
      }
    };
  } forEach _westSafeZones;

  {
    if (!(_x select 1)) then
    {
      _boundryMarkers = [_x select 0, [], {
        _results = _x regexFind ["\d+", 0];
        parseNumber (((_results select 1) select 0) select 0);
      }] call BIS_fnc_sortBy;

      if (fnf_enemyStartVisible || playerSide == east || playerSide == sideLogic) then
      {
        [_boundryMarkers, "ColorEAST"] call fnf_ui_fnc_genPolylineFromMarkers;
        [_boundryMarkers, [0.5,0,0,0.5], false] call fnf_ui_fnc_triangulateAndShadePolygon;
      } else {
        {
          _x setMarkerTypeLocal "Empty";
          _x setMarkerTextLocal "";
        } forEach _boundryMarkers;
      };
    } else {
      if (!fnf_enemyStartVisible && playerSide != east && playerSide != sideLogic) then
      {
        _markerPos = getMarkerPos (_x select 0);
        deleteMarkerLocal (_x select 0);
        createMarkerLocal [(_x select 0), _markerPos];
      }
    };
  } forEach _eastSafeZones;

  {
    if (!(_x select 1)) then
    {
      _boundryMarkers = [_x select 0, [], {
        _results = _x regexFind ["\d+", 0];
        parseNumber (((_results select 1) select 0) select 0);
      }] call BIS_fnc_sortBy;

      if (fnf_enemyStartVisible || playerSide == independent || playerSide == sideLogic) then
      {
        [_boundryMarkers, "ColorGUER"] call fnf_ui_fnc_genPolylineFromMarkers;
        [_boundryMarkers, [0,0.5,0,0.5], false] call fnf_ui_fnc_triangulateAndShadePolygon;
      } else {
        {
          _x setMarkerTypeLocal "Empty";
          _x setMarkerTextLocal "";
        } forEach _boundryMarkers;
      };
    } else {
      if (!fnf_enemyStartVisible && playerSide != independent && playerSide != sideLogic) then
      {
        _markerPos = getMarkerPos (_x select 0);
        deleteMarkerLocal (_x select 0);
        createMarkerLocal [(_x select 0), _markerPos];
      }
    };
  } forEach _guerSafeZones;

  [
  {
    missionNamespace getVariable ["fnf_markCustomObjs_ready", false] &&
    missionNamespace getVariable ["fnf_serverSetupGame", false]
  }, {
    _safeMarkers = [];
    {
      {
        if ((_x select 1) == true) then
        {
          if (getMarkerType (_x select 0) != "") then
          {
            _safeMarkers pushBack (_x select 0);
          };
        };
      } forEach _x;
    } forEach _this;
    {
      if (markerShape _x != "") then {
        _x setMarkerTypeLocal "mil_dot";
        _ogMark = _x call BIS_fnc_markerToString;
        deleteMarkerLocal _x;
        _ogMark call BIS_fnc_stringToMarkerLocal;
        // [{_this call BIS_fnc_stringToMarker}, _ogMark, 1] call CBA_fnc_waitAndExecute;
      };
    } forEach _safeMarkers;
}, [_westSafeZones, _eastSafeZones, _guerSafeZones]] call CBA_fnc_waitUntilAndExecute;
};
