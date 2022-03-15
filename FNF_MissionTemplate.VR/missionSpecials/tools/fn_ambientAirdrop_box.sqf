
params ["_vehicle"];

private _boxClass = selectRandom(["CargoNet_01_box_F","CargoNet_01_barrels_F"]);
private _box = createVehicle [_boxClass, [0,0,0], [], 0, "NONE"];
private _para = createVehicle ["B_parachute_02_F", _vehicle modelToWorldVisual [0,-6,-8], [], 0, "CAN_COLLIDE"];

_para disableCollisionWith _vehicle;
_para setDir getDir _box;
// _para setPos getPos _box;
_box lock false;
_box attachTo [_para, [0,0,0]];

[
  {
    params ["_box","_para"];
    ((position _box) select 2) < 2 || 
    isNull _para || 
    (count (lineIntersectsWith [getPosASL _box, (getPosASL _box) vectorAdd [0, 0, -0.5], _box, _para])) > 0
  },
  {
    params ["_box","_para"];
    _para disableCollisionWith _box;
    _box setVectorUp [0,0,1];
    // _box setVelocity [-2,0,-0.5];
    detach _box;

    if (!isNull _para) then {deleteVehicle _para};
  },
  [_box, _para]
] call CBA_fnc_waitUntilAndExecute;