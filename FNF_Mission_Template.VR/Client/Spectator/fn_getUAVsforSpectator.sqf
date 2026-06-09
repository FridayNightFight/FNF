/*
	Author: Mallen

	Description:
		Starts up system to add UAVs to the spectator enviroment as well as changing their name as required

	Parameter(s):
		None

	Returns:
		None
*/

if (not (isNil "fnf_uavsForSpectatorPFH")) exitWith {};

fnf_uavsForSpectatorPFH = [{
	_allUAVDrivers = [];

	{
		_allUAVDrivers pushBackUnique (driver _x);
	} forEach allUnitsUAV;

	{
		_currentName = _x getVariable ["ACE_Name", "NONE"];
		_splitString = _currentName splitString "-";
		if ((_splitString select 0) isNotEqualTo "UAV ") then
		{
			_targetConfig = (objectParent _x) call CBA_fnc_getObjectConfig;
			_targetName = getText (_targetConfig >> "DisplayName");
			_x setVariable ["ACE_Name", "UAV - " + _targetName];
		};

		_uavGroup = group _x;
		_currentGroupId = groupId _uavGroup;
		_splitString = _currentGroupId splitString " ";
		if ((_splitString select 0) isNotEqualTo "UAV") then
		{
			_uavGroup setGroupIdGlobal ["UAV " + str(_forEachIndex)];
		};
	} forEach _allUAVDrivers;

	if (ace_spectator_availableSides isEqualTo [playerSide]) then
	{
		_allUAVDrivers = _allUAVDrivers select {(side _x) isEqualTo playerSide;};
	};

	if (ace_spectator_unitBlacklist isNotEqualTo []) then
	{
		_allUAVDrivers = [];
	};

	if (fnf_spectatorSlotUsed) then
	{
		ace_spectator_unitWhitelist = _allUAVDrivers;
	} else {
		ace_spectator_unitWhitelist = ([player] + _allUAVDrivers);
	};
}, 0.5] call CBA_fnc_addPerFrameHandler;
