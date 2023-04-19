/*
	Author: Mallen

	Description:
		Finds the average of a zone (to be used for tasks/objectives that are hidden)

	Parameter(s):
		0: STRING -  The zone prefix used by the zone

	Returns:
		Position Array in format [x,y,z]
*/

params ["_zonePrefix"];
_output = [0,0,0];

_zoneToBeUsed = -1;
{
	if (_x select 0 == _zonePrefix) then
	{
		_zoneToBeUsed = _forEachIndex;
		break;
	};
} forEach fnf_zoneList;

if (_zoneToBeUsed != -1) then
{
	_xCord = 0;
	_yCord = 0;
	_zCord = 0;
	{
		_xCord = _xCord + (_x select 0);
		_yCord = _yCord + (_x select 1);
		_zCord = _zCord + (_x select 2);
	} forEach (fnf_zoneList select _zoneToBeUsed select 1);
	_xCord = _xCord / count (fnf_zoneList select _zoneToBeUsed select 1);
	_yCord = _yCord / count (fnf_zoneList select _zoneToBeUsed select 1);
	_zCord = _zCord / count (fnf_zoneList select _zoneToBeUsed select 1);
	_output = [_xCord, _yCord, _zCord];
};

_output;