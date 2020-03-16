_sidePoints = 0;

switch (side player) do {
  case east: {_sidePoints = opforPointPool;};
  case west: {_sidePoints = bluforPointPool;};
  case independent: {_sidePoints = indforPointPool;};
};
if ((assetSelected select 1) > _sidePoints) exitwith {hint "Not enough points"};

_dum = assetSelected select 1;
if (isNil "_dum") exitwith {};

_display = findDisplay 6000;
_display closeDisplay 1;

_asset = _this select 0;
_class = _asset select 0;
_pos = _this select 1;
_vicSize = round (sizeOf _class);


_veh = _class createVehicleLocal [0,0,0];
_spawnPos = _pos findEmptyPosition [10, 125, _class];
_veh setPos _spawnPos;
vehSpawnLastGoodPosVics = _spawnPos;
_veh enableSimulation false;
_veh allowDamage false;

_cam = "camcurator" camCreate [position player select 0, position player select 1, 15];
_cam setVectorUp [0,0.75,0.01];
_cam switchCamera "INTERNAL";

player enableSimulation false;

_camHeight = 25;

["vehSpawnEH", "onEachFrame", {
  params ["_veh","_cam","_camHeight","_vicSize"];

  _veh setPos ([screenToWorld [0.5,0.5] select 0, screenToWorld [0.5,0.5] select 1, 0.5]);
  _camPos = position _cam;
  _camZ = _camPos select 2;
  _vehPos = position _veh;

  if (_camZ > _camHeight) then {
    _cam setPos [_camPos select 0, _camPos select 1, _camHeight];
  };
  if (_camZ < _camHeight) then {
    _cam setPos [_camPos select 0, _camPos select 1, _camHeight];
  };

  switch (side player) do {
    case east: {
      if (_vehPos inArea "opforSafeMarker") then {
        vehSpawnLastGoodPos = _vehPos;
      };
      if !(_vehPos inArea "opforSafeMarker") then {
        _veh setPos vehSpawnLastGoodPos;
      };
    };
    case west: {
      if (_vehPos inArea "bluforSafeMarker") then {
        vehSpawnLastGoodPos = _vehPos;
      };
      if !(_vehPos inArea "bluforSafeMarker") then {
        _veh setPos vehSpawnLastGoodPos;
      };
    };
    case independent: {
      if (_vehPos inArea "indforSafeMarker") then {
        vehSpawnLastGoodPos = _vehPos;
      };
      if !(_vehPos inArea "indforSafeMarker") then {
        _veh setPos vehSpawnLastGoodPos;
      };
    };
  };
}, [_veh,_cam,_camHeight,_vicSize]] call BIS_fnc_addStackedEventHandler;

veh = _veh;
cam = _cam;
vehKeyEH = findDisplay 46 displayAddEventHandler ["KeyDown", {
  [_this, veh, cam] call phx_fnc_createKeyPressed;
}];

switch (side player) do {
  case east: {
    sideSafeMarker = "opforSafeMarker";
  };
  case west: {
    sideSafeMarker = "bluforSafeMarker";
  };
  case independent: {
    sideSafeMarker = "indforSafeMarker";
  };
};

[_veh,_cam] spawn {
  params ["_veh","_cam"];
  waitUntil {!(position _cam inArea sideSafeMarker) || isNull _cam};

  if (isNull _cam) exitWith {};
  deleteVehicle _veh;
  _cam cameraEffect ["terminate","back"];
  camDestroy _cam;
  ["vehSpawnEH", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
  (findDisplay 46) displayRemoveEventHandler ["KeyDown",vehKeyEH];
  hint "Moved too far away";
  player switchCamera "INTERNAL";
  player enableSimulation true;
};
