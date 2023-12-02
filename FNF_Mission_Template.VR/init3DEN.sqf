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
    _splitString = [_initField, "[this, fnf_handleJIPLogic_", true] call BIS_fnc_splitString;
    if (count _splitString isNotEqualTo 2) then
    {
      continue;
    };
    _text = _splitString select 1;
    _splitString = [_text, "] call FNF_ServerSide_fnc_handleJIPSyncing;", true] call BIS_fnc_splitString;
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

  _currentItems = all3DENEntities;
  _objectsToLookAt = _currentItems select 0;

  _unitsToProcess = [];

  //get all objects considered a man
  {
    if (_x iskindof "man") then
    {
      if ((_x get3DENAttribute "ControlMP") select 0) then
      {
        _unitsToProcess pushBack _x;
      };
    };
  } forEach _objectsToLookAt;

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
"[fnf_handleJIPLogic_" + str(_counter) + "] call FNF_ClientSide_fnc_requestJIPObjects;"
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

  do3DENAction "MissionExportMP";

  delete3DENEntities _unitsToDelete;

  //reconnect syncs so it is seamless for player
  {
    add3DENConnection ["Sync", _x select 1, _x select 0];
    (_x select 0) set3DENAttribute ["init", ""];
  } forEach _unitsToConnect;

  do3DENAction "MissionSave";

  fnf_handelingSave = false;
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

add3DENEventHandler ["OnMessage", _addJIPitems];
add3DENEventHandler ["OnPaste", _incrementNumberOnPaste];
add3DENEventHandler ["OnDeleteUnits", _removeEmptyLayers];
