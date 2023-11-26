/*
	Author: Mallen

	Description:
		ends any request by the restriction group to disable weapons

	Parameter(s):
		0: STRING -  The group name

	Returns:
		None
*/

params ["_groupName"];
_requestIndex = -1;

{
	if (_x isEqualTo _groupName) then
	{
		_requestIndex = _forEachIndex;
		break;
	};
}
foreach fnf_weaponDisableRequestList;

if (_requestIndex isNotEqualTo -1) then
{
	fnf_weaponDisableRequestList deleteAt _requestIndex;
};
