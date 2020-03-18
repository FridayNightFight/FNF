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

  [[_class,[_pos select 0, _pos select 1, 0],_dir,side player,assetSelected],{
    params ["_class","_pos","_dir","_side","_assetSelected"];

    _veh = createVehicle [_class, _pos];
    _veh setDir _dir;
    _veh execVM "f\ui\vicSpawnInit.sqf";

    switch (_side) do {
      case east: {
        opforPointPool = opforPointPool - (_assetSelected select 1);
        publicVariable "opforPointPool";
        currentAssetsOpf pushBack _veh;
        publicVariable "currentAssetsOpf";
      };
      case west: {
        bluforPointPool = bluforPointPool - (_assetSelected select 1);
        publicVariable "bluforPointPool";
        currentAssetsBlu pushBack _veh;
        publicVariable "currentAssetsBlu";
      };
      case independent: {
        indforPointPool = indforPointPool - (_assetSelected select 1);
        publicVariable "indforPointPool";
        currentAssetsInd pushBack _veh;
        publicVariable "currentAssetsInd";
      };
    };
  }] remoteExec ["BIS_fnc_call", 2, false];

  player enableSimulation true;
  ["vehSpawnEH", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
  player switchCamera "INTERNAL";

  execVM "f\ui\assetMenu.sqf";
};
