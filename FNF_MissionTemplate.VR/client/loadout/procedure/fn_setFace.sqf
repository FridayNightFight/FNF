/*
  this script runs clientside and, based on the uniform their side is wearing, will
  assign their unit a face based on uniform selection

  this is called from the applyLoadout script
*/

_possibleCategories = [
  "WhiteHead",
  "CamoHead",
  "LivonianHead",
  "GreekHead",
  "AsianHead",
  "AfricanHead",
  "TanoanHead",
  "PersianHead",
  "RussianHead",
  "vietnamese"
];

fnf_faces_categories = createHashMap;
{
  private _categoryName = _x;
  private _faces = [];
  private _searchString = format[
    "configName _x find '%1' > -1 && configName _x find 'sick' == -1",
    _categoryName
  ];

  if (mySideUniformSelection find "VN_" > -1) then {
    _searchString = format["%1 && configName _x find 'vn' == 0", _searchString];
  };

  _faces = _searchString configClasses (configFile >> "CfgFaces" >> "Man_A3") apply {
    [configName _x, getText (_x >> "displayName")]
  };

  (fnf_faces_categories getOrDefault [_categoryName, [], true]) pushBack _faces;
} forEach _possibleCategories;

fnf_faces_categories = fnf_faces_categories toArray false;
// fnf_faces_categories = [fnf_faces_categories, []] call CBA_fnc_hashCreate;
// text ([fnf_faces_categories] call CBA_fnc_encodeJson);


private "_primaryCategory";

switch (true) do {
  case (mySideUniformSelection find "_GER_" > -1);
  case (mySideUniformSelection find "_DE_" > -1);
  case (mySideUniformSelection find "_FRANCE_" > -1);
  case (mySideUniformSelection find "_FR_" > -1);
  case (mySideUniformSelection find "_BE_" > -1);
  case (mySideUniformSelection find "_AUSTRIA_" > -1);
  case (mySideUniformSelection find "_SWISS_" > -1);
  case (mySideUniformSelection find "_RHODESIA_" > -1);
  case (mySideUniformSelection find "_AUSTRALIA" > -1);
  case (mySideUniformSelection find "_ANZAC" > -1);
  case (mySideUniformSelection find "_UK_" > -1);
  case (mySideUniformSelection find "_CANADIAN_" > -1);
  case (mySideUniformSelection find "_US_" > -1): {_primaryCategory = "WhiteHead"};


  case (mySideUniformSelection find "_GREEKFORCES_" > -1);
  case (mySideUniformSelection find "_NL_" > -1);
  case (mySideUniformSelection find "_CROATIAN_" > -1);
  case (mySideUniformSelection find "_CZECHFORCES_" > -1);
  case (mySideUniformSelection find "_SERBIANFORCES_" > -1);
  case (mySideUniformSelection find "_YUGOSLAVIA_" > -1);
  case (mySideUniformSelection find "_ID_INSURGENTS_" > -1);
  case (mySideUniformSelection find "_BALKANLEAGUE_" > -1);
  case (mySideUniformSelection find "_AAF_" > -1);
  case (mySideUniformSelection find "_UKRAINIAN_" > -1): {_primaryCategory = "LivonianHead"};

  case (mySideUniformSelection find "_AFRICAN_" > -1): {_primaryCategory = "AfricanHead"};

  case (mySideUniformSelection find "_RU_" > -1);
  case (mySideUniformSelection find "_PL_" > -1): {_primaryCategory = "RussianHead"};

  case (mySideUniformSelection find "_MEC_" > -1);
  case (mySideUniformSelection find "_TRIBAL_" > -1);
  case (mySideUniformSelection find "_TURKISH_" > -1);
  case (mySideUniformSelection find "_IRANIAN_" > -1);
  case (mySideUniformSelection find "_AFGH_" > -1);
  case (mySideUniformSelection find "_IRAQI_INSURGENTS_" > -1);
  case (mySideUniformSelection find "_IRAQI_" > -1): {_primaryCategory = "PersianHead"};


  case (mySideUniformSelection find "_TAIWAN_" > -1);
  case (mySideUniformSelection find "_CHINA_" > -1);
  case (mySideUniformSelection find "_PATHETLAO" > -1);
  case (mySideUniformSelection find "_RLA" > -1);
  case (mySideUniformSelection find "_ROK" > -1);
  case (mySideUniformSelection find "_NAVSOG_" > -1): {_primaryCategory = "AsianHead"};

  case (mySideUniformSelection find "_PAVN_" > -1);
  case (mySideUniformSelection find "_NLF_" > -1);
  case (mySideUniformSelection find "_SVA_" > -1): {_primaryCategory = "vietnamese"};

  default {_primaryCategory = selectRandom (_possibleCategories)};
};

_primaryCats = fnf_faces_categories select {_x#0 find _primaryCategory > -1} apply {_x#1#0} select 0;
_otherCats = fnf_faces_categories select {_x#0 find _primaryCategory == -1} apply {_x#1#0} apply {selectRandom(_x)};

// demo of uniform and randomized face selections
// [selectRandom _primaryCats, selectRandom(_otherCats)];

// demo of randomization across 50 players
// _arr = [];
// for "_i" from 1 to 50 do {
//   _arr pushBack ([selectRandom _primaryCats, selectRandom(_otherCats)] selectRandomWeighted [0.8, 0.3]);
// };
// _arr


private _myFace = [selectRandom _primaryCats, selectRandom(_otherCats)] selectRandomWeighted [0.8, 0.15];
_myFace params ["_faceCfgName", "_faceDisplayName"];
diag_log text format["[FNF] (loadout) INFO: Assigned face ""%1""", _faceDisplayName];
[player, _faceCfgName] remoteExec ["setFace", 0, player];
