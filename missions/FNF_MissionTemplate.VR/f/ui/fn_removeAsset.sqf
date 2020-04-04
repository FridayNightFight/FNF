_dum = _this select 0;
if (isNil "_dum") exitwith {};

_vehDelete = removeAssetSelected;

_points = 0;

switch (playerSide) do {
  case east: {
    currentAssetsOpf deleteAt (currentAssetsOpf find removeAssetSelected);
    publicVariable "currentAssetsOpf";

    {
      _index = _x find (typeOf removeAssetSelected);
      if !(_index == -1) then {
        _points = _x select 1;
      };
    } forEach opforAssetList;

    opforPointPool = opforPointPool + _points;
    publicVariable "opforPointPool";

    ctrlSetText [6100, format["Points Remaining: %1", opforPointPool]];
  };
  case west: {
    currentAssetsBlu deleteAt (currentAssetsBlu find removeAssetSelected);
    publicVariable "currentAssetsBlu";

    {
      _index = _x find (typeOf removeAssetSelected);
      if !(_index == -1) then {
        _points = _x select 1;
      };
    } forEach bluforAssetList;

    bluforPointPool = bluforPointPool + _points;
    publicVariable "bluforPointPool";

    ctrlSetText [6100, format["Points Remaining: %1", bluforPointPool]];
  };
  case independent: {
    currentAssetsInd deleteAt (currentAssetsInd find removeAssetSelected);
    publicVariable "currentAssetsInd";

    {
      _index = _x find (typeOf removeAssetSelected);
      if !(_index == -1) then {
        _points = _x select 1;
      };
    } forEach indforAssetList;

    indforPointPool = indforPointPool + _points;
    publicVariable "indforPointPool";

    ctrlSetText [6100, format["Points Remaining: %1", indforPointPool]];
  };
};

lbClear 6002;

_display = findDisplay 6000;
_spawnedAssetsControl = _display displayCtrl 6002;

switch (playerSide) do {
  case east: {
    {
        _spawnedAssetsControl lbAdd getText (configFile >> "cfgVehicles" >> typeOf _x >> "displayName");
    } forEach currentAssetsOpf;
  };
  case west: {
    {
        //_spawnedAssetsControl lbAdd (typeOf _x);
        _spawnedAssetsControl lbAdd getText (configFile >> "cfgVehicles" >> typeOf _x >> "displayName");
    } forEach currentAssetsBlu;
  };
  case independent: {
    {
        _spawnedAssetsControl lbAdd getText (configFile >> "cfgVehicles" >> typeOf _x >> "displayName");
    } forEach currentAssetsInd;
  };
};

if (lbSize 6002 > 0) then {
  lbSetCurSel [6002, 0];
};

deleteVehicle _vehDelete;

hint "Asset removed and points refunded";
