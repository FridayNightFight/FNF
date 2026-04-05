/*
	Author: Mallen

	Description:
		Starts up spectator enviroment for players who have died but can still be reinserted

	Parameter(s):
		None

	Returns:
		None
*/

[true, true, true] call ace_spectator_fnc_setSpectator;

[[playerSide], ([west, east, independent, civilian] - [playerSide])] call ace_spectator_fnc_updateSides;
[[1,2], [0]] call ace_spectator_fnc_updateCameraModes;

true call FNF_ClientSide_fnc_showTimerInHUD;

//setup map shading
[{!isNull findDisplay 60000},{
findDisplay 60000 displayCtrl 60014 ctrlAddEventHandler ["Draw",
{
	_map = _this select 0;
	{
		_rgbaValues = _y select 1;
		{
			_pos1 = _x select 0;
			_pos2 = _x select 1;
			_pos3 = _x select 2;
			_map drawTriangle [[_pos1, _pos2, _pos3], _rgbaValues, "#(rgb,1,1,1)color(1,1,1,1)"];
		} forEach (_y select 0);
	} forEach fnf_trianglesToDraw;
}];
}] call CBA_fnc_waitUntilAndExecute;

call BIS_fnc_showMissionStatus;

_disableWindow = (missionNamespace getVariable ["fnf_timeToDisableReinsertsAfterSafeStart", 20]);

[{
	params["_disableWindow"];
	_timeServerStarted = missionNamespace getVariable ["fnf_startTime", -1];
	_result = objNull;
	if (isServer and hasInterface) then
	{
		_result = time > (_disableWindow * 60);
	} else {
		_result = (serverTime - _timeServerStarted) > (_disableWindow * 60);
		if (_timeServerStarted isEqualTo -1) then
		{
			_result = false;
		};
	};
	_reinsertRequested = group player getVariable ["fnf_reinsertRequested", false];

	_result or (alive player) or _reinsertRequested;
},{
	params["_disableWindow"];

	_reinsertedPlayers = group player getVariable ["fnf_reinsertedPlayers", []];
	_reinsertRequested = group player getVariable ["fnf_reinsertRequested", false];

	if ((not ((getplayerUID player) in _reinsertedPlayers)) and (_reinsertRequested)) then
	{
		call FNF_ClientSide_fnc_upgradeSpectator;
		["<t align='center' size='1.5'>REINSERT UNAVAILABLE</t><t align='center'><br/><br/>Reinsert has been called for the squad, but 4 other squadmates died before you so you did not make the cut </t>", "info", 10] call FNF_ClientSide_fnc_notificationSystem;
	} else {
		if (not (alive player)) then
		{
			call FNF_ClientSide_fnc_upgradeSpectator;
		};
	};

}, [_disableWindow]] call CBA_fnc_waitUntilAndExecute;
