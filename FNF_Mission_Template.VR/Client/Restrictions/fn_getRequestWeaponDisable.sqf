/*
	Author: Mallen

	Description:
		gets whether a restriction group has requested for weapons to be disabled

	Parameter(s):
		0: STRING -  The group name

	Returns:
		Boolean
*/

params ["_groupName"];
_output = false;

{
	if (_x == _groupName) then
	{
		_output = true;
		break;
	};
}
foreach fnf_weaponDisableRequestList;

_output;