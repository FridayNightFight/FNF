/*
	Author: Mallen

	Description:
		Checks whether there are any more zones in a restriction group

	Parameter(s):
		0: STRING -  The name of the group to be checked

	Returns:
		Boolean
*/

params["_groupName"];

_result = false;

//gets restriction group and zone mentioned
{
	if (_x select 0 == _groupName) then
	{
		if (count (_x select 1) != 0) then
    {
      _result = true;
    };
		break;
	};
} forEach fnf_zoneRestrictionGroupsList;

_result;
