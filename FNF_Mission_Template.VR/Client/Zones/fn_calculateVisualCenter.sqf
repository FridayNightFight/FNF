/*
	Author: Mallen, Grumdig

	Description:
		Finds the visual center of the polygon

	Parameter(s):
		0: STRING -  The zone prefix used by the zone

	Returns:
		Position Array in format [x,y,z]
*/

params ["_pointList"];
_output = [0,0,0];

//define a function to find the distance from a point to the nearest line of a polygon
//function was grabbed from generic algorithm made by Grumdrig on stack overflow here:
// https://stackoverflow.com/questions/849211/shortest-distance-between-a-point-and-a-line-segment
//i do not fully understand it but it is explained better there than i ever could here, only difference is porting to SQF which creates...... challenges......
_getNearestLineDistance = {
  params["_polygonPoints", "_pointToMeasure"];
  _distancesFound = [];

  {
    _v = _x;
    _w = _polygonPoints select 0;
    _p = _pointToMeasure;
    _v set [2,0];
    _w set [2,0];
    _p set [2,0];

    if (_forEachIndex isNotEqualTo ((count _polygonPoints) - 1)) then
    {
      _w = _polygonPoints select (_forEachIndex + 1);
    };

    _l2 = _v distance2D _w;

    _l2 = _l2 * _l2;

    if (_l2 isEqualTo 0) then
    {
      _distance = _v distance2D _p;
      _distancesFound pushBack _distance;
      continue;
    };

    _t = 0 max ( 1 min (((_p vectorAdd (_v vectorMultiply -1)) vectorDotProduct (_w vectorAdd (_v vectorMultiply -1))) / _l2));
    _projection = _v vectorAdd ((_w vectorAdd (_v vectorMultiply -1)) vectorMultiply _t);
    _distance = _p distance2D _projection;
    _distancesFound pushBack _distance;
  } forEach _polygonPoints;

  _lowestDistance = selectMin _distancesFound;

  if (not (_pointToMeasure inPolygon _polygonPoints)) then
  {
    _lowestDistance = _lowestDistance * -1;
  };

  _lowestDistance;
};

//setup min, max, width, cellsize, and half cellsize (_h)
_xOptions = [];
_yOptions = [];

{
  _xOptions pushBack (_x select 0);
  _yOptions pushBack (_x select 1);
} forEach _pointList;

_maxX = selectMax _xOptions;
_maxY = selectMax _yOptions;
_minX = selectMin _xOptions;
_minY = selectMin _yOptions;

_width = _maxX - _minX;
_height = _maxY - _minY;

_cellSize = _width min _height;

_h = _cellSize / 2;

//setup cellqueue to iterate through
_cellQueue = [];

//get starter cell location (usually middle of polygon)
_starterX = (_width / 2) + _minX;
_starterY = (_height / 2) + _minY;

_bestCell = [_starterX, _starterY, 0];

//get initial distance of best cell to shortest line
_distanceBestCell = [_pointList, [_starterX, _starterY,0]] call _getNearestLineDistance;

//populate cell queue with initial cells (overkill only one cell is even added)
_tempX = _minX;
while {_tempX < _maxX} do {
  _tempY = _minY;
  while {_tempY < _maxY} do {
    _cellQueue pushBack [_tempX + _h, _tempY + _h, _h];
    _tempY = _tempY + _cellSize;
  };
  _tempX = _tempX + _cellSize;
};

//go through all cells in cell queue
while {count _cellQueue isNotEqualTo 0} do {
  //grab latest cell and pop it from array
  _currentCell = _cellQueue select ((count _cellQueue) - 1);
  _cellQueue deleteAt ((count _cellQueue) - 1);

  //get distance to closest line
  _distanceCurrentCell = [_pointList, [(_currentCell select 0),(_currentCell select 1),0]] call _getNearestLineDistance;

  //if this distance is better than the current best replace the current best
  if (_distanceCurrentCell > _distanceBestCell) then
  {
    _bestCell = _currentCell;
    _distanceBestCell = _distanceCurrentCell;
  };

  _currentCellMaxDistance = _distanceCurrentCell + ((_currentCell select 2) * (sqrt 2));

  //go to next cell if his one isnt good enough      \/ this is currently the best to 25m accuracy, can be changed but lower values are more resource intense
  if (_currentCellMaxDistance - _distanceBestCell <= 25) then
  {
    continue;
  };
  //from rough testing with 10 point polygon 0.1m is most accurate without frame drop called every second (this should be one and doned wherever possible)

  //populate new cells to go through
  _h = (_currentCell select 2) / 2;
  _cellQueue pushBack [(_currentCell select 0) - _h, (_currentCell select 1) - _h, _h];
  _cellQueue pushBack [(_currentCell select 0) + _h, (_currentCell select 1) - _h, _h];
  _cellQueue pushBack [(_currentCell select 0) - _h, (_currentCell select 1) + _h, _h];
  _cellQueue pushBack [(_currentCell select 0) + _h, (_currentCell select 1) + _h, _h];
};

_output = _bestCell;

_output;
