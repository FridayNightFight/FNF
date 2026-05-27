/*
	Author: Mallen

	Description:
		Used to init personal rearm boxes for players

	Parameter(s):
		0: ARRAY -	An array of all personal rearm modules

	Returns:
		None
*/

params["_modules"];

{
	_syncedObjects = synchronizedObjects _x;
	_forPlayer = false;
	_boxs = [];

	{
		_objectType = typeOf _x;
		_objSide = sideUnknown;
		switch (_objectType) do
		{
			case "SideBLUFOR_F":
			{
				_objSide = west;
			};
			case "SideOPFOR_F":
			{
				_objSide = east;
			};
			case "SideResistance_F":
			{
				_objSide = independent;
			};
			default
			{
				if (_x isEqualTo player) then
				{
					_forPlayer = true;
					continue;
				};
				if ((not isPlayer _x) and (not (_objectType isEqualTo "Logic"))) then
				{
					_boxs pushBack _x;
				};
			};
		};

		if (_objSide isEqualTo playerSide) then
		{
			_forPlayer = true;
		};
	} forEach _syncedObjects;

	//if rearm is not for player continue
	if (not _forPlayer) then {continue;};

	_rearmOptions = [];
	{
		_itemsInBox = getItemCargo _x;
		if (_itemsInBox isNotEqualTo [[],[]]) then
		{
			_rearmOptions pushBack _x;
		};
	} forEach _boxs;

	//if no samplebox, nothing to rearm?
	if ((count _rearmOptions) isEqualTo 0) then {continue;};

	_boxs = _boxs - _rearmOptions;

	//if no box to rearm from then cannot rearm?
	if (count _boxs < 1) then {continue;};

	//check if boxes have selector options assigned to them, if none do treat them as an AND statement, otherwise ignore ones without and turn them to boxs
	_noSelectorOptionBoxs = [];
	_selectorOptionBoxs = [];
	{
		_syncedObjects = synchronizedObjects _x;
		{
			_objectType = typeOf _x;
			if (_objectType isEqualTo "") then
			{
				_selectorOptionBoxs pushBack _x;
			} else {
				_noSelectorOptionBoxs pushBack _x;
			};
		} forEach _syncedObjects;
	} forEach _rearmOptions

	if (count _selectorOptionBoxs > 0) then
	{
		{
			clearItemCargoGlobal _x;
			_boxs pushBack _x;
		} forEach _noSelectorOptionBoxs;
		_noSelectorOptionBoxs = [];
	};

} forEach _modules;


{
	_action = ["reArmAction" + str(_forEachIndex), "Re-Arm Items", "", {
		params ["_target", "_player", "_params"];
		//check if i can give items
		_reArmTimings = missionNamespace getVariable ["fnf_serverReArmTimings", createHashMap];
		_roleDesc = roleDescription player;
		_roleDesc = _roleDesc + str(playerSide);
		{
			_rearmKey = _x;
			_result = _roleDesc find _rearmKey;
			if (_result isNotEqualTo -1) then
			{
				_roleDesc = _rearmKey;
			};
		} forEach _reArmTimings;
		_currentTimer = _reArmTimings getOrDefault [_roleDesc, 0];

		_timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];
		_result = objNull;
		if (isServer and hasInterface) then
		{
			_result = time > _currentTimer;
		} else {
			_result = (serverTime - _timeServerStarted) > _currentTimer;
		};
		if (time < 1) then
		{
			_result = false;
		};

		if (_result) then
		{
			_reArmItems = createHashMapFromArray [
				["@Echo 1WEST", 1],
				["@Echo 2WEST", 1],
				["@Echo 3WEST", 1],
				["@Echo 1GUER", 1],
				["@Echo 2GUER", 1],
				["@Echo 3GUER", 1],
				["@IndiaWEST", 4],
				["@IndiaGUER", 4],
				["@Foxtrot 3WEST", 2],
				["@Foxtrot 3GUER", 3]
			];

			{
				_rearmKey = _x;
				_result = _roleDesc find _rearmKey;
				if (_result isNotEqualTo -1) then
				{
					_roleDesc = _rearmKey;
				};
			} forEach _reArmItems;

			_key = _reArmItems getOrDefault [_roleDesc, -1];

			_badEchoSelector = 0;

			switch (_key) do {
				case 1: {/*Echo*/
				_selToAmmo = createHashMapFromArray [
					["rhs_mag_maaws_HEAT", [["rhs_mag_maaws_heat", 2]]],
					["rhs_fim92_mag", [["rhs_fim92_mag", 1]]],
					["rhs_mag_maaws_HE", [["rhs_mag_maaws_he", 2]]],
					["UK3CB_BAF_NLAW_Launcher", [["UK3CB_BAF_NLAW_Launcher", 1]]],
					["BWA3_CarlGustav_HEDP", [["BWA3_CarlGustav_HEDP", 2], ["BWA3_CarlGustav_Smoke", 1]]],
					["BWA3_CarlGustav_HEAT", [["BWA3_CarlGustav_HEAT", 2], ["BWA3_CarlGustav_Smoke", 1]]],
					["BWA3_CarlGustav_HE", [["BWA3_CarlGustav_HE", 2], ["BWA3_CarlGustav_Smoke", 1]]],
					["UK3CB_BAF_Javelin_CLU", [1]]
				];

				_playerGroup = group player;
				_sel = _playerGroup getVariable ["FNF_StupidEchoSelectorBS", []];

				//Search sleection for a required item
				_ammoToGive = [0];
				{
					_ammoToGiveTemp = _selToAmmo getOrDefault [_x, []];
					if (_ammoToGiveTemp isNotEqualTo []) then
					{
						_ammoToGive = _ammoToGiveTemp;
					};
				} forEach _sel;

				if (_ammoToGive isEqualTo [0]) then
				{
					_badEchoSelector = 1;
				} else {
					if (_ammoToGive isEqualTo [1]) then
					{
						_badEchoSelector = 2;
					} else {
						//give player item
						{
							_target addItemCargoGlobal _x;
						} forEach _ammoToGive;
					};
				};

				};
				case 2: {/*bluforFox3*/
				_ammoToGive = ["ACE_UAVBattery", 2];
				_target addItemCargoGlobal _ammoToGive;
				_bpToGive = [["B_UAV_01_backpack_F", 2]];
				{
					_target addBackpackCargoGlobal _x;
				} forEach _bpToGive;
				};
				case 3: {/*opforFox3*/
				_ammoToGive = ["ACE_UAVBattery", 2];
				_target addItemCargoGlobal _ammoToGive;
				_bpToGive = [["I_E_UAV_01_backpack_F", 2]];
				{
					_target addBackpackCargoGlobal _x;
				} forEach _bpToGive;
				};
				case 4: {/*india*/
				_ammoToGive = [["rhs_mine_msk40p_white_mag", 6], ["SatchelCharge_Remote_Mag", 2], ["ATMine_Range_Mag", 4]];
				{
					_target addItemCargoGlobal _x;
				} forEach _ammoToGive;
				};
				default { };
			};

			_reArmTimings = missionNamespace getVariable ["fnf_serverReArmTimings", createHashMap];
			_result = 0;
			if (isServer and hasInterface) then
			{
				_result = time + 3600;
			} else {
				_result = (serverTime - _timeServerStarted) + 3600;
			};
			_reArmTimings set [_roleDesc, _result];
			if (_badEchoSelector isEqualTo 0) then
			{
				missionNamespace setVariable ["fnf_serverReArmTimings", _reArmTimings, true];
				["<t size='1.5' align='center'>Re-arm items in container</t><br/>", "info"] call FNF_ClientSide_fnc_notificationSystem;
			};
			if (_badEchoSelector isEqualTo 1) then
			{
				["<t size='1.5' align='center'>Could not find Missile Specialist launcher selection</t><br/>", "error"] call FNF_ClientSide_fnc_notificationSystem;
			};
			if (_badEchoSelector isEqualTo 2) then
			{
				["<t size='1.5' align='center'>Cannot re-arm Javelin</t><br/>", "error"] call FNF_ClientSide_fnc_notificationSystem;
			};
		};
	}, {
		true
	}, {}, [], [0, 0, 0], 5, [false,false,false,false,false], {
		params ["_target", "_player", "_params", "_actionData"];
		_reArmTimings = missionNamespace getVariable ["fnf_serverReArmTimings", createHashMap];
		_roleDesc = roleDescription player;
		_roleDesc = _roleDesc + str(playerSide);
		{
			_rearmKey = _x;
			_result = _roleDesc find _rearmKey;
			if (_result isNotEqualTo -1) then
			{
				_roleDesc = _rearmKey;
			};
		} forEach _reArmTimings;
		_currentTimer = _reArmTimings getOrDefault [_roleDesc, 0];

		_timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];
		_time = 0;
		if (isServer and hasInterface) then
		{
			_time = _currentTimer - time;
		} else {
			_time = _currentTimer - (serverTime - _timeServerStarted);
		};

		if (_time < 1) then
		{
			_actionData set [1, "Re-Arm Items: Ready to Re-Arm"];
		} else {
			_timeString = [_time, "MM:SS"] call BIS_fnc_secondsToString;
			_actionData set [1, format ["Re-Arm Items: %1", _timeString]];
		};
	}] call ace_interact_menu_fnc_createAction;

	[_x, 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToObject;
} forEach _reArmBoxes;
