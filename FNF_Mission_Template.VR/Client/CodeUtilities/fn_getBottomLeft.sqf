/*
	Author: Mallen

	Description:
		check whether an object is to the left or bottom of another

	Parameter(s):
		0: OBJECT - Object to check position of reletive to...
		0: OBJECT - Object to base bottom leftness from

	Returns:
		boolean
*/

params["_objectToCheck", "_objectToBase"];

_result = false;

_obj1Pos = getpos _objectToCheck;
_obj2Pos = getpos _objectToBase;

if ((_obj1Pos select 0) < (_obj2Pos select 0)) then
{
	_result = true;
} else {
	if ((_obj1Pos select 0) isEqualTo (_obj2Pos select 0)) then
	{
		if ((_obj1Pos select 1) < (_obj2Pos select 1)) then
		{
			_result = true;
		} else {
			if ((_obj1Pos select 1) isEqualTo (_obj2Pos select 1)) then
			{
				if ((_obj1Pos select 2) < (_obj2Pos select 2)) then
				{
					_result = true;
				};
			};
		};
	};
};

_result;
