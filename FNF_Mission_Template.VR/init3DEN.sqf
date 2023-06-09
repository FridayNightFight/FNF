/*
	Author: Mallen

	Description:
		Used to create alternatives for JIP players as they are not synced, done automatically so never an issue (in theory)

	Parameter(s):
		None

	Returns:
		None
*/

_addJIPitems = {
  _currentItems = all3DENEntities;
  _objectsToLookAt = _currentItems select 0;

  _unitsToProcess = [];

  {
    if (_x iskindof "man") then
    {
      _unitsToProcess pushBack _x;
    };
  } forEach _objectsToLookAt;

  _counter = 0;
  _unitsToDelete = [];
  _unitsToConnect = [];

  {
    _posToSpawn = getPos _x;
    _logicAssignedToPlayer = create3DENEntity ["Object", "Logic", _posToSpawn];
    _logicAssignedToPlayer set3DENAttribute ["name", "fnf_handleJIPLogic_" + str(_counter)];

    _x set3DENAttribute ["init",
"if (isNil 'fnf_syncConnectionsComplete') then
{
  fnf_syncConnectionsComplete = 0;
};
_syncedObjects = synchronizedObjects fnf_handleJIPLogic_" + str(_counter) + ";
this synchronizeObjectsAdd _syncedObjects;
fnf_syncConnectionsComplete = fnf_syncConnectionsComplete + 1;"
    ];

    _connections = get3DENConnections _x;
    _connectionItems = [];
    {
      if (typeName _x == "ARRAY" ) then
      {
        if (_x select 0 == "Sync") then
        {
          _connectionItems pushBack (_x select 1);
        };
      };
    } forEach _connections;

    add3DENConnection ["Sync", _connectionItems, _logicAssignedToPlayer];
    remove3DENConnection ["Sync", _connectionItems, _x];

    _counter = _counter + 1;
  } forEach _unitsToProcess;
};

add3DENEventHandler ["OnMissionSave", _addJIPitems];
add3DENEventHandler ["OnMissionAutoSave", _addJIPitems];
