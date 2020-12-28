_numberOfSectors = 1; //Number of active sectors (1-3)

_pointAddTime = 12; //How often points are added (seconds)

//Points will be added more slowly if there are more sectors to control
switch (_numberOfSectors) do {
  case 2: {_pointAddTime = _pointAddTime * 1.3};
  case 3: {_pointAddTime = _pointAddTime * 1.7};
};

/*
Neutral sector control mode. Can choose between 1-3 sectors. First team to 100 points wins.
Only infantry can capture sectors.

1 sector = phx_sector1
2 sectors = phx_sector1 & phx_sector2
3 sectors = phx_sector1 & phx_sector2 & phx_sector3

Usage:
1. Choose how many sectors you want with the var _numberOfSectors.
2. Adjust the _pointAddTime if you wish.
3. Move the objects phx_sector1, phx_sector2 and phx_sector3 to where you want. Adjust sector size if wanted.
*/
