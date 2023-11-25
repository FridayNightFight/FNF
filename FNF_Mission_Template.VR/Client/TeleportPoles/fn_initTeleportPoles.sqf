/*
	Author: Mallen

	Description:
		Sets up the required teleport poles specified by modules

	Parameter(s):
		0: ARRAY -  An array of all teleport poles modules

	Returns:
		None
*/

params ["_modules"];

//sort by X,Y and Z, leading zeros added for expected behaviour near 0,0 coords
//could concievabley be an issue if map is more than 999999 meters wide (unlikely)
_modules = [_modules] call FNF_ClientSide_fnc_sortByLocation;

_tpCounter = 1;

{
  _syncedObjects = synchronizedObjects _x;
  _timePolesAreDeleted = _x getVariable ["fnf_timePolesAreDeleted", 15];
  //get side TP poles are wanted for
  _objSide = sideEmpty;

  _sideCounter = 0;

  {
    _objectType = typeOf _x;
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
        continue;
      };
    };
    _sideCounter = _sideCounter + 1;
  } forEach _syncedObjects;

  if (_sideCounter == 0) then
  {
    if (fnf_debug) then
    {
      systemChat "DANGER: Teleport pole module has no valid side synced to it, teleport poles will NOT function";
    };
    continue;
  };
  if (_sideCounter > 1) then
  {
    if (fnf_debug) then
    {
      systemChat "DANGER: Teleport pole module has more than one side synced to it, teleport poles will NOT function";
    };
    continue;
  };

  //if side is not player side then pass, not our problem
  if (_objSide != playerSide) then {continue;};

  //[position, action]
  _positionsAndActions = [];
  //sort by X,Y and Z, leading zeros added for expected behaviour near 0,0 coords
  //could concievabley be an issue if map is more than 999999 meters wide (unlikely)
  _syncedObjects = [_syncedObjects] call FNF_ClientSide_fnc_sortByLocation;

  {
    _objectType = typeOf _x;
    if (_objectType == "SideBLUFOR_F" or _objectType == "SideOPFOR_F" or _objectType == "SideResistance_F") then {continue;};

    _pos = getPos _x;

    //statement to tp player
    _statement = {
      params ["_target", "_player", "_params"];

      //_posToTPTo = [_params, 0, 5] call BIS_fnc_findSafePos;
      //this function was not working as intended for my functionailty

      _posToTPTo = getPos _params;
      player setPos _posToTPTo;
    };

    //create ace action and marker for tp pole
    _action = ["teleportTo" + str(_pos),"Teleport to pole " + str(_tpCounter),"",_statement,{true},{},_x] call ace_interact_menu_fnc_createAction;
    _markerstr = createMarkerLocal ["fnf_tpPoleMarker_" + str(_tpCounter),_pos];
    _markerstr setMarkerShapeLocal "ICON";
    _markerstr setMarkerTextLocal "Teleport " + str(_tpCounter);
    _markerstr setMarkerTypeLocal "mil_dot";

    _tpCounter = _tpCounter + 1;

    _positionsAndActions pushBack [_pos, _action, _markerstr];
  } forEach _syncedObjects;

  if (count _positionsAndActions == 0) then
  {
    if (fnf_debug) then
    {
      systemChat "DANGER: Teleport pole module has no objects to teleport to synced to it, teleport poles will NOT function";
    };
    continue;
  };

  if (count _positionsAndActions == 1) then
  {
    if (fnf_debug) then
    {
      systemChat "WARNING: Teleport pole module has only one object to teleport to synced to it";
    };
  };

  {
    _objectType = typeOf _x;
    if (_objectType == "SideBLUFOR_F" or _objectType == "SideOPFOR_F" or _objectType == "SideResistance_F") then {continue;};

    _pos = getPos _x;
    _object = _x;
    _markerstr = "";

    //add the TP action per pole
    {
      if ((_x select 0) isNotEqualTo _pos) then
      {
        [_object, 0, ["ACE_MainActions"], (_x select 1)] call ace_interact_menu_fnc_addActionToObject;
      } else {
        _markerstr = _x select 2;
      };
    } forEach _positionsAndActions;

    //add timer to delete when poles say they should
    [{
      params["_timePolesAreDeleted", "_object", "_markerstr"];
      _timeServerStarted = missionNamespace getVariable ["fnf_startTime", 0];
      _result = objNull;
      if (isServer and hasInterface) then
      {
        _result = time > (_timePolesAreDeleted * 60);
      } else {
        _result = (serverTime - _timeServerStarted) > (_timePolesAreDeleted * 60);
      };
      if (time < 1) then
      {
        _result = false;
      };
      _result;
    },{
      params["_timePolesAreDeleted", "_object", "_markerstr"];
      if (not isNull _object) then
      {
        deleteVehicle _object;
      };
      deleteMarkerLocal _markerstr;
    }, [_timePolesAreDeleted, _object, _markerstr]] call CBA_fnc_waitUntilAndExecute;

  } forEach _syncedObjects;

} forEach _modules;
