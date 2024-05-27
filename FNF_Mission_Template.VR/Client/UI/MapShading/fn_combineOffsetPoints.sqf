/*
	Author: Mallen

	Description:
		Moves preset points to their original defined values to correct for maths errors

	Parameter(s):
		0: ARRAY -	An array of triangles to be edited
		1: ARRAY -	An array of points to move and what they are moved to, for example [[posToCorrectTo, [posToLookFor,posToLookFor]],[posToCorrectTo, [posToLookFor,posToLookFor]]]

	Returns:
		An array of triangles in the same structure of array provided
*/

params["_triangleList", "_exclusions"];

_output = +_triangleList;

{
	_positionToCorrectTo = _x select 0;
	_positionsToCorrect = [];
	{
		_positionToLookFor = _x;
		{
			_firstLevelIndex = _forEachIndex;
			{
				if (_x isEqualTo _positionToLookFor) then
				{
					_positionsToCorrect pushBack [_firstLevelIndex, _forEachIndex];
				};
			} forEach _x;
		} forEach _triangleList;
	} forEach (_x select 1);

	{
		_output select (_x select 0) set [_x select 1, _positionToCorrectTo];
	} forEach _positionsToCorrect;
} forEach _exclusions;

_output;
