/*
	Author: Indigo (Edited by Mallen)

	Description:
		Changes whether the timer is visible in the HUD and the map, or just the map

	Parameter(s):
		0: BOOLEAN -	Whether the overall timer should be shown on HUD or not

	Returns:
		None
*/

params["_shouldShowInHUD"];

if (ace_spectator_isSet) then
{
	_shouldShowInHUD = true;
};

removeAllMissionEventHandlers "Map";

_layerId = "timeRsc" call BIS_fnc_rscLayer;

if (_shouldShowInHUD) then
{
	_layerId cutRsc ["timeleftStructText", "PLAIN", -1, true];
} else {
	if !(visibleMap) then
	{
		_layerId cutText ["", "PLAIN"];
	} else {
		_layerId cutRsc ["timeleftStructText", "PLAIN", -1, true];
	};

	addMissionEventHandler ["Map", {
		params ["_mapIsOpened", "_mapIsForced"];
		_layerId = "timeRsc" call BIS_fnc_rscLayer;
		if (_mapIsOpened) then
		{
			_layerId cutRsc ["timeleftStructText", "PLAIN", -1, true];
		} else {
			_layerId cutText ["", "PLAIN"];
		};
	}];
};
