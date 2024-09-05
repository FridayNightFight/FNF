/*
	Author: Mallen

	Description:
		Updates the contents of the Orbat tab

	Parameter(s):
		0: DIARY RECORD -	the diary record to be updated

	Returns:
		None
*/
forceUnicode 0;
params["_orbatRecord"];

_orbatContent = "";

_validGroups = [];

//get all groups with players in them and on players side
{
	if (count (units _x) isEqualTo 0) then
	{
		continue;
	};
	if (side _x isNotEqualTo playerSide) then
	{
		continue;
	};
	_validGroups pushBack _x;
} forEach allGroups;

{
	_currentGroup = _x;
	_groupName = groupId _currentGroup;
	_leader = leader _currentGroup;
	_units = units _currentGroup;

	_playerFound = false;

	//check if group consists entirely of AI, if so dont include it in the ORBAT
	{
		if (isPlayer _x) then
		{
			_playerFound = true;
			break;
		};
	} forEach _units;

	if (not _playerFound) then
	{
		continue;
	};

	//get TFAR frequencies if they are set
	_mainSRFreq = _leader getVariable ["fnf_freq_sr", "NONE FOUND"];
	if (_mainSRFreq isEqualTo "NONE FOUND") then
	{
		_allSRFreq = _leader getVariable ["TFAR_freq_sr", ["N/A"]];
		_mainSRFreq = _allSRFreq select 0;
	};

	_mainLRFreq = _leader getVariable ["fnf_freq_lr", "NONE FOUND"];
	if (_mainLRFreq isEqualTo "NONE FOUND") then
	{
		_allLRFreq = _leader getVariable ["TFAR_freq_lr", ["N/A"]];
		_mainLRFreq = _allLRFreq select 0;
	};

	_units = _units - [_leader];

	//make sure Leader is always at the top of the ORBAT by doing them first
	_leaderRole = "AI";
	//used to handle issues where AI dont have role descriptions and can break string logic
	if (isPlayer _leader) then
	{
		_leaderRoleDescription = roleDescription _leader;
		_leaderRole = ((_leaderRoleDescription splitString "@") select 0);
	};
	_leaderName = name _leader;

	//create group string
	_stringToAdd = "<font size='20' face='RobotoCondensedBold'>" + _groupName + "<font face='RobotoCondensed'> (" + str((count _units) + 1) + ")	-	SR:" + _mainSRFreq + "	-	LR:" + _mainLRFreq + "</font></font><br/><font size='14' face='RobotoCondensed'>		" + _leaderRole + ": " + _leaderName + "</font><br/>";

	//add all units to group string
	{
		_unitRole = "AI";

		if (isPlayer _x) then
		{
			_unitRoleDescription = roleDescription _x;
			_unitRole = ((_unitRoleDescription splitString "@") select 0);
		};

		_unitName = name _x;
		_stringToAdd = _stringToAdd + "<font size='14' face='RobotoCondensed'>		" + _unitRole + ": " + _unitName + "</font><br/>";
	} forEach _units;

	_stringToAdd = _stringToAdd + "<br/>";

	//add group string to running diary string
	_orbatContent = _orbatContent + _stringToAdd;
} forEach _validGroups;

//trims the ending breaks to keep tab size to a minimum
_orbatContent = _orbatContent trim ["<br/>", 2];
_orbatContent = _orbatContent + ">";

player setDiaryRecordText [["orbat", _orbatRecord], ["My Orbat", _orbatContent]];
