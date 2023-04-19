/*
	Author: Mallen

	Description:
		starts a request by the restriction group to disable weapons

	Parameter(s):
		0: STRING -  The group name

	Returns:
		None
*/

params ["_groupName"];
_duplicate = false;

{
	if (_x == _groupName) then
	{
		_duplicate = true;
		break;
	};
} forEach fnf_weaponDisableRequestList;
if (!_duplicate) then
{
	fnf_weaponDisableRequestList pushBack _groupName;
};