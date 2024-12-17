/*
	Author: Mallen

	Description:
		Notify the player when the sector has been captured

	Parameter(s):
		0: OBJECT -	The sector objective module to be processed
		1: SIDE -	The side to switch the sector to

	Returns:
		None
*/

params["_targetObject", "_side"];

_objectiveIndex = -1;

//find objective
{
	if ((_x select 5 select 0) isEqualTo _targetObject) then
	{
		_objectiveIndex = _forEachIndex;
	}
} forEach fnf_objectives;

//if obj not found not for us, pass on
if (_objectiveIndex isEqualTo -1) exitWith {};

//notify player
_sideText = [_side] call BIS_fnc_sideName;
[format["<t size='1.5' align='center'>Objective %1 Sector Secured</t><br/><br/><t align='center'>Sector %1 has been captured by %2</t>", (_objectiveIndex + 1), _sideText], "info"] call FNF_ClientSide_fnc_notificationSystem;

//set zone colour to the currently owning side
_zoneColour = [_side, true] call BIS_fnc_sideColor;

_zonePrefix = _targetObject getVariable ["fnf_prefix", "FAILED"];

[_zonePrefix, _zoneColour] call FNF_ClientSide_fnc_setZoneColour;
