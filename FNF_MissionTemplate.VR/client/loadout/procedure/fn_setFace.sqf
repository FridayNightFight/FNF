/*
  this script runs clientside and, based on the uniform their side is wearing, will
  assign their unit a white or asian face available from Prairie Fire

  this is called from the applyLoadout script
  this will only run if a VN uniform set is in use
*/

if (mySideUniformSelection find "VN_" == -1) exitWith {};
switch (true) do {
  case (mySideUniformSelection find "_US_" > -1): {
    // US uniforms will use VN White faces
    _USFaces = "configName _x find 'vn' == 0 && configName _x find 'WhiteHead' > -1" configClasses (configFile >> "CfgFaces" >> "Man_A3") apply {
      [configName _x, getText (_x >> "displayName")]
    };
    private _myFace = selectRandom(_USFaces);
    _myFace params ["_faceCfgName", "_faceDisplayName"];
    diag_log text format["[FNF] (loadout) INFO: Assigned face ""%1""", _faceDisplayName];
    [player, _faceCfgName] remoteExec ["setFace", 0, player];
  };
  case (mySideUniformSelection find "_FR_" > -1): {
    // FR uniforms will use vanilla + VN Livonian faces
    _FRFaces = "configName _x find 'LivonianHead' > -1" configClasses (configFile >> "CfgFaces" >> "Man_A3") apply {
      [configName _x, getText (_x >> "displayName")]
    };
    private _myFace = selectRandom(_FRFaces);
    _myFace params ["_faceCfgName", "_faceDisplayName"];
    diag_log text format["[FNF] (loadout) INFO: Assigned face ""%1""", _faceDisplayName];
    [player, _faceCfgName] remoteExec ["setFace", 0, player];
  };
  default {
    // Anything else will use VN Asian faces
    _VCFaces = "configName _x find 'vn' == 0 && configName _x find 'AsianHead' > -1" configClasses (configFile >> "CfgFaces" >> "Man_A3") apply {
      [configName _x, getText (_x >> "displayName")]
    };
    private _myFace = selectRandom(_VCFaces);
    _myFace params ["_faceCfgName", "_faceDisplayName"];
    diag_log text format["[FNF] (loadout) INFO: Assigned face ""%1""", _faceDisplayName];
    [player, _faceCfgName] remoteExec ["setFace", 0, player];
  };
};
