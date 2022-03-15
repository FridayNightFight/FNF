/*
  Author: Nelson Duarte

  Description:
  Spawns an ambient air unit, makes it move and deletes it when it reaches destination
  Vehicle will never engage and will be flagged as captive
  Good for simple creation of ambient fly by's

  Parameter(s):
  _this select 0:	ARRAY - The position where vehicle will spawn
  _this select 1:	ARRAY - The end position of the vehicle, it will be deleted here
  _this select 2:	NUMBER - The spawn and flight height of the vehicle
  _this select 3:	STRING - The speed the vehicle will move ("LIMITED", "NORMAL", "FULL")
  _this select 4:	STRING - The classname of the vehicle to spawn
  _this select 5:	SIDE - The side the vehicle belongs
  
  Returns:
  BOOL - true on success
*/

//Params
params [
  ["_positions", [[0,0,0],[0,0,0],[0,0,0],[0,0,0]], [[]]],
  ["_bearings", [90, 270], [[]]],
  ["_dropSpread", 1000, [1]],
  ["_height", 100, [0]],
  ["_speed", "NORMAL", [""]],
  ["_class", "B_Heli_Light_01_F", [""]],
  ["_count", 3, [1]],
  ["_side", WEST, [WEST]]
];

_positions params ["_startPos", "_startDropPos", "_dropTarget", "_dropTargetAdjusted", "_endDropPos", "_endPos"];

//Set spawn height
_startPos set [2, _height];

//The starting direction of the vehicle
_bearings params ["_direction", "_directionRev"];

private _formation = "WEDGE";

private _mainVehicleGroup = createGroup [_side, true];
_mainVehicleGroup allowFleeing 0;
_mainVehicleGroup setCombatMode "BLUE";
_mainVehicleGroup setBehaviourStrong "CARELESS";
_mainVehicleGroup setFormation _formation;


for "_i" from 1 to _count do {
  //Spawn the vehicles
  private _thisStartPos = _startPos getPos [100 + (_i*200), _directionRev];
  _thisStartPos set [2, _height];

  _vehicleContainer	= [_thisStartPos, _direction, _class, _mainVehicleGroup] call BIS_fnc_spawnVehicle;
  _vehicleContainer params ["_vehicle", "_vehicleCrew", "_vehicleGroup"];
  _vehicleGroupLeader = leader _vehicleGroup;
  _vehicle setVectorUp [0, 0, 1];
  _vehicle setVelocityModelSpace [0, 75, 0];

  // private _spawnPos = _startPos getPos [100, random(360)];
  // _spawnPos set [2, _height];

  // _vehicle = createVehicle [_class, _spawnPos, [], 0, "FLY"];
  // _vehicle setDir _direction;
  // _vehicle setVelocityModelSpace [0, 88, 0];
  // [_vehicle, _mainVehicleGroup] call BIS_fnc_spawnCrew;

  _vehicle setVariable ["dropTarget", _dropTarget];
  _vehicle setVariable ["dropSpread", _dropSpread];


  // Fly height and speed
  _vehicle flyInHeight _height;
  // _vehicle flyInHeightASL [200, 1000, 1000];
  // _vehicle limitSpeed 300;
  _vehicle forceSpeed 75;

  (fnf_ambientAirdrop getVariable ["airUnits", []]) pushBack _vehicle;
};

// The vehicle/group should ignore it's surroundings
{
  _x disableAi "TARGET";
  _x disableAi "AUTOTARGET";
  _x setCaptive true;
  _x allowDamage false;
} forEach (units _mainVehicleGroup);




// DROP POS
private "_startDropWaypoint";
_startDropWaypoint = _mainVehicleGroup addWaypoint [_startDropPos, -1];

//Set waypoint properties
_startDropWaypoint setWaypointType "MOVE";
_startDropWaypoint setWaypointBehaviour "CARELESS";
_startDropWaypoint setWaypointCombatMode "BLUE";
_startDropWaypoint setWaypointSpeed _speed;
_startDropWaypoint setWaypointFormation _formation;





//The waypoint statements
//Once unit completes waypoint we clean up crew/vehicle/group
_startDropWaypoint setWaypointStatements [
  "true",
  "
  if (!isServer) exitWith {};
  _vehicles = thisList apply {vehicle _x} select {_x isKindOf 'Air'};
  _vehicles = _vehicles arrayIntersect _vehicles;
  {
    private _vehicle = _x;
    private _dropTarget = _vehicle getVariable 'dropTarget';
    private _dropSpread = _vehicle getVariable 'dropSpread';
    [{
      params ['_vehicle', '_dropTarget', '_dropSpread'];
      _vehicle distance2D _dropTarget < _dropSpread
    }, {
      [{
        _args params ['_vehicle', '_dropTarget', '_dropSpread'];
        [_vehicle] call fnf_missionSpecials_fnc_ambientAirdrop_box;
        if (_vehicle distance2D _dropTarget > _dropSpread) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
      }, linearConversion [100, 500, speed _vehicle, 2.4, 0.3, true], _this] call CBA_fnc_addPerFrameHandler;
    }, [_vehicle, _dropTarget, _dropSpread]] call CBA_fnc_waitUntilAndExecute;
  } forEach _vehicles;
  "
];

private "_endDropWaypoint";
_endDropWaypoint = _mainVehicleGroup addWaypoint [_endDropPos, -1];

//Set waypoint properties
_endDropWaypoint setWaypointType "MOVE";
_endDropWaypoint setWaypointBehaviour "CARELESS";
_endDropWaypoint setWaypointCombatMode "BLUE";
_endDropWaypoint setWaypointSpeed _speed;
_endDropWaypoint setWaypointFormation _formation;




// END POS
private "_waypoint";
_waypoint = _mainVehicleGroup addWaypoint [_endPos, -1];

//Set waypoint properties
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointSpeed _speed;
_waypoint setWaypointFormation _formation;


//The waypoint statements
//Once unit completes waypoint we clean up crew/vehicle/group
_waypoint setWaypointStatements [
  "true",
  "private _group = group this; 
  if (local _group) then 
  {
    _vehicles = thisList apply {vehicle _x} select {_x isKindOf 'Air'};
    _vehicles = _vehicles arrayIntersect _vehicles;
    {
      private _vehicle = _x; 
      { _vehicle deleteVehicleCrew _x } forEach crew _vehicle; 
      deleteVehicle _vehicle;
    } forEach _vehicles;

    { deleteVehicle _x } forEach units _group;
    deleteGroup _group;
  }"
];


//Valid
if (!isNull _mainVehicleGroup) then {
  true;
} else {
  false;
};
