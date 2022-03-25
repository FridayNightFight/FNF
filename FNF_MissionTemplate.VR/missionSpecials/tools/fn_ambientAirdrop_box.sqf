// some code taken from BIS_fnc_supplyDrop
params ["_veh", "_objectData"];

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


_dropPos = position _veh;
_pos = [(_dropPos select 0), (_dropPos select 1), (_dropPos select 2) - 20];
private _crate = createVehicle [_objectClass, _pos, [], 0, "NONE"];
_crate setVelocity [(((velocity _veh) select 0) / 2),(((velocity _veh) select 1) / 2),((velocity _veh) select 2)-25];
_crate setDir (direction _veh);
if (!isNil "_objectCustomization") then {
  _crate call _objectCustomization;
};

[_crate, _makeSmoke] remoteExecCall ["fnf_missionSpecials_fnc_ambientAirdrop_smoke", [0, -2] select isDedicated];
_cratePos = position _crate;


private _paraSide = switch ([_crate, true] call BIS_fnc_objectSide) do {
  case east: {"O"};
  case independent: {"I"};
  default {"B"}
};
private _paraName = format["%1_Parachute_02_F", _paraSide];

private _para = createVehicle [_paraName, _cratePos, [], 0, "NONE"];
_para setDir (direction _veh);
_para setVelocity [((velocity _crate) select 0),((velocity _crate) select 1) ,((velocity _crate) select 2) ];

_para setVectorUp [0,0,1];
_crate setVectorUp [0,0,1];
_crate attachTo [_para,[0,0,0]];

[
  {// wait until velocity meets threshold then monitor velocity/altitude to detect when near ground
    params ["_crate","_para"];
    _para setVectorUp [0,0,1];
    _crate setVectorUp [0,0,1];
    ((((position _crate) select 2) < 5) || (isNil "_para"));
  },
  {
    [ // start monitoring
      {
        params ["_crate","_para"];
        ((getPos _crate) select 2) < 2 ||
        ((velocity _crate) select 2) > -0.2 ||
        isNull _para ||
        (count (lineIntersectsWith [getPosASL _crate, (getPosASL _crate) vectorAdd [0, 0, -0.5], _crate, _para])) > 0
      },
      {
        params ["_crate","_para"];
        _crate allowDamage false;
        _para disableCollisionWith _crate;
        _crate setVectorUp [0,0,1];
        // _crate setVelocity [-2,0,-0.5];
        detach _crate;
        _safePos = ((getPos _crate) select [0, 2]) findEmptyPosition [0, 50, "Land_Offices_01_V1_F"];
        if (count _safePos > 0) then {
          _safePos set [2, 0.6];
          _crate setPos _safePos;
        };

        // make box vulnerable to damage again after 10 seconds
        [{_this allowDamage true}, _crate, 10] call CBA_fnc_waitAndExecute;
      },
      _this
    ] call CBA_fnc_waitUntilAndExecute;
  },
  [_crate, _para]
] call CBA_fnc_waitUntilAndExecute;


[
  {
    params ["_crate","_para"];
    (getPos _crate) select 2 == 0;
  },
  {
    params ["_crate","_para"];
    // add smoke/flare/chemlights to aid in retrieval
    // _crate = cursorObject;
    (boundingBoxReal _crate) params ["_min", "_max", "_diameter"];
    private _midHeight = (_min#2 + _max#2) / 2;
    _crateCorners = [
      [_min#0, _min#1, _midHeight],
      [_min#0, _max#1, _midHeight],
      [_max#0, _min#1, _midHeight],
      [_max#0, _max#1, _midHeight]
    ];

    private _attachedAids = [];
    if !(fnf_environment_isDaytime) then {
      // if nighttime, chemlights
      {
        _chemlight = "ACE_G_Chemlight_HiYellow_infinite" createVehicle (_crate modelToWorld _x);
        // _chemlight attachTo [_crate, _x];
        _attachedAids pushBack _chemlight;
      } forEach _crateCorners;
    };
    // _crate setVariable ["attachedAids", _attachedAids];
    [{
      {
        deleteVehicle _x;
      } forEach (_this select {!isNull _x});
    }, _attachedAids, 300] call CBA_fnc_waitAndExecute;
  },
  [_crate, _para]
] call CBA_fnc_waitUntilAndExecute;
