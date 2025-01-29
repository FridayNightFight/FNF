_allGroups = get3DENSelected "group";
_kitHashmap = createHashMap;
_classNameHashMap = createHashMapFromArray [["SL", "_Soldier_SL_F"],["AR", "_soldier_AR_F"],["AT", "_soldier_LAT_F"],["TL", "_Soldier_TL_F"],["CE", "_soldier_exp_F"],["MED", "_medic_F"],["MRK", "_soldier_M_F"],["MG", "_support_MG_F"],["PL", "_Pilot_F"],["CRL", "_crew_F"],["CR", "_crew_F"],["MAT", "_Soldier_AT_F"],["AMAT", "_Soldier_AAT_F"]];
_basePosition = getPos (leader (_allGroups select 0));

_sideHashMap = createHashMapFromArray [[west, "B"], [east, "O"], [independent, "I"]];
_sideSymbol = _sideHashMap get (side (leader (_allGroups select 0)));

{
	_unitsInGroup = units _x;
	_groupLeader = leader _x;
	{
		_roleDescription = ((_x get3DENAttribute "description") select 0);
		_splitString = _roleDescription splitString "@";
		if (_x isNotEqualTo _groupLeader) then
		{
			_x set3DENAttribute ["description", (_splitString select 0)];
		};

		_unitShorthand = "";
		switch (_splitString select 0) do {
			case "Platoon Sergeant": {_unitShorthand = "SL";};
			case "Automatic Rifleman": {_unitShorthand = "AR";};
			case "Rifleman (LAT)": {_unitShorthand = "AT";};
			case "Grenadier": {_unitShorthand = "TL";};
			case "Combat Engineer": {_unitShorthand = "CE";};
			case "Medic": {_unitShorthand = "MED";};
			case "Marksman": {_unitShorthand = "MRK";};
			case "Machine Gunner": {_unitShorthand = "MG";};
			case "Pilot": {_unitShorthand = "PL";};
			case "Vehicle Commander": {_unitShorthand = "CRL";};
			case "Vehicle Driver": {_unitShorthand = "CR";};
			case "Missile Specialist": {_unitShorthand = "MAT";};
			case "Asst. Missile Specialist": {_unitShorthand = "AMAT";};
			default { };
		};

		if (_unitShorthand isNotEqualTo "") then
		{
			_kit = getUnitLoadout _x;
			_kitHashmap set [_unitShorthand, _kit, true];
		};
	} forEach _unitsInGroup;
} forEach _allGroups;

_xPosition = ((_basePosition select 0) - 14);
_srTFAR = 40;
_squadNameList = ["Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot"];
{
	_group = _x;
	_roleDescription = createHashMapFromArray [["SL", "Squad Leader"],["MRK", "Marksman"],["AR", "Automatic Rifleman"],["AT", "Light Anti-Tank"],["TL", "Team Leader (GL)"],["CE", "Combat Engineer"],["MG", "Machine Gunner"],["MED", "Medic"]];
	_yPosition = ((_basePosition select 1) - 4);
	if (_forEachIndex isEqualTo 0) then
	{
		continue;
	};

	if (_forEachIndex > 6) then
	{
		break;
	};

	_unitsToDelete = (units _x) - [leader _x];
	delete3DENEntities _unitsToDelete;

	_leader = leader _x;
	[_leader] set3DENObjectType (_sideSymbol + (_classNameHashMap get "SL"));
	_leader = leader _x;
	_leader setUnitLoadout (_kitHashmap get "SL");
	set3DENAttributes [[[_leader], "position", [_xPosition, _yPosition, 0]], [[_leader], "TFAR_freq_sr", str(_srTFAR) + ",30"], [[_leader], "TFAR_freq_lr", "30"], [[_leader], "description", (_roleDescription get "SL") + "@" + (_squadNameList select 0)]];
	_leader setPos [_xPosition, _yPosition, 0];
	_yPosition = _yPosition - 2;
	_squadNameList deleteAt 0;

	_squadList = ["MRK", "AR", "AT", "TL", "CE", "MG", "MED"];

	{
		_unit = _group create3DENEntity ["Object", (_sideSymbol + (_classNameHashMap get _x)), [_xPosition, _yPosition, 0]];
		_unit setUnitLoadout (_kitHashmap get _x);
		set3DENAttributes [[[_unit], "TFAR_freq_sr", str(_srTFAR)], [[_unit], "description", (_roleDescription get _x)], [[_unit], "ControlMP", true], [[_unit], "ControlSP", false]];
		if (_forEachIndex isEqualTo 3) then
		{
			set3DENAttributes [[[_unit], "TFAR_freq_sr", str(_srTFAR) + ",30"]];
		};
		_yPosition = _yPosition - 2;
	} forEach _squadList;

	_xPosition = _xPosition + 4;
} forEach _allGroups;

{
	if (_forEachIndex isNotEqualTo 7) then
	{
		continue;
	};

	_group = _x;
	_roleDescription = createHashMapFromArray [["SL", "Squad Leader"],["MAT", "Medium Anti-Tank"],["AMAT", "Assistant Medium Anti-Tank"]];
	_yPosition = ((_basePosition select 1) - 8);

	_unitsToDelete = (units _x) - [leader _x];
	delete3DENEntities _unitsToDelete;

	_leader = leader _x;
	[_leader] set3DENObjectType (_sideSymbol + (_classNameHashMap get "SL"));
	_leader = leader _x;
	_leader setUnitLoadout (_kitHashmap get "SL");
	set3DENAttributes [[[_leader], "position", [_xPosition, _yPosition, 0]], [[_leader], "TFAR_freq_sr", str(_srTFAR) + ",30"], [[_leader], "TFAR_freq_lr", "30"], [[_leader], "description", (_roleDescription get "SL") + "@Mike"]];
	_leader setPos [_xPosition, _yPosition, 0];
	_yPosition = _yPosition - 2;

	_squadList = ["MAT", "AMAT", "AMAT"];
	{
		_unit = _group create3DENEntity ["Object", (_sideSymbol + (_classNameHashMap get _x)), [_xPosition, _yPosition, 0]];
		_unit setUnitLoadout (_kitHashmap get _x);
		set3DENAttributes [[[_unit], "TFAR_freq_sr", str(_srTFAR)], [[_unit], "description", (_roleDescription get _x)], [[_unit], "ControlMP", true], [[_unit], "ControlSP", false]];
		_yPosition = _yPosition - 2;
	} forEach _squadList;
} forEach _allGroups;

_xPosition = ((_basePosition select 0) - 14);
_squadNameList = ["Golf 1", "Golf 2", "Hotel 1", "Hotel 2"];
_srTFAR = 32;
{
	if (_forEachIndex < 8) then
	{
		continue;
	};
	if (_forEachIndex > 9) then
	{
		break;
	};

	_group = _x;
	_roleDescription = createHashMapFromArray [["CRL", "Vehicle Crew Lead"],["CR", "Vehicle Crew"]];
	_yPosition = ((_basePosition select 1) - 22);

	_unitsToDelete = (units _x) - [leader _x];
	delete3DENEntities _unitsToDelete;

	_leader = leader _x;
	[_leader] set3DENObjectType (_sideSymbol + (_classNameHashMap get "CRL"));
	_leader = leader _x;
	_leader setUnitLoadout (_kitHashmap get "CRL");
	set3DENAttributes [[[_leader], "position", [_xPosition, _yPosition, 0]], [[_leader], "TFAR_freq_sr", str(_srTFAR) + ",30"], [[_leader], "TFAR_freq_lr", "30"], [[_leader], "description", (_roleDescription get "CRL") + "@" + (_squadNameList select 0)]];
	_leader setPos [_xPosition, _yPosition, 0];
	_yPosition = _yPosition - 2;
	_squadNameList deleteAt 0;

	_squadList = ["CR", "CR"];
	{
		_unit = _group create3DENEntity ["Object", (_sideSymbol + (_classNameHashMap get _x)), [_xPosition, _yPosition, 0]];
		_unit setUnitLoadout (_kitHashmap get _x);
		set3DENAttributes [[[_unit], "TFAR_freq_sr", str(_srTFAR) + ",30"], [[_unit], "ace_isEngineer", 1], [[_unit], "description", (_roleDescription get _x)], [[_unit], "ControlMP", true], [[_unit], "ControlSP", false]];
		_yPosition = _yPosition - 2;
	} forEach _squadList;
	_srTFAR = _srTFAR + 1;

	_xPosition = _xPosition + 4;
} forEach _allGroups;

{
	if (_forEachIndex < 10) then
	{
		continue;
	};
	if (_forEachIndex > 11) then
	{
		break;
	};

	_group = _x;
	_roleDescription = createHashMapFromArray [["PL", "Pilot"]];
	_yPosition = ((_basePosition select 1) - 22);

	_unitsToDelete = (units _x) - [leader _x];
	delete3DENEntities _unitsToDelete;

	_leader = leader _x;
	[_leader] set3DENObjectType (_sideSymbol + (_classNameHashMap get "PL"));
	_leader = leader _x;
	_leader setUnitLoadout (_kitHashmap get "PL");
	set3DENAttributes [[[_leader], "position", [_xPosition, _yPosition, 0]], [[_leader], "TFAR_freq_sr", str(_srTFAR) + ",30"], [[_leader], "TFAR_freq_lr", "30"], [[_leader], "description", (_roleDescription get "PL") + "@" + (_squadNameList select 0)]];
	_leader setPos [_xPosition, _yPosition, 0];
	_yPosition = _yPosition - 2;
	_squadNameList deleteAt 0;

	_squadList = ["PL", "PL"];
	{
		_unit = _group create3DENEntity ["Object", (_sideSymbol + (_classNameHashMap get _x)), [_xPosition, _yPosition, 0]];
		_unit setUnitLoadout (_kitHashmap get _x);
		set3DENAttributes [[[_unit], "TFAR_freq_sr", str(_srTFAR) + ",30"], [[_unit], "TFAR_freq_lr", "30"], [[_unit], "ace_isEngineer", 1], [[_unit], "description", (_roleDescription get _x)], [[_unit], "ControlMP", true], [[_unit], "ControlSP", false]];
		_yPosition = _yPosition - 2;
	} forEach _squadList;
	_srTFAR = _srTFAR + 1;

	_xPosition = _xPosition + 4;
} forEach _allGroups;


{
	if (_forEachIndex > 0) then
	{
		break;
	};
	_roleDescriptionCompany = ["Platoon Command@Command HQ", "Executive Officer", "Platoon Sergeant", "Medic"];
	_xPosition = ((_basePosition select 0) - 10);

	_unitList = units _x;
	{
		set3DENAttributes [[[_x], "position", [_xPosition, (_basePosition select 1), 0]], [[_x], "description", (_roleDescriptionCompany select _forEachIndex)]];
		_x setPos [_xPosition, (_basePosition select 1), 0];
		_xPosition = _xPosition + 4;
	} forEach _unitList;
} forEach _allGroups;

{
	if (_forEachIndex < 12) then
	{
		continue;
	};

	_unitsToDelete = (units _x);
	delete3DENEntities _unitsToDelete;
} forEach _allGroups;


_allUnits = [];

{
	_allUnits append (units _x);
} forEach _allGroups;

save3DENInventory _allUnits;
