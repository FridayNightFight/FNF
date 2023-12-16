/*
	Author: Mallen

	Description:
		Gets a list of current kits, allows blayer to change the side of the kit to what is needed

	Parameter(s):
	  None

	Returns:
		None
*/

//THIS IS CURRENTLY NON-WORKING

_sideToSwitchTo = "B";

_allLayers = all3DENEntities select 6;

_unitsLayer = 0;
_infoLayer = 0;
_hostLayer = 0;

{
  _name = ((_x get3DENAttribute "name") select 0);

  _entities = get3DENLayerEntities _x;

  _infoFound = false;
  _selectorsFound = false;
  _unitsFound = false;

  _unitsLayerTemp = 0;
  _infoLayerTemp = 0;

  {
    if (typeName _x isEqualTo "SCALAR") then
    {
      _name = ((_x get3DENAttribute "name") select 0);
      switch (_name) do {
        case "Info": {_infoFound = true; _infoLayerTemp = _x;};
        case "Selectors": {_selectorsFound = true;};
        case "Units": {_unitsFound = true; _unitsLayerTemp = _x;};
      };
    };
  } forEach _entities;

  if (_infoFound and _selectorsFound and _unitsFound) then
  {
    _hostLayer = _x;
    _infoLayer = _infoLayerTemp;
    _unitsLayer = _unitsLayerTemp;
  }
} forEach _allLayers;

_groups = get3DENLayerEntities _unitsLayer;

{
  _groupInfo = [];
  //[[class,pos,rot,role desc,rank,TFAR_SR,TFAR_LR,Engi Status, is EOD, medi status, loadout, connections]]

  _players = units _x;
  {
    _class = ((_x get3DENAttribute "ItemClass") select 0);
    _pos = ((_x get3DENAttribute "position") select 0);
    _rot = ((_x get3DENAttribute "rotation") select 0);
    _roleDescription = ((_x get3DENAttribute "description") select 0);
    _rank = ((_x get3DENAttribute "rank") select 0);
    _tfarSR = ((_x get3DENAttribute "TFAR_freq_sr") select 0);
    _tfarLR = ((_x get3DENAttribute "TFAR_freq_lr") select 0);
    _engiStatus = ((_x get3DENAttribute "ace_isEngineer") select 0);
    _eodStatus = ((_x get3DENAttribute "ace_isEOD") select 0);
    _mediStatus = ((_x get3DENAttribute "ace_isMedic") select 0);
    _loadout = getUnitLoadout _x;
    _connections = get3DENConnections _x;
    _groupInfo pushBack [_class, _pos, _rot, _roleDescription, _rank, _tfarSR, _tfarLR, _engiStatus, _eodStatus, _mediStatus, _loadout, _connections];
  } forEach _players;

  _unitLeader = objNull;

  {
    _x params ["_class", "_pos", "_rot", "_roleDescription", "_rank", "_tfarSR", "_tfarLR", "_engiStatus", "_eodStatus", "_mediStatus", "_loadout", "_connections"];

    _classSplit = _class splitString "";
    _classSplit set [0, _sideToSwitchTo];
    _class = _classSplit joinString "";

    _createdEntity = create3DENEntity ["Object", _class, _pos];
    set3DENAttributes [[[_createdEntity], "rotation", _rot],[[_createdEntity], "ControlSP", false],[[_createdEntity], "ControlMP", true],[[_createdEntity], "description", _roleDescription],[[_createdEntity], "rank", _rank],[[_createdEntity], "TFAR_freq_sr", _tfarSR],[[_createdEntity], "TFAR_freq_lr", _tfarLR],[[_createdEntity], "ace_isEngineer", _engiStatus],[[_createdEntity], "ace_isEOD", _eodStatus],[[_createdEntity], "ace_isMedic", _mediStatus]];
    _createdEntity setUnitLoadout _loadout;
    save3DENInventory [_createdEntity];

    if (isNull _unitLeader) then
    {
      _unitLeader = group _createdEntity;
    } else {
      add3DENConnection ["Group", [_unitLeader], _createdEntity];
    };

    _connectionItems = [];

    {
      if (typeName _x isEqualTo "ARRAY" ) then
      {
        if (_x select 0 isEqualTo "Sync") then
        {
          _connectionItems pushBack (_x select 1);
        };
      };
    } forEach _connections;

    add3DENConnection ["Sync", _connectionItems, _createdEntity];
  } forEach _groupInfo;

  delete3DENEntities _players;
  _unitleader set3DENLayer _unitsLayer;
} forEach _groups;

delete3DENEntities _groups;

_infoEntities = get3DENLayerEntities _infoLayer;

_entitiesToDelete = [];

{
  if (typeName _x isEqualTo "OBJECT") then {
    _type = typeOf _x;
    switch (_type) do {
      case "SideBLUFOR_F";
      case "SideOPFOR_F";
      case "SideResistance_F":
      {
        _classToCreate = "";
        switch (_sideToSwitchTo) do {
          case "B": {_classToCreate = "SideBLUFOR_F";};
          case "O": {_classToCreate = "SideOPFOR_F";};
          case "I": {_classToCreate = "SideResistance_F";};
        };
        _createdEntity = create3DENEntity ["Logic", _classToCreate, getPos _x];
        _createdEntity set3DENLayer _infoLayer;
        _connections = get3DENConnections _x;
        _entitiesToDelete pushBack _x;
        _connectionItems = [];

        {
          if (typeName _x isEqualTo "ARRAY" ) then
          {
            if (_x select 0 isEqualTo "Sync") then
            {
              _connectionItems pushBack (_x select 1);
            };
          };
        } forEach _connections;

        add3DENConnection ["Sync", _connectionItems, _createdEntity];
      };
    };
  };
} forEach _infoEntities;

delete3DENEntities _entitiesToDelete;
