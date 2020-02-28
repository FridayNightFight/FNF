_displayToClose = findDisplay 5000; _displayToClose closeDisplay 1;

createDialog "FNFAssetMenu";

hintSilent "Asset Spawn Controls:\n\nWASD or Right Mouse = Move\nQ&E = Rotate\n\nSpace = Place\n\nESC = Exit";

assetSelected = nil;
removeAssetSelected = nil;

_display = findDisplay 6000;

_assetsControl = _display displayCtrl 6001;
_spawnedAssetsControl = _display displayCtrl 6002;

switch (side player) do {
  case west: {
    {
      _assetsControl lbAdd getText (configFile >> "cfgVehicles" >> (_x select 0) >> "displayName") + " - " + str(_x select 1) + " points";
    } forEach bluforAssetList;

    {
        //_spawnedAssetsControl lbAdd (typeOf _x);
        _spawnedAssetsControl lbAdd getText (configFile >> "cfgVehicles" >> typeOf _x >> "displayName");
    } forEach currentAssetsBlu;
  };
  case east: {
    {
      _assetsControl lbAdd (_x select 0) + " - " + str(_x select 1) + " points";
    } forEach opforAssetList;

    {
        _spawnedAssetsControl lbAdd getText (configFile >> "cfgVehicles" >> typeOf _x >> "displayName");
    } forEach currentAssetsOpf;
  };
  case independent: {
    {
      _assetsControl lbAdd (_x select 0) + " - " + str(_x select 1) + " points";
    } forEach indforAssetList;

    {
        _spawnedAssetsControl lbAdd getText (configFile >> "cfgVehicles" >> typeOf _x >> "displayName");
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
