_displayToClose = findDisplay 5000; _displayToClose closeDisplay 1;

createDialog "FNFAssetMenu";

assetSelected = nil;
removeAssetSelected = nil;

_display = findDisplay 6000;

_assetsControl = _display displayCtrl 6001;
_spawnedAssetsControl = _display displayCtrl 6002;

switch (side player) do {
  case west: {
    {
      _assetsControl lbAdd (_x select 0) + " - " + str(_x select 1) + " points";
    } forEach bluforAssetList;

    {
        _spawnedAssetsControl lbAdd (typeOf _x);
    } forEach currentAssetsBlu;
  };
  case east: {
    {
      _assetsControl lbAdd (_x select 0) + " - " + str(_x select 1) + " points";
    } forEach opforAssetList;

    {
        _spawnedAssetsControl lbAdd (typeOf _x);
    } forEach currentAssetsOpf;
  };
  case independent: {
    {
      _assetsControl lbAdd (_x select 0) + " - " + str(_x select 1) + " points";
    } forEach indforAssetList;

    {
        _spawnedAssetsControl lbAdd (typeOf _x);
    } forEach currentAssetsInd;
  };
};

_assetsSelect =  _assetsControl ctrlAddEventHandler  ["LBSelChanged",{
  params ["_control", "_selectedIndex"];

  switch (side player) do {
    case east: {
      assetSelected = (opforAssetList select _selectedIndex);
    };
    case west: {
      assetSelected = (bluforAssetList select _selectedIndex);
    };
    case independent: {
      assetSelected = (indforAssetList select _selectedIndex);
    };
  };
}];

_assetRemove =  _spawnedAssetsControl ctrlAddEventHandler  ["LBSelChanged",{
  params ["_control", "_selectedIndex"];

  switch (side player) do {
    case east: {
      removeAssetSelected = (currentAssetsOpf select _selectedIndex);
    };
    case west: {
      removeAssetSelected = (currentAssetsBlu select _selectedIndex);
    };
    case independent: {
      removeAssetSelected = (currentAssetsInd select _selectedIndex);
    };
  };
}];

switch (side player) do {
  case east: {
    ctrlSetText [6100, format["Points Remaining: %1", opforPointPool]];
    sidePoints = opforPointPool;
  };
  case west: {
    ctrlSetText [6100, format["Points Remaining: %1", bluforPointPool]];
    sidePoints = bluforPointPool;
  };
  case independent: {
    ctrlSetText [6100, format["Points Remaining: %1", indforPointPool]];
    sidePoints = indforPointPool;
  };
};
