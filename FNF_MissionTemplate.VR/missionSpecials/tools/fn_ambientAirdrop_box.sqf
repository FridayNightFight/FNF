
params ["_vehicle", "_objectData"];

private ["_objectClass", "_objectCustomization"];
switch (typeName _objectData) do {
  case "ARRAY": { // if array, we've included customization data (for main assets airdrop)
    _objectClass = _objectData#0;
    _objectCustomization = _objectData#1;
  };
  case "STRING": {
    _objectClass = _objectData;
  };
};

private _box = createVehicle [_objectClass, [0,0,0], [], 0, "NONE"];
if (!isNil "_objectCustomization") then {
  _box call _objectCustomization;
};
private _para = createVehicle ["B_parachute_02_F", _vehicle modelToWorldVisual [0,-10,-10], [], 0, "CAN_COLLIDE"];

_para disableCollisionWith _vehicle;
_box setDir getDir _vehicle;
_para setDir getDir _box;

// _para setPos getPos _box;
_box lock false;
_box attachTo [_para, [0,0,0]];
_para setVelocity [0, 2, -5];

[
  {// wait until velocity meets threshold then monitor velocity/altitude to detect when near ground
    params ["_box","_para"];
    ((velocity _box) select 2) < -0.5
  },
  {
    [ // start monitoring
      {
        params ["_box","_para"];
        ((getPos _box) select 2) < 2 ||
        ((velocity _box) select 2) > -0.2 ||
        isNull _para ||
        (count (lineIntersectsWith [getPosASL _box, (getPosASL _box) vectorAdd [0, 0, -0.5], _box, _para])) > 0
      },
      {
        params ["_box","_para"];
        _box allowDamage false;
        _para disableCollisionWith _box;
        _box setVectorUp [0,0,1];
        // _box setVelocity [-2,0,-0.5];
        detach _box;
        _safePos = ((getPos _box) select [0, 2]) findEmptyPosition [0, 50, "Land_Offices_01_V1_F"];
        if (count _safePos > 0) then {
          _box setPos _safePos;
        };

        if (!isNull _para) then {deleteVehicle _para};


        // add smoke/flare/chemlights to aid in retrieval
        // _box = cursorObject;
        (boundingBoxReal _box) params ["_min", "_max", "_diameter"];
        private _midHeight = (_min#2 + _max#2) / 2;
        _boxCorners = [
          [_min#0, _min#1, _midHeight],
          [_min#0, _max#1, _midHeight],
          [_max#0, _min#1, _midHeight],
          [_max#0, _max#1, _midHeight]
        ];

        private _attachedAids = [];
        if !(fnf_environment_isDaytime) then {
          // if nighttime, chemlights
          {
            _chemlight = "ACE_G_Chemlight_HiYellow_infinite" createVehicle (_box modelToWorld _x);
            // _chemlight attachTo [_box, _x];
            _attachedAids pushBack _chemlight;
          } forEach _boxCorners;
        };
        // _box setVariable ["attachedAids", _attachedAids];
        [{
          {
            deleteVehicle _x;
          } forEach (_this select {!isNull _x});
        }, _attachedAids, 300] call CBA_fnc_waitAndExecute;

        // make box vulnerable to damage again after 10 seconds
        [{_this allowDamage true}, _box, 10] call CBA_fnc_waitAndExecute;
      },
      _this
    ] call CBA_fnc_waitUntilAndExecute;
  },
  [_box, _para]
] call CBA_fnc_waitUntilAndExecute;


[
  {
    params ["_box","_para"];
    isTouchingGround _box
  },
  {
    params ["_box","_para"];


  },
  [_box, _para]
] call CBA_fnc_waitUntilAndExecute;
