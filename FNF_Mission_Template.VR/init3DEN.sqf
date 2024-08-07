/*
	Author: Mallen

	Description:
		Used to create alternatives for JIP players as they are not synced, done automatically so never an issue (in theory)

	Parameter(s):
		None

	Returns:
		None
*/

fnf_handelingSave = false;

_currentEntities = all3DENEntities;
_currentObjects = _currentEntities select 0;
_currentMarkers = _currentEntities select 5;

_allLogic = [];
{
	if (typeOf _x isEqualTo "Logic") then
	{
		_allLogic pushBack _x;
	};
} forEach _currentObjects;

_allUnits = [];
{
	if (_x isKindOf "Man") then
	{
		_allUnits pushBack _x;
	};
} forEach _currentObjects;

//high likelyhood that mission has been exported before, time to reverse that
if (count _allLogic >= count _allUnits and count _allUnits isNotEqualTo 0) then
{
	_unitsToDelete = [];
	{
		//get unit ID
		_unit = _x;
		_initField = (_unit get3DENAttribute "init") select 0;
		_splitString = [_initField, "[fnf_handleJIPLogic_", true] call BIS_fnc_splitString;
		if (count _splitString isNotEqualTo 2) then
		{
			continue;
		};
		_text = _splitString select 1;
		_splitString = [_text, ", this] call FNF_ClientSide_fnc_requestJIPObjects;", true] call BIS_fnc_splitString;
		if (count _splitString isNotEqualTo 2) then
		{
			continue;
		};
		_unitID = _splitString select 0;

		//find logic with same ID
		_foundLogic = objNull;
		{
			_variableName = (_x get3DENAttribute "name") select 0;
			_splitString = [_variableName, "fnf_handleJIPLogic_", true] call BIS_fnc_splitString;
			if (count _splitString isNotEqualTo 2) then
			{
				continue;
			};
			_logicID = _splitString select 1;

			if (_unitID isEqualTo _logicID) then
			{
				_foundLogic = _x;
				break;
			};
		} forEach _allLogic;

		//if none found exit this unit
		if (isNull _foundLogic) then
		{
			continue;
		};

		_connections = get3DENConnections _foundLogic;
		_connectionItems = [];

		//make sure connection is a sync and not group
		{
			if (typeName _x isEqualTo "ARRAY" ) then
			{
				if (_x select 0 isEqualTo "Sync") then
				{
					_connectionItems pushBack (_x select 1);
				};
			};
		} forEach _connections;

		//fix connections, send logic for deletion
		add3DENConnection ["Sync", _connectionItems, _unit];

		_unit set3DENAttribute ["init", ""];

		_unitsToDelete pushBack _foundLogic;
	} forEach _allUnits;

	{
		_alpha = (_x get3DENAttribute "alpha") select 0;
		if (_alpha isEqualTo 0) then
		{
			_x set3DENAttribute ["alpha", 0.99];
		};
	} forEach _currentMarkers;

	delete3DENEntities _unitsToDelete;

	do3DENAction "MissionSave";
};

//used to add JIP handelers when mission is exported
_addJIPitems = {
	params ["_messageID"];

	//if message is not mission exported exit
	if (_messageID isNotEqualTo 6) exitWith {};

	//if code is already running exit
	if (fnf_handelingSave) exitWith {};

	//restrict further code form handeling save
	fnf_handelingSave = true;

	["Export Operations", "Various operations conducted on export, don't worry about this!"] collect3DENHistory
	{
	_currentItems = all3DENEntities;
	_objectsToLookAt = _currentItems select 0;
	_markersToLookAt = _currentItems select 5;
	_groupsToLookAt = _currentItems select 1;

	_unitsToProcess = [];
	_allOtherObjects = [];

	//get all objects considered a man
	{
		if (_x iskindof "man") then
		{
			if ((_x get3DENAttribute "ControlMP") select 0) then
			{
				_unitsToProcess pushBack _x;
			};
		} else {
			_allOtherObjects pushBack _x;
		};
	} forEach _objectsToLookAt;

	//set group ids from role descriptions given
	_groupsSet = createHashMapFromArray [[west, []],[east, []],[independent,[]]];
	_groupPrefixs = createHashMapFromArray [[west, ""],[east, " "],[independent,"  "]];

	{
		_leader = leader _x;
		_side = side _leader;
		_roleDescription = (_leader get3DENAttribute "description") select 0;
		_splitString = _roleDescription splitString "@";
		if (count _splitString isEqualTo 2) then
		{
			_groupName = (_splitString select 1);
			_groupsAlreadySet = _groupsSet get _side;
			if (_groupName in _groupsAlreadySet) then
			{
				_groupID = (_x get3DENAttribute "groupID") select 0;
				systemChat ("WARNING: Group " + _groupID + " has a duplicate group name");
			} else {
				_x set3DENAttribute ["groupID", (_groupName + (_groupPrefixs get _side))];
				_groupsAlreadySet pushBack _groupName;
				_groupsSet set [_side, _groupsAlreadySet];
			};
		} else {
			_groupID = (_x get3DENAttribute "groupID") select 0;
			systemChat ("WARNING: Group " + _groupID + " leader does not have its role description set properly");
		};
	} forEach _groupsToLookAt;

	_counter = 0;
	_unitsToDelete = [];
	_unitsToConnect = [];

	{

		_posToSpawn = getPos _x;

		//add dummy logic and name it based on counter
		_logicAssignedToPlayer = create3DENEntity ["Object", "Logic", _posToSpawn];
		_logicAssignedToPlayer set3DENAttribute ["name", "fnf_handleJIPLogic_" + str(_counter)];

		//set init via this:
		_x set3DENAttribute ["init",
"[fnf_handleJIPLogic_" + str(_counter) + ", this] call FNF_ClientSide_fnc_requestJIPObjects;"
		];

		_connections = get3DENConnections _x;
		_connectionItems = [];

		//make sure connection is a sync and not group
		{
			if (typeName _x isEqualTo "ARRAY" ) then
			{
				if (_x select 0 isEqualTo "Sync") then
				{
					_connectionItems pushBack (_x select 1);
				};
			};
		} forEach _connections;

		//add all syncs for dummy logc and remove from player
		add3DENConnection ["Sync", _connectionItems, _logicAssignedToPlayer];
		remove3DENConnection ["Sync", _connectionItems, _x];

		//track what needs to be deleted (dummy logic), and what connections things should have
		_unitsToDelete pushBack _logicAssignedToPlayer;

		_unitsToConnect pushBack [_x, _connectionItems];

		_counter = _counter + 1;
	} forEach _unitsToProcess;

	//make markers invisible that have an alpha of 0.99
	_markersToReset = [];
	{
		_alpha = (_x get3DENAttribute "alpha") select 0;
		if (_alpha isEqualTo 0.99) then
		{
			_x set3DENAttribute ["alpha", 0];
			_markersToReset pushBack _x;
		};
	} forEach _markersToLookAt;

	_vicInventorys = [];

	{
		_objectType = _x call BIS_fnc_objectType;
		_objectType = _objectType select 0;

		if (((_x get3DENAttribute "FNF_InventoryAutoClear") select 0) && !(_objectType isEqualTo "Object")) then
		{
			_inventory = ((_x get3DENAttribute "ammoBox") select 0);

			_vicInventorys pushBack [_x, _inventory];
			_x set3DENAttribute ["ammoBox","[[[[],[]],[[],[]],[[],[]],[[],[]]],false]"];
		};
	} forEach _allOtherObjects;

	do3DENAction "MissionExportMP";

	{
		_x params ["_vic", "_inventory"];
		_vic set3DENAttribute ["ammoBox", _inventory];
	} forEach _vicInventorys;

	{
		_x set3DENAttribute ["alpha", 0.99];
	} forEach _markersToReset;

	delete3DENEntities _unitsToDelete;

	//reconnect syncs so it is seamless for player
	{
		add3DENConnection ["Sync", _x select 1, _x select 0];
		(_x select 0) set3DENAttribute ["init", ""];
	} forEach _unitsToConnect;

	do3DENAction "MissionSave";

	fnf_handelingSave = false;
	};
};

//used to increment marker numbers on copy and paste, useful for mission making
_incrementNumberOnPaste = {
	_selectedItems = get3DENSelected "marker";
	{
		_splitText = _x splitString "_";
		if (count _splitText > 1) then
		{
			_number = parseNumber (_splitText select ((count _splitText) - 1));
			_x set3DENAttribute ["text", str(_number)];
		};
	} forEach _selectedItems;
};

//remove any layers that are empty to keep mission file size down
_removeEmptyLayers = {
	_amountDeleted = 0;
	_currentItems = all3DENEntities;
	_layers = _currentItems select 6;
	{
		_entities = get3DENLayerEntities _x;
		if (count _entities isEqualTo 0) then
		{
			_amountDeleted = _amountDeleted + 1;
		};
	} forEach _layers;
	if (_amountDeleted isNotEqualTo 0) then {
		["Removed Empty Layers", "Removed " + str(_amountDeleted) + " empty layers"] collect3DENHistory {
			_currentItems = all3DENEntities;
			_layers = _currentItems select 6;
			{
				_entities = get3DENLayerEntities _x;
				if (count _entities isEqualTo 0) then
				{
					remove3DENLayer _x;
				};
			} forEach _layers;
		};
	};
};

add3DENEventHandler ["OnMessage", _addJIPitems];
add3DENEventHandler ["OnPaste", _incrementNumberOnPaste];
add3DENEventHandler ["OnDeleteUnits", _removeEmptyLayers];
