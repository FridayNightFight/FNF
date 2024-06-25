/*
	Author: Mallen

	Description:
		Takes a list of positions forming a regular polygon and adds additional points outside standard map view to effectivly invert the polygon for shading purposes

	Parameter(s):
		1: ARRAY -	An array of positions forming an inverted regular polygon

	Returns:
		Array of positions in the format [pos1,pos2,pos3]
*/

params["_posList"];

_worldSize = worldSize;

_outerPositionBL = [_worldSize * -3, _worldSize * -3, 0];
_outerPositionBR = [_worldSize * 3, _worldSize * -3, 0];
_outerPositionTL = [_worldSize * -3, _worldSize * 3, 0];
_outerPositionTR = [_worldSize * 3, _worldSize * 3, 0];

_displacementDistance = 0.1;

_lineIntersect = {
	params["_lineA1","_lineA2","_lineB1","_lineB2"];

	_lineA1 params ["_x1", "_y1"];
	_lineA2 params ["_x2", "_y2"];

	_lineB1 params ["_x3", "_y3"];
	_lineB2 params ["_x4", "_y4"];

	// Calculate the differences
	_dx1 = _x2 - _x1;
	_dy1 = _y2 - _y1;
	_dx2 = _x4 - _x3;
	_dy2 = _y4 - _y3;

	// Calculate the denominator
	_denominator = (_dx1 * _dy2 - _dy1 * _dx2);

	// If the denominator is zero, lines are parallel and non-intersecting
	if (_denominator isEqualTo 0) exitWith {false};

	// Calculate the intersection point
	_a = _y1 - _y3;
	_b = _x1 - _x3;

	_n1 = (_dx2 * _a - _dy2 * _b) / _denominator;
	_n2 = (_dx1 * _a - _dy1 * _b) / _denominator;

	_result = false;

	if ((_n1 >= 0) && (_n1 <= 1) && (_n2 >= 0) && (_n2 <= 1)) then
	{
		_result = true;
	};

	_result;
};

_goodPosIndexToAnchorTo = -1;

//find a point in the posList that has line of sight to bottom left outer position
{
	_currentPoint = _x;
	_intersected = false;

	{
		if (_currentPoint isEqualTo _x) then {continue;};
		_nextPoint = [];
		if (_forEachIndex isEqualTo (count _posList) - 1) then
		{
			_nextPoint = _posList select 0;
		} else {
			_nextPoint = _posList select (_forEachIndex + 1);
		};

		if (_currentPoint isEqualTo _nextPoint) then {continue;};

		if ([_currentPoint, _outerPositionBL, _x, _nextPoint] call _lineIntersect) then
		{
			_intersected = true;
			break;
		}
	} forEach _posList;

	if (not _intersected) then
	{
		_goodPosIndexToAnchorTo = _forEachIndex;
		break;
	};
} forEach _posList;

_goodPosToAnchorTo = _posList select _goodPosIndexToAnchorTo;

_bottomLength = ((_outerPositionBL select 0) - (_goodPosToAnchorTo select 0)) * -1;
_topLength = _outerPositionBL distance2D _goodPosToAnchorTo;
_angleBetweenBLAndAnchorPos = acos (_bottomLength / _topLength);

_upAngle = _angleBetweenBLAndAnchorPos + 90;
_downAngle = _angleBetweenBLAndAnchorPos + 270;

_newX = ((_outerPositionBL select 0) + ((cos _upAngle) * _displacementDistance));
_newY = ((_outerPositionBL select 1) + ((sin _upAngle) * _displacementDistance));
_outerPositionBLUp = [_newX, _newY, 0];
_newX = ((_outerPositionBL select 0) + ((cos _downAngle) * _displacementDistance));
_newY = ((_outerPositionBL select 1) + ((sin _downAngle) * _displacementDistance));
_outerPositionBLDown = [_newX, _newY, 0];

_newX = ((_goodPosToAnchorTo select 0) + ((cos _upAngle) * _displacementDistance));
_newY = ((_goodPosToAnchorTo select 1) + ((sin _upAngle) * _displacementDistance));
_anchorPositionUp = [_newX, _newY, 0];
_newX = ((_goodPosToAnchorTo select 0) + ((cos _downAngle) * _displacementDistance));
_newY = ((_goodPosToAnchorTo select 1) + ((sin _downAngle) * _displacementDistance));
_anchorPositionDown = [_newX, _newY, 0];

_willOrderBeCW = false;
_nextAfterAnchor = [];

if (_goodPosIndexToAnchorTo isEqualTo (count _posList) - 1) then
{
	_nextAfterAnchor = _posList select 0;
} else {
	_nextAfterAnchor = _posList select (_goodPosIndexToAnchorTo + 1);
};

if ((_goodPosToAnchorTo select 1) > (_nextAfterAnchor select 1)) then
{
	_willOrderBeCW = true;
};

_output = +_posList;

_output deleteAt _goodPosIndexToAnchorTo;

if (_willOrderBeCW) then
{
	_output insert [_goodPosIndexToAnchorTo, [_anchorPositionUp, _outerPositionBLUp, _outerPositionTL, _outerPositionTR, _outerPositionBR, _outerPositionBLDown, _anchorPositionDown]];
} else {
	_output insert [_goodPosIndexToAnchorTo, [_anchorPositionDown, _outerPositionBLDown, _outerPositionBR, _outerPositionTR, _outerPositionTL, _outerPositionBLUp, _anchorPositionUp]];
};

[_output, [[_goodPosToAnchorTo, [_anchorPositionUp, _anchorPositionDown]], [_outerPositionBL, [_outerPositionBLUp, _outerPositionBLDown]]]];
