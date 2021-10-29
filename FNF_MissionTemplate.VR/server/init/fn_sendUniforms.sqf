/*
Sends base uniform and helmet classes to clients for each present side
*/

if (isNil "pRole") then {pRole = 99999;};

_sidePresent = {
  _this countSide (call BIS_fnc_listPlayers) > 0
};


_getLoadoutFromConfig = {
  params ["_uniformVar", "_gearVar"];

  #define CFGUNIFORM missionConfigFile >> "CfgLoadouts" >> "UNIFORMS"
  #define CFGGEAR missionConfigFile >> "CfgLoadouts" >> "GEAR"

  private _uniformMeta = [
    configName (CFGUNIFORM >> _uniformVar),
    (CFGUNIFORM >> _uniformVar >> "description") call BIS_fnc_getCfgData,
    (CFGUNIFORM >> _uniformVar >> "author") call BIS_fnc_getCfgData
  ];

  private _headgear = [
    selectRandom((CFGUNIFORM >> _uniformVar >> "BASE" >> "headgear") call BIS_fnc_getCfgDataArray),
    selectRandom((CFGUNIFORM >> _uniformVar >> "BASE" >> "headgear") call BIS_fnc_getCfgDataArray),
    selectRandom((CFGUNIFORM >> _uniformVar >> "SL" >> "headgear") call BIS_fnc_getCfgDataArray)
  ];
  private _vest = [
    selectRandom((CFGUNIFORM >> _uniformVar >> "BASE" >> "vest") call BIS_fnc_getCfgDataArray),
    selectRandom((CFGUNIFORM >> _uniformVar >> "BASE" >> "vest") call BIS_fnc_getCfgDataArray),
    selectRandom((CFGUNIFORM >> _uniformVar >> "SL" >> "vest") call BIS_fnc_getCfgDataArray)
  ];
  private _uniform = [
    selectRandom((CFGUNIFORM >> _uniformVar >> "BASE" >> "uniform") call BIS_fnc_getCfgDataArray),
    selectRandom((CFGUNIFORM >> _uniformVar >> "BASE" >> "uniform") call BIS_fnc_getCfgDataArray),
    selectRandom((CFGUNIFORM >> _uniformVar >> "SL" >> "uniform") call BIS_fnc_getCfgDataArray)
  ];




  private _gearMeta = [
    configName (CFGGEAR >> _gearVar),
    (CFGGEAR >> _gearVar >> "description") call BIS_fnc_getCfgData,
    (CFGGEAR >> _gearVar >> "author") call BIS_fnc_getCfgData
  ];

  // Main weapons
  private _rifles = (CFGGEAR >> _gearVar >> "BASE" >> "weaponChoices") call BIS_fnc_getCfgDataArray;
  _rifles = flatten (_rifles apply {_x # 0});
  {
    {
      _rifles pushBackUnique _x;
    } forEach (_x # 0);
  } forEach ((CFGGEAR >> _gearVar >> "CE" >> "weaponChoices") call BIS_fnc_getCfgDataArray);
  private _sidearm = (CFGGEAR >> _gearVar >> "BASE" >> "sidearms") call BIS_fnc_getCfgDataArray;
  _sidearm = flatten (_sidearm apply {_x # 0});

  // Support weapons
  private _AR = (CFGGEAR >> _gearVar >> "AR" >> "weaponChoices") call BIS_fnc_getCfgDataArray;
  _AR = flatten (_AR apply {_x # 0});
  private _MG = (CFGGEAR >> _gearVar >> "MG" >> "weaponChoices") call BIS_fnc_getCfgDataArray;
  _MG = flatten (_MG apply {_x # 0});

  // AT
  private _AT = (CFGGEAR >> _gearVar >> "LAT" >> "launchers") call BIS_fnc_getCfgDataArray;
  _AT = _AT apply {_x # 0};

  // Recon
  private _SNP = (CFGGEAR >> _gearVar >> "SNP" >> "weaponChoices") call BIS_fnc_getCfgDataArray;
  _SNP = flatten (_SNP apply {_x # 0});
  private _RIS = (CFGGEAR >> _gearVar >> "RIS" >> "weaponChoices") call BIS_fnc_getCfgDataArray;
  _RIS = flatten (_RIS apply {_x # 0});

  // Crew & Pilot
  private _CR = (CFGGEAR >> _gearVar >> "CR" >> "weaponChoices") call BIS_fnc_getCfgDataArray;
  _CR = flatten (_CR apply {_x # 0});

  [
    _uniformMeta,
    _uniform,
    _vest,
    _headgear,
    _gearMeta,
    [
      ["rifle", _rifles],
      ["sidearm", _sidearm],
      ["AR", _AR],
      ["MG", _MG],
      ["AT", _AT],
      ["SNP", _SNP],
      ["RIS", _RIS],
      ["CR", _CR]
    ]
  ]
};


{
  private ["_optionLabel", "_varLabel"];

  switch (_x) do {
    case east: {
      _optionLabel = "opfor";
      _varLabel = "east";
    };
    case west: {
      _optionLabel = "blufor";
      _varLabel = "west";
    };
    case independent: {
      _optionLabel = "indfor";
      _varLabel = "ind";
    };
  };

  private _sideUniform = missionNamespace getVariable ("phx_" + _optionLabel + "Uniform");
  private _sideGear = missionNamespace getVariable ("phx_" + _optionLabel + "Gear");

  _parsedSet = [_sideUniform, _sideGear] call _getLoadoutFromConfig;
  _parsedSet params ["_uniformMeta", "_uniform", "_vest", "_headgear", "_gearMeta", "_gearList"];

  missionNamespace setVariable [
    ("phx_briefing_" + _varLabel + "_uniformMeta"),
    _uniformMeta,
    true
  ];
  missionNamespace setVariable [
    ("phx_briefing_" + _varLabel + "_uniform"),
    _uniform,
    true
  ];
  missionNamespace setVariable [
    ("phx_briefing_" + _varLabel + "_vest"),
    _vest,
    true
  ];
  missionNamespace setVariable [
    ("phx_briefing_" + _varLabel + "_headgear"),
    _headgear,
    true
  ];

  missionNamespace setVariable [
    "phx_briefing_" + _varLabel + "_loadout",
    [_gearMeta, _gearList],
    true
  ];

} forEach ([east, west, independent] select {_x call _sidePresent});


// if (east call _sidePresent) then {

//   _parsedSet = [phx_opforUniform, phx_opforGear] call _getLoadoutFromConfig;
//   _parsedSet params ["_uniformMeta", "_uniform", "_headgear", "_gearMeta", "_gearList"];

//   missionNamespace setVariable ["phx_briefing_east_uniformMeta", _uniform, true];
//   missionNamespace setVariable ["phx_briefing_east_uniform", _uniform, true];
//   missionNamespace setVariable ["phx_briefing_east_headgear", _headgear, true];

//   _loadout = missionNamespace getVariable format["%1_GEAR", phx_opforGear];
//   missionNamespace setVariable ["phx_briefing_east_loadout", _weaponChoices, true];
// };

// if (west call _sidePresent) then {
//   _parsedSet = [phx_bluforUniform, phx_bluforGear] call _getLoadoutFromConfig;
//   _parsedSet params ["_uniformMeta", "_uniform", "_headgear", "_gearMeta", "_gearList"];

//   missionNamespace setVariable ["phx_briefing_west_uniformMeta", _uniform, true];
//   missionNamespace setVariable ["phx_briefing_west_uniform", _uniform, true];
//   missionNamespace setVariable ["phx_briefing_west_headgear", _headgear, true];

//   _loadout = missionNamespace getVariable format["%1_GEAR", phx_bluforGear];
//   missionNamespace setVariable ["phx_briefing_west_loadout", _weaponChoices, true];
//   "debug_console" callExtension str(_weaponChoices);
// };

// if (independent call _sidePresent) then {
//   _parsedSet = [phx_independentUniform, phx_independentGear] call _getLoadoutFromConfig;
//   _parsedSet params ["_uniformMeta", "_uniform", "_headgear", "_gearMeta", "_gearList"];

//   missionNamespace setVariable ["phx_briefing_ind_uniformMeta", _uniform, true];
//   missionNamespace setVariable ["phx_briefing_ind_uniform", _uniform, true];
//   missionNamespace setVariable ["phx_briefing_ind_headgear", _headgear, true];

//   _loadout = missionNamespace getVariable format["%1_GEAR", phx_independentGear];
//   missionNamespace setVariable ["phx_briefing_ind_loadout", [_gearMeta, _gearList], true];
// };
