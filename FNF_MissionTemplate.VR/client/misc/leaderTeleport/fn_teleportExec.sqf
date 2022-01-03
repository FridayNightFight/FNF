params ["_source", "_scope"];


private _groupId = groupId (group player);
private _allGroups = allGroups select {side player isEqualTo side _x};
private _toTeleport = [];

private _validateSelection = {
	params ["_resultArr"];
	if (count _resultArr isEqualTo 0) exitWith {false};
	true
};


// leader of X-Ray
_getXray = {
	params ["_allGroups"];
	private _result = [];
	private _xray = (_allGroups select {(groupId _x) isEqualTo "XRAY"});
	if ([_xray] call _validateSelection) then {
		{_result pushBack (leader _x)} forEach _xray;
	};
	_result
};

// all members of Platoon HQs
_getPltHq = {
	params ["_allGroups"];
	private _result = [];
	private _platoon = (_allGroups select {(groupId _x) isEqualTo "PLTHQ"});
	if ([_platoon] call _validateSelection) then {
		{_result append (units _x)} forEach _platoon;
	};
	_result
};

// all Squad Leaders
_getSLs = {
	params ["_allGroups"];
	private _result = [];
	private _squads = ["A","B","C","D"];

	{
		// select the squad leader in A or A HQ, B or B HQ, etc
		private _groupChar = _x;
		private _groupsThatExist = _allGroups select {(groupId _x) in [_groupChar, (_groupChar + " HQ")]};
		if (count _groupsThatExist > 0) then {
			_result pushBack (leader (_groupsThatExist select 0));
		};
	} forEach _squads;
	_result
};

// all Team Leaders
_getTLs = {
	params ["_allGroups", "_groupId"];
	private _result = [];
	private _squads = [];
	_squads = ["A","B","C","D"];

	if (!isNil "_groupId") then {
		private _groupChar = _groupId select [0, 1];
		private _groupsThatExist = _allGroups select {(groupId _x) in [_groupChar, (_groupChar + "1"), (_groupChar + "2")]};
		if (count _groupsThatExist > 0) then {
			{
				_result pushBack (leader _x);
			} forEach _groupsThatExist;
		};
	} else {
		{
			// select only the first leader found in A, A1, A2
			private _groupChar = _x;
			private _groupsThatExist = _allGroups select {(groupId _x) in [(_groupId + "1"), (_groupId + "2")]};
			if (count _groupsThatExist > 0) then {
				{
					_result pushBack (leader _x);
				} forEach _groupsThatExist;
			};
		} forEach _squads;
	};
	_result
};

// all Squad members
_getSquadMembers = {
	// used for SLs teleporting all squad members
	params ["_allGroups", "_groupId"];
	private _result = [];

	private _groupChar = _groupId select [0, 1];
	private _groupsThatExist = _allGroups select {(groupId _x) in [_groupChar, (_groupChar + "1"), (_groupChar + "2")]};
	if (count _groupsThatExist > 0) then {
		{
			_result append (units _x);
		} forEach _groupsThatExist;
	};
	_result
};

// leader of Golf groups
_getGolfLeads = {
	params ["_allGroups"];
	private _result = [];
	private _golf = (_allGroups select {(groupId _x) in ["G1", "G2", "G3", "G4"]});
	if ([_golf] call _validateSelection) then {
		{_result pushBack (leader _x)} forEach _golf;
	};
	_result
};

// leader of Hotel groups
_getHotelLeads = {
	params ["_allGroups"];
	private _result = [];
	private _hotel = (_allGroups select {(groupId _x) in ["H1", "H2", "H3"]});
	if ([_hotel] call _validateSelection) then {
		{_result pushBack (leader _x)} forEach _hotel;
	};
	_result
};



switch (_source) do {
	case "Platoon Leader": {
		switch (_scope) do {
			case "leaders": {
				// teleport SLs, X lead, G lead, H lead

				// all members of Platoon HQs
				_toTeleport append ([_allGroups] call _getPltHq);

				// leader of X-Ray
				_toTeleport append ([_allGroups] call _getXray);

				// leaders of Golf groups
				_toTeleport append ([_allGroups] call _getGolfLeads);

				// leaders of Hotel groups
				_toTeleport append ([_allGroups] call _getHotelLeads);
			};
			case "sl": {
				// teleport all SLs

				// all members of Platoon HQs
				_toTeleport append ([_allGroups] call _getPltHq);

				// all Squad Leaders
				_toTeleport append ([_allGroups] call _getSLs);
			};
			case "sltl": {
				// teleport all SLs + TLs in platoon

				// all members of Platoon HQs
				_toTeleport append ([_allGroups] call _getPltHq);

				// all Squad Leaders
				_toTeleport append ([_allGroups] call _getSLs);

				// all Team Leaders
				_toTeleport append ([_allGroups] call _getTLs);
			};
			case "all": {
				// teleport all players on PL side
				{
					_toTeleport append (units _x);
				} forEach _allGroups;
			};
		};
	};
	case "Squad Leader": {
		switch (_scope) do {
			case "tl": {
				// teleport team leads
				_toTeleport append ([_allGroups, _groupId] call _getTLs);
			};
			case "all": {
				// teleport all squad members
				_toTeleport append ([_allGroups, _groupId] call _getSquadMembers);
			};
		};
	};
};

if (count _toTeleport isEqualTo 0) exitWith {["No players found to teleport", "error", 5] call phx_ui_fnc_notify};
_toTeleport = _toTeleport arrayIntersect _toTeleport;
_toTeleport deleteAt (_toTeleport find player);

if ([
	format["Are you sure you want to teleport %1 players?", count _toTeleport],
	"Leadership Teleport",
	"Confirm",
	true
] call BIS_fnc_guiMessage) then {

	// hintSilent format["Teleporting %1 players", count _toTeleport];
  [format["Teleporting %1 players", count _toTeleport], "success", 7] call phx_ui_fnc_notify;
	private _ring = 1;

	private _pos = (getPosATL player);

	while {count _toTeleport > 0} do {
		private _playersInThisRing = (_ring * 15);
		private _radius = (_ring * 5);
		private _angleIncrement = 360 / (_ring * 15);
		private _angle = 0;
		{
			private _placeAt = _pos vectorAdd [_radius * sin _angle, _radius * cos _angle, 0];
			_x setPosATL _placeAt;
			private _dir = _x getDir player;
			_x setDir _dir;
			_angle = _angle + _angleIncrement;
			_toTeleport deleteAt (_toTeleport find _x);
		} forEach (_toTeleport select [0, _playersInThisRing]);
		_ring = _ring + 1;
	};
	sleep 4;
};

