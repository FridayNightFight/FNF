_key = (_this select 0) select 1;
_veh = _this select 1;
_cam = _this select 2;

if (_key == 16) then {
  _veh setDir ((getDir _veh) - 2.5);
};
if (_key == 18) then {
  _veh setDir ((getDir _veh) + 2.5);
};
if (_key == 1) then {
  [_veh,_cam] spawn {
    params ["_veh","_cam"];

    deleteVehicle _veh;
    _cam cameraEffect ["terminate","back"];
    camDestroy _cam;
    ["vehSpawnEH", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
    (findDisplay 46) displayRemoveEventHandler ["KeyDown",vehKeyEH];
    hint "Exited Spawning";
    player switchCamera "INTERNAL";
    player enableSimulation true;
  };
};
if (_key == 57) then {
  (findDisplay 46) displayRemoveEventHandler ["KeyDown",vehKeyEH];
  _pos = position _veh;
  _class = typeOf _veh;
  _dir = getDir _veh;
  deleteVehicle _veh;
  _cam cameraEffect ["terminate","back"];
  camDestroy _cam;
  _veh = createVehicle [_class, [_pos select 0, _pos select 1, 0]];
  _veh setDir _dir;

  clearItemCargoGlobal _veh;
  clearMagazineCargoGlobal _veh;
  clearBackpackCargoGlobal _veh;
  clearWeaponCargoGlobal _veh;
  _veh addItemCargoGlobal ["Toolkit", 1];

  _veh allowDamage false;

  switch (side player) do {
    case east: {
      opforPointPool = opforPointPool - (assetSelected select 1);
      publicVariable "opforPointPool";
      currentAssetsOpf pushBack _veh;
      publicVariable "currentAssetsOpf";
      hint format ["Asset Created\nPoints Remaining: %1", opforPointPool];
    };
    case west: {
      bluforPointPool = bluforPointPool - (assetSelected select 1);
      publicVariable "bluforPointPool";
      currentAssetsBlu pushBack _veh;
      publicVariable "currentAssetsBlu";
      hint format ["Asset Created\nPoints Remaining: %1", bluforPointPool];
    };
    case independent: {
      indforPointPool = indforPointPool - (assetSelected select 1);
      publicVariable "indforPointPool";
      currentAssetsInd pushBack _veh;
      publicVariable "currentAssetsInd";
      hint format ["Asset Created\nPoints Remaining: %1", indforPointPool];
    };
  };

  player enableSimulation true;
  ["vehSpawnEH", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
  player switchCamera "INTERNAL";

  execVM "f\ui\assetMenu.sqf";
};
