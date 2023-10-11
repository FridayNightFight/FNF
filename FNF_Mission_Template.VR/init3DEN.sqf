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

_addJIPitems = {
  params ["_messageID"];

  //if message is not mission exported exit
  if (_messageID != 6) exitWith {};

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
"[this, fnf_handleJIPLogic_" + str(_counter) + "] call FNF_ServerSide_fnc_handleJIPSyncing;"
    ];

    _connections = get3DENConnections _x;
    _connectionItems = [];

    //make sure connection is a sync and not group
    {
      if (typeName _x == "ARRAY" ) then
      {
        if (_x select 0 == "Sync") then
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

  {
    add3DENConnection ["Sync", _x select 1, _x select 0];
  } forEach _unitsToConnect;

  do3DENAction "MissionSave";

  fnf_handelingSave = false;
};

add3DENEventHandler ["OnMessage", _addJIPitems];