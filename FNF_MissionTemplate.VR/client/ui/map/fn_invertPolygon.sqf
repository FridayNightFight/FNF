params["_markerList"];
_indexOfProbableLink = 0;
_invertedBox = [[-20000,-20000,0],[-20000,(worldSize + 20000),0],[(worldSize + 20000),(worldSize + 20000),0],[(worldSize + 20000),-20000,0]];

{
  _markerPos = getMarkerPos _x;
  _probableGradient = ((_markerPos select 1) - ((_invertedBox select 0) select 1)) / ((_markerPos select 0) - ((_invertedBox select 0) select 0));
  _probableOffset = (_markerPos select 1) - (_probableGradient * (_markerPos select 0));
  _intersectsWithPolygon = false;
  {
    _checkingMarkerPos = getMarkerPos _x;
    _checkingNextMarkerPos = getMarkerPos (_markerList select 0);
    if (_forEachIndex != (count _markerList) - 1) then
    {
      _checkingNextMarkerPos = getMarkerPos (_markerList select (_forEachIndex + 1));
    };
    if ((_checkingMarkerPos select 0) - (_checkingNextMarkerPos select 0) == 0) then
    {
      _checkingGradient = 3.4028235e38; //max integer in arma
    } else {
      _checkingGradient = ((_checkingMarkerPos select 1) - (_checkingNextMarkerPos select 1)) / ((_checkingMarkerPos select 0) - (_checkingNextMarkerPos select 0));
    };
    if (_checkingGradient == _probableGradient) then {continue};
    _checkingOffset = (_checkingMarkerPos select 1) - (_checkingGradient * (_checkingMarkerPos select 0));
    _intersectPoint = [((_probableOffset - _checkingOffset) / (_checkingGradient - _probableGradient)),(_probableGradient * ((_probableOffset - _checkingOffset) / (_checkingGradient - _probableGradient)) + _probableOffset),0];

    _intersectOccursWithinLines = true;

    if ((_markerPos select 0) < ((_invertedBox select 0) select 0)) then {
      if ((_intersectPoint select 0) >= ((_invertedBox select 0) select 0) or (_intersectPoint select 0) <= (_markerPos select 0)) then
      {
        _intersectOccursWithinLines = false;
      }
    } else {
      if ((_intersectPoint select 0) <= ((_invertedBox select 0) select 0) or (_intersectPoint select 0) >= (_markerPos select 0)) then
      {
        _intersectOccursWithinLines = false;
      }
    };
    if ((_markerPos select 1) < ((_invertedBox select 0) select 1)) then {
      if ((_intersectPoint select 1) >= ((_invertedBox select 0) select 1) or (_intersectPoint select 1) <= (_markerPos select 1)) then
      {
        _intersectOccursWithinLines = false;
      }
    } else {
      if ((_intersectPoint select 1) <= ((_invertedBox select 0) select 1) or (_intersectPoint select 1) >= (_markerPos select 1)) then
      {
        _intersectOccursWithinLines = false;
      }
    };

    if ((_checkingMarkerPos select 0) < (_checkingNextMarkerPos select 0)) then {
      if ((_intersectPoint select 0) >= (_checkingNextMarkerPos select 0) or (_intersectPoint select 0) <= (_checkingMarkerPos select 0)) then
      {
        _intersectOccursWithinLines = false;
      }
    } else {
      if ((_intersectPoint select 0) <= (_checkingNextMarkerPos select 0) or (_intersectPoint select 0) >= (_checkingMarkerPos select 0)) then
      {
        _intersectOccursWithinLines = false;
      }
    };
    if ((_checkingMarkerPos select 1) < (_checkingNextMarkerPos select 1)) then {
      if ((_intersectPoint select 1) >= (_checkingNextMarkerPos select 1) or (_intersectPoint select 1) <= (_checkingMarkerPos select 1)) then
      {
        _intersectOccursWithinLines = false;
      }
    } else {
      if ((_intersectPoint select 1) <= (_checkingNextMarkerPos select 1) or (_intersectPoint select 1) >= (_checkingMarkerPos select 1)) then
      {
        _intersectOccursWithinLines = false;
      }
    };

    if (_intersectOccursWithinLines) then
    {
      _intersectsWithPolygon = true;
      break;
    };
  } forEach _markerList;

  if (!_intersectsWithPolygon) then
  {
    _indexOfProbableLink = _forEachIndex;
    break;
  };
} forEach _markerList;


//fix markers?
_invertedBoxMarkerCounter = 0;
_nameToUseForUniqueMarkerName = (_markerList select 0) + "_fixedInvertedBoxMarker";
_invertedMarkerNames = [];
{
  if (_forEachIndex == 0) then
  {
    createMarkerLocal[_nameToUseForUniqueMarkerName + str (count _invertedBox), [_x select 0, _x select 1, 0]];
  };
  createMarkerLocal[_nameToUseForUniqueMarkerName + (str _invertedBoxMarkerCounter), _x];
  _invertedMarkerNames pushBack (_nameToUseForUniqueMarkerName + (str _invertedBoxMarkerCounter));
  _invertedBoxMarkerCounter = _invertedBoxMarkerCounter + 1;
} forEach _invertedBox;
_invertedMarkerNames pushBack _nameToUseForUniqueMarkerName + str (count _invertedBox);

_output = [];

{
  _output pushBack _x;
  if (_forEachIndex == _indexOfProbableLink) then
  {
    _marker = _x;
    _prevMarker = "";
    _nextMarker = "";
    if (_forEachIndex == 0) then
    {
      _prevMarker = _markerList select ((count _markerList) - 1);
    } else {
      _prevMarker = _markerList select (_forEachIndex - 1);
    };
    if (_forEachIndex == (count _markerList) - 1) then
    {
      _nextMarker = _markerList select 0;
    } else {
      _nextMarker = _markerList select (_forEachIndex + 1);
    };
    _markerPos = getMarkerPos _marker;
    _prevMarkerPos = getMarkerPos _prevMarker;
    _nextMarkerPos = getMarkerPos _nextMarker;
    _extraPointPos = [0,0,0];

    for "_i" from 0 to 359 do {
      _extraPointOffset = [(0.01 * (cos (_i - 90))), (0.01 * (sin (_i + 90)))];
      _extraPointPos = [((_markerPos select 0) + (_extraPointOffset select 0)), ((_markerPos select 1) + (_extraPointOffset select 1)), 0];
      _probableGradient = ((_extraPointPos select 1) - (_nextMarkerPos select 1)) / ((_extraPointPos select 0) - (_nextMarkerPos select 0));
      _probableOffset = (_extraPointPos select 1) - (_probableGradient * (_extraPointPos select 0));

      _intersectsWithPolygon = false;
      {
        _checkingMarkerPos = getMarkerPos _x;
        _checkingNextMarkerPos = getMarkerPos (_markerList select 0);
        if (_forEachIndex != (count _markerList) - 1) then
        {
          _checkingNextMarkerPos = getMarkerPos (_markerList select (_forEachIndex + 1));
        };
        if ((_checkingMarkerPos select 0) - (_checkingNextMarkerPos select 0) == 0) then
        {
          _checkingGradient = 3.4028235e38; //max integer in arma
        } else {
          _checkingGradient = ((_checkingMarkerPos select 1) - (_checkingNextMarkerPos select 1)) / ((_checkingMarkerPos select 0) - (_checkingNextMarkerPos select 0));
        };
        if (_checkingGradient == _probableGradient) then {continue};
        _checkingOffset = (_checkingMarkerPos select 1) - (_checkingGradient * (_checkingMarkerPos select 0));
        _intersectPoint = [((_probableOffset - _checkingOffset) / (_checkingGradient - _probableGradient)),(_probableGradient * ((_probableOffset - _checkingOffset) / (_checkingGradient - _probableGradient)) + _probableOffset),0];

        _intersectOccursWithinLines = true;

        if ((_nextMarkerPos select 0) < (_extraPointPos select 0)) then {
          if ((_intersectPoint select 0) >= (_extraPointPos select 0) or (_intersectPoint select 0) <= (_nextMarkerPos select 0)) then
          {
            _intersectOccursWithinLines = false;
          }
        } else {
          if ((_intersectPoint select 0) <= (_extraPointPos select 0) or (_intersectPoint select 0) >= (_nextMarkerPos select 0)) then
          {
            _intersectOccursWithinLines = false;
          }
        };
        if ((_nextMarkerPos select 1) < (_extraPointPos select 1)) then {
          if ((_intersectPoint select 1) >= (_extraPointPos select 1) or (_intersectPoint select 1) <= (_nextMarkerPos select 1)) then
          {
            _intersectOccursWithinLines = false;
          }
        } else {
          if ((_intersectPoint select 1) <= (_extraPointPos select 1) or (_intersectPoint select 1) >= (_nextMarkerPos select 1)) then
          {
            _intersectOccursWithinLines = false;
          }
        };

        if ((_checkingMarkerPos select 0) < (_checkingNextMarkerPos select 0)) then {
          if ((_intersectPoint select 0) >= (_checkingNextMarkerPos select 0) or (_intersectPoint select 0) <= (_checkingMarkerPos select 0)) then
          {
            _intersectOccursWithinLines = false;
          }
        } else {
          if ((_intersectPoint select 0) <= (_checkingNextMarkerPos select 0) or (_intersectPoint select 0) >= (_checkingMarkerPos select 0)) then
          {
            _intersectOccursWithinLines = false;
          }
        };
        if ((_checkingMarkerPos select 1) < (_checkingNextMarkerPos select 1)) then {
          if ((_intersectPoint select 1) >= (_checkingNextMarkerPos select 1) or (_intersectPoint select 1) <= (_checkingMarkerPos select 1)) then
          {
            _intersectOccursWithinLines = false;
          }
        } else {
          if ((_intersectPoint select 1) <= (_checkingNextMarkerPos select 1) or (_intersectPoint select 1) >= (_checkingMarkerPos select 1)) then
          {
            _intersectOccursWithinLines = false;
          }
        };

        if (_intersectOccursWithinLines) then
        {
          _intersectsWithPolygon = true;
          break;
        };
      } forEach _markerList;
      if (!_intersectsWithPolygon) then
      {
        break;
      };
    };

    createMarkerLocal[_nameToUseForUniqueMarkerName + "_fixMarker", _extraPointPos];
    _fixMarker = _nameToUseForUniqueMarkerName + "_fixMarker";
    _fixMarker setMarkerTypeLocal "Contact_defenseLineOver";
    _fixMarkerPos = getMarkerPos _fixMarker;

    _spareMarkerBorder = _nameToUseForUniqueMarkerName + str (count _invertedBox);
    _spareMarkerBorderPos = getMarkerPos _spareMarkerBorder;
    _spareMarkerBorder setMarkerPosLocal [_spareMarkerBorderPos select 0, (_spareMarkerBorderPos select 1) - 0.01];
    _spareMarkerBorderPos = getMarkerPos _spareMarkerBorder;

    _probableGradient = ((_markerPos select 1) - ((_invertedBox select 0) select 1)) / ((_markerPos select 0) - ((_invertedBox select 0) select 0));
    _probableOffset = (_markerPos select 1) - (_probableGradient * (_markerPos select 0));

    _checkingGradient = ((_spareMarkerBorderPos select 1) - (_fixMarkerPos select 1)) / ((_spareMarkerBorderPos select 0) - (_fixMarkerPos select 0));
    if (_checkingGradient == _probableGradient) then {
      _output append _invertedMarkerNames;
      _output pushBack _fixMarker;
      continue;
    };
    _checkingOffset = (_spareMarkerBorderPos select 1) - (_checkingGradient * (_spareMarkerBorderPos select 0));
    _intersectPoint = [((_probableOffset - _checkingOffset) / (_checkingGradient - _probableGradient)),(_probableGradient * ((_probableOffset - _checkingOffset) / (_checkingGradient - _probableGradient)) + _probableOffset),0];

    _intersectOccursWithinLines = true;

    if ((_markerPos select 0) < ((_invertedBox select 0) select 0)) then {
      if ((_intersectPoint select 0) >= ((_invertedBox select 0) select 0) or (_intersectPoint select 0) <= (_markerPos select 0)) then
      {
        _intersectOccursWithinLines = false;
      }
    } else {
      if ((_intersectPoint select 0) <= ((_invertedBox select 0) select 0) or (_intersectPoint select 0) >= (_markerPos select 0)) then
      {
        _intersectOccursWithinLines = false;
      }
    };
    if ((_markerPos select 1) < ((_invertedBox select 0) select 1)) then {
      if ((_intersectPoint select 1) >= ((_invertedBox select 0) select 1) or (_intersectPoint select 1) <= (_markerPos select 1)) then
      {
        _intersectOccursWithinLines = false;
      }
    } else {
      if ((_intersectPoint select 1) <= ((_invertedBox select 0) select 1) or (_intersectPoint select 1) >= (_markerPos select 1)) then
      {
        _intersectOccursWithinLines = false;
      }
    };

    if ((_spareMarkerBorderPos select 0) < (_fixMarkerPos select 0)) then {
      if ((_intersectPoint select 0) >= (_fixMarkerPos select 0) or (_intersectPoint select 0) <= (_spareMarkerBorderPos select 0)) then
      {
        _intersectOccursWithinLines = false;
      }
    } else {
      if ((_intersectPoint select 0) <= (_fixMarkerPos select 0) or (_intersectPoint select 0) >= (_spareMarkerBorderPos select 0)) then
      {
        _intersectOccursWithinLines = false;
      }
    };
    if ((_spareMarkerBorderPos select 1) < (_fixMarkerPos select 1)) then {
      if ((_intersectPoint select 1) >= (_fixMarkerPos select 1) or (_intersectPoint select 1) <= (_spareMarkerBorderPos select 1)) then
      {
        _intersectOccursWithinLines = false;
      }
    } else {
      if ((_intersectPoint select 1) <= (_fixMarkerPos select 1) or (_intersectPoint select 1) >= (_spareMarkerBorderPos select 1)) then
      {
        _intersectOccursWithinLines = false;
      }
    };

    if (_intersectOccursWithinLines) then {
      _spareMarkerBorder setMarkerPosLocal [_spareMarkerBorderPos select 0, (_spareMarkerBorderPos select 1) + 0.02];
      _copyOfInvertedMarkerNames = +_invertedMarkerNames;
      _invertedMarkerNames = [];
      _invertedMarkerNames pushBack (_copyOfInvertedMarkerNames select 0);
      _invertedMarkerNames pushBack (_copyOfInvertedMarkerNames select 3);
      _invertedMarkerNames pushBack (_copyOfInvertedMarkerNames select 2);
      _invertedMarkerNames pushBack (_copyOfInvertedMarkerNames select 1);
      _invertedMarkerNames pushBack (_copyOfInvertedMarkerNames select 4);
    };

    _output append _invertedMarkerNames;
    _output pushBack _fixMarker;
  }
} forEach _markerList;

_output;
