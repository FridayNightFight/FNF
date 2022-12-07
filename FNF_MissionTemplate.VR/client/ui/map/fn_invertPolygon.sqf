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
    _checkingGradient = ((_checkingMarkerPos select 1) - (_checkingNextMarkerPos select 1)) / ((_checkingMarkerPos select 0) - (_checkingNextMarkerPos select 0));
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

_invertedBoxMarkerCounter = 0;
_invertedMarkerNames = [];
{
  if (_forEachIndex == 0) then
  {
    createMarkerLocal["fnf_invertedBoxMarker_" + str (count _invertedBox), [_x select 0, _x select 1, 0]];
  };
  createMarkerLocal["fnf_invertedBoxMarker_" + (str _invertedBoxMarkerCounter), _x];
  _invertedMarkerNames pushBack ("fnf_invertedBoxMarker_" + (str _invertedBoxMarkerCounter));
  _invertedBoxMarkerCounter = _invertedBoxMarkerCounter + 1;
} forEach _invertedBox;
_invertedMarkerNames pushBack "fnf_invertedBoxMarker_" + str (count _invertedBox);

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
    _dirFromCurToPrev = ((_prevMarkerPos select 0) - (_markerPos select 0)) atan2 ((_prevMarkerPos select 1) - (_markerPos select 1));
    _dirRequiredForExtraPoint = _dirFromCurToPrev + 180;
    if (_dirRequiredForExtraPoint >= 360) then
    {
      _dirRequiredForExtraPoint = _dirRequiredForExtraPoint - 360;
    };
    _extraPointPos = [(0.001 * (cos _dirRequiredForExtraPoint)), (0.001 * (sin _dirRequiredForExtraPoint))];

    createMarkerLocal["fnf_invertedBoxMarker_fixMarker", [(((getMarkerPos _x) select 0) - (_extraPointPos select 0)), (((getMarkerPos _x) select 1) - (_extraPointPos select 1)), 0]];

    _dirFromCurToNext = ((_nextMarkerPos select 0) - (_markerPos select 0)) atan2 ((_nextMarkerPos select 1) - (_markerPos select 1));
    _dirFromCurToBorder = (((_invertedBox select 0) select 0) - (_markerPos select 0)) atan2 (((_invertedBox select 0) select 1) - (_markerPos select 1));
    _dirFromCurToNextReletiveToBorder = _dirFromCurToNext - _dirFromCurToBorder;
    if (_dirFromCurToNextReletiveToBorder < 0) then
    {
      _dirFromCurToNextReletiveToBorder = _dirFromCurToNextReletiveToBorder + 360;
    };

    _spareMarkerBorder = "fnf_invertedBoxMarker_" + str (count _invertedBox);
    _spareMarkerBorderPos = getMarkerPos _spareMarkerBorder;

    if (_dirFromCurToNextReletiveToBorder > 180) then
    {
      //left
      _spareMarkerBorder setMarkerPosLocal [_spareMarkerBorderPos select 0, (_spareMarkerBorderPos select 1) - 0.001];
      //sorting already done
    } else {
      if (_dirFromCurToNextReletiveToBorder < 180 and _dirFromCurToNextReletiveToBorder > 0) then
      {
        //right
        _spareMarkerBorder setMarkerPosLocal [_spareMarkerBorderPos select 0, (_spareMarkerBorderPos select 1) + 0.001];

        _copyOfInvertedMarkerNames = +_invertedMarkerNames;
        _invertedMarkerNames = [];
        _invertedMarkerNames pushBack "fnf_invertedBoxMarker_0";
        _invertedMarkerNames pushBack "fnf_invertedBoxMarker_3";
        _invertedMarkerNames pushBack "fnf_invertedBoxMarker_2";
        _invertedMarkerNames pushBack "fnf_invertedBoxMarker_1";
        _invertedMarkerNames pushBack "fnf_invertedBoxMarker_4";
      } else {
        hint "ERROR: 2 or more points are along the same angle from chosen hook, inversion is not possible"
      };
    };
    _output append _invertedMarkerNames;
    _output pushBack "fnf_invertedBoxMarker_fixMarker";
  }
} forEach _markerList;

_output;
