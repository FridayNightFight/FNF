params [
  ["_unit", objNull, [objNull, []]],
  ["_side", sideEmpty, [sideEmpty]],
  ["_justReturnMarkers", false, [false]],
  ["_returnBool", true, [true]]
];

// check if a unit is inside a zone that is a safeZone for their side
_safeZones = [];

if (_side != sideEmpty) then {

  // if _side IS provided, check only safezones for the side being queried
  switch (fnf_gameMode == "sustainedAssault") do {
    case false: {
      // standard markers are on a prefix system.
      // first get any prefixes specific to the side for standard, since _side != sideEmpty
      // then get any markers in mission which match any of the prefixes and add them to safe zones.
      if (_side == west) then
      {
        {
          if (_x regexMatch "^west_safeZone_marker_\d+$") then
          {
            _safeZones pushBack _x;
          };
          if (_x regexMatch "^fnf_custom_safeZone_west_\d+_marker_\d+$") then
          {
            _markerName = _x;
            _results = _x regexFind ["\d+", 0];
            _zoneNumber = parseNumber (((_results select 0) select 0) select 0);
            _matchFound = false;
            {
              if (typeName _x == "ARRAY" && (_x select 0) regexMatch "^fnf_custom_safeZone_west_\d+_marker_\d+$") then
              {
                _results = (_x select 0) regexFind ["\d+", 0];
                _checkingZoneNumber = parseNumber (((_results select 0) select 0) select 0);
                if (_checkingZoneNumber == _zoneNumber) then
                {
                  _matchFound = true;
                  _x pushBack _markerName;
                  _x sort true;
                };
              };
            } forEach _safeZones;
            if (!_matchFound) then
            {
              _safeZones pushBack [_markerName];
            };
          };
        } forEach allMapMarkers
      };
      if (_side == east) then
      {
        {
          if (_x regexMatch "^east_safeZone_marker_\d+$") then
          {
            _safeZones pushBack _x;
          };
          if (_x regexMatch "^fnf_custom_safeZone_east_\d+_marker_\d+$") then
          {
            _markerName = _x;
            _results = _x regexFind ["\d+", 0];
            _zoneNumber = parseNumber (((_results select 0) select 0) select 0);
            _matchFound = false;
            {
              if (typeName _x == "ARRAY") then
              {
                _results = (_x select 0) regexFind ["\d+", 0];
                _checkingZoneNumber = parseNumber (((_results select 0) select 0) select 0);
                if (_checkingZoneNumber == _zoneNumber && (_x select 0) regexMatch "^fnf_custom_safeZone_east_\d+_marker_\d+$") then
                {
                  _matchFound = true;
                  _x pushBack _markerName;
                  _x sort true;
                };
              };
            } forEach _safeZones;
            if (!_matchFound) then
            {
              _safeZones pushBack [_markerName];
            };
          };
        } forEach allMapMarkers
      };
      if (_side == independent) then
      {
        {
          if (_x regexMatch "^guer_safeZone_marker_\d+$") then
          {
            _safeZones pushBack _x;
          };
          if (_x regexMatch "^fnf_custom_safeZone_guer_\d+_marker_\d+$") then
          {
            _markerName = _x;
            _results = _x regexFind ["\d+", 0];
            _zoneNumber = parseNumber (((_results select 0) select 0) select 0);
            _matchFound = false;
            {
              if (typeName _x == "ARRAY" && (_x select 0) regexMatch "^fnf_custom_safeZone_guer_\d+_marker_\d+$") then
              {
                _results = (_x select 0) regexFind ["\d+", 0];
                _checkingZoneNumber = parseNumber (((_results select 0) select 0) select 0);
                if (_checkingZoneNumber == _zoneNumber) then
                {
                  _matchFound = true;
                  _x pushBack _markerName;
                  _x sort true;
                };
              };
            } forEach _safeZones;
            if (!_matchFound) then
            {
              _safeZones pushBack [_markerName];
            };
          };
        } forEach allMapMarkers
      };
    };
    case true: {
      _safeZones = [fnf_safeZones, "SA_" + (_side call BIS_fnc_sideNameUnlocalized), []] call BIS_fnc_getFromPairs;
    };
  };
} else {

  // if _side isn't provided, we're checking ALL safe zones for all sides (like vehicles)
  switch (fnf_gameMode == "sustainedAssault") do {
    case false: {
      // standard markers are on a prefix system.
      // first get any prefixes for any side for standard mode
      // then get any markers in mission which match any of the prefixes and add them to safe zones.
      {
        if (_x regexMatch "^(west|east|guer)_safeZone_marker_\d+$") then
        {
          _safeZones pushBack _x;
        };
        if (_x regexMatch "^fnf_custom_safeZone_west_\d+_marker_\d+$") then
        {
          _markerName = _x;
          _results = _x regexFind ["\d+", 0];
          _zoneNumber = parseNumber (((_results select 0) select 0) select 0);
          _matchFound = false;
          {
            if (typeName _x == "ARRAY" && (_x select 0) regexMatch "^fnf_custom_safeZone_west_\d+_marker_\d+$") then
            {
              _results = (_x select 0) regexFind ["\d+", 0];
              _checkingZoneNumber = parseNumber (((_results select 0) select 0) select 0);
              if (_checkingZoneNumber == _zoneNumber) then
              {
                _matchFound = true;
                _x pushBack _markerName;
                _x sort true;
              };
            };
          } forEach _safeZones;
          if (!_matchFound) then
          {
            _safeZones pushBack [_markerName];
          };
        };
        if (_x regexMatch "^fnf_custom_safeZone_east_\d+_marker_\d+$") then
        {
          _markerName = _x;
          _results = _x regexFind ["\d+", 0];
          _zoneNumber = parseNumber (((_results select 0) select 0) select 0);
          _matchFound = false;
          {
            if (typeName _x == "ARRAY") then
            {
              _results = (_x select 0) regexFind ["\d+", 0];
              _checkingZoneNumber = parseNumber (((_results select 0) select 0) select 0);
              if (_checkingZoneNumber == _zoneNumber && (_x select 0) regexMatch "^fnf_custom_safeZone_east_\d+_marker_\d+$") then
              {
                _matchFound = true;
                _x pushBack _markerName;
                _x sort true;
              };
            };
          } forEach _safeZones;
          if (!_matchFound) then
          {
            _safeZones pushBack [_markerName];
          };
        };
        if (_x regexMatch "^fnf_custom_safeZone_guer_\d+_marker_\d+$") then
        {
          _markerName = _x;
          _results = _x regexFind ["\d+", 0];
          _zoneNumber = parseNumber (((_results select 0) select 0) select 0);
          _matchFound = false;
          {
            if (typeName _x == "ARRAY" && (_x select 0) regexMatch "^fnf_custom_safeZone_guer_\d+_marker_\d+$") then
            {
              _results = (_x select 0) regexFind ["\d+", 0];
              _checkingZoneNumber = parseNumber (((_results select 0) select 0) select 0);
              if (_checkingZoneNumber == _zoneNumber) then
              {
                _matchFound = true;
                _x pushBack _markerName;
                _x sort true;
              };
            };
          } forEach _safeZones;
          if (!_matchFound) then
          {
            _safeZones pushBack [_markerName];
          };
        };
      } forEach allMapMarkers
    };
    case true: {
      _safeZones = flatten(fnf_safeZones select {(_x select 0) find "SA_" > -1} apply {_x select 1});
    };
  };
};

if (_justReturnMarkers) exitWith {_safeZones};

private _checkIndex = switch (typeName _unit) do {
  case "OBJECT": {
    _safeZones findIf {
      if (typeName _x == "ARRAY") then
      {
        _polygonToCheck = [];
        {
          _polygonToCheck pushback (getMarkerPos _x);
        } forEach _x;
        _polygonToCheck pushback (getMarkerPos (_x select 0));
        if (true) exitWith {(getPos (vehicle _unit)) inPolygon _polygonToCheck};
      } else {
        if (true) exitWith {vehicle _unit inArea _x};
      };
      }
  };
  case "ARRAY": {
    _safeZones findIf {
      if (typeName _x == "ARRAY") then
      {
        _polygonToCheck = [];
        {
          _polygonToCheck pushback (getMarkerPos _x);
        } forEach _x;
        _polygonToCheck pushback (getMarkerPos (_x select 0));
        if (true) exitWith {[_unit select 0, _unit select 1, 0] inPolygon _polygonToCheck};
      } else {
        if (true) exitWith {_unit inArea _x};
      };
      }
  };
};

if (_returnBool) exitWith {_checkIndex > -1};

if (!_returnBool) exitWith {
  if (_checkIndex == -1) exitWith {""};
  _safeZones select _checkIndex;
};

format["%1 :: %2: Improper parameters", _fnc_scriptNameParent, _fnc_scriptName] remoteExec ["systemChat", 0];
false
