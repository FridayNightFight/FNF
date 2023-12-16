/*
	Author: Mallen

	Description:
		Generates lobby description based on modules and assets placed

	Parameter(s):
	  None

	Returns:
		None
*/

_defenceNameTypes = ["def", "pro"];

_allEntities = all3DENEntities;
_allObjects = _allEntities select 0;
_allSystems = _allEntities select 3;

_fnfModules = [];

{
  _logicName = typeOf _x;
  if (_logicName find "fnf_module_" isNotEqualTo -1) then
  {
    _fnfModules pushBack _x;
  };
} forEach _allSystems;

_objectives = [];

{
  if ((typeOf _x) find "Obj" isNotEqualTo -1) then
  {
    _objectives pushBack _x;
  };
} forEach _fnfModules;

_outputText = "";
_objExtract = [];
_destroyCount = 0;
_sectorCount = 0;
_terminalCount = 0;
_assassinCount = 0;

{
  _objType = (_x get3DENAttribute "fnf_objectiveType") select 0;
  _defenceObj = false;
  if (_defenceNameTypes find _objType isNotEqualTo -1) then
  {
    _defenceObj = true;
  };

  _connections = get3DENConnections _x;
  _side = sideUnknown;
  _blufor = _connections findIf {_type = typeOf (_x select 1); _type isEqualTo "SideBLUFOR_F"};
  _opfor = _connections findIf {_type = typeOf (_x select 1); _type isEqualTo "SideOPFOR_F"};
  _indfor = _connections findIf {_type = typeOf (_x select 1); _type isEqualTo "SideResistance_F"};
  if (_blufor isNotEqualTo -1) then {_side = west};
  if (_opfor isNotEqualTo -1) then {_side = east};
  if (_indfor isNotEqualTo -1) then {_side = independent};

  _moduleType = typeOf _x;
  switch (_moduleType) do {
    case "fnf_module_destroyObj": {_destroyCount = _destroyCount + 1;};
    case "fnf_module_sectorCaptureObj": {_sectorCount = _sectorCount + 1;};
    case "fnf_module_terminalObj": {_terminalCount = _terminalCount + 1;};
    case "fnf_module_assassinObj": {_assassinCount = _assassinCount + 1;};
  };

  _objExtract pushBack [_side, _defenceObj];
} forEach _objectives;

if (_destroyCount isNotEqualTo 0) then
{
  _outputText = "Destroy(" + str(_destroyCount / 2) + "), ";
};
if (_sectorCount isNotEqualTo 0) then
{
  _outputText = _outputText + "Sector(" + str(_sectorCount / 2) + "), ";
};
if (_terminalCount isNotEqualTo 0) then
{
  _outputText = _outputText + "Terminal(" + str(_terminalCount / 2) + "), ";
};
if (_assassinCount isNotEqualTo 0) then
{
  _outputText = _outputText + "Assassin(" + str(_assassinCount / 2) + "), ";
};

_outputText = _outputText trim [", ", 2];

_outputText = _outputText + " // ATK: ";
_atkSide = [sideUnknown, "NONE"];
_defSide = [sideUnknown, "NONE"];

_westAtkCount = {_x select 1 isEqualTo false and _x select 0 isEqualTo west} count _objExtract;
_eastAtkCount = {_x select 1 isEqualTo false and _x select 0 isEqualTo east} count _objExtract;
_indiAtkCount = {_x select 1 isEqualTo false and _x select 0 isEqualTo independent} count _objExtract;
if (_westAtkCount > _eastAtkCount and _westAtkCount > _indiAtkCount) then {_outputText = _outputText + "BLU X% adv - DEF:"; _atkSide = [west, "BLU"];};
if (_eastAtkCount > _westAtkCount and _eastAtkCount > _indiAtkCount) then {_outputText = _outputText + "OPF X% adv - DEF:"; _atkSide = [east, "OPF"];};
if (_indiAtkCount > _eastAtkCount and _indiAtkCount > _westAtkCount) then {_outputText = _outputText + "IND X% adv - DEF:"; _atkSide = [independent, "IND"];};

_westDefCount = {_x select 1 isEqualTo true and _x select 0 isEqualTo west} count _objExtract;
_eastDefCount = {_x select 1 isEqualTo true and _x select 0 isEqualTo east} count _objExtract;
_indiDefCount = {_x select 1 isEqualTo true and _x select 0 isEqualTo independent} count _objExtract;
if (_westDefCount > _eastDefCount and _westDefCount > _indiDefCount) then {_outputText = _outputText + "BLU //"; _defSide = [west, "BLU"];};
if (_eastDefCount > _westDefCount and _eastDefCount > _indiDefCount) then {_outputText = _outputText + "OPF //"; _defSide = [east, "OPF"];};
if (_indiDefCount > _eastDefCount and _indiDefCount > _westDefCount) then {_outputText = _outputText + "IND //"; _defSide = [independent, "IND"];};

_assetModules = [];
{
  if ((typeOf _x) find "breifingAssets" isNotEqualTo -1) then
  {
    _assetModules pushBack _x;
  };
} forEach _fnfModules;

_defVics = [];
_atkVics = [];

{
  _connections = get3DENConnections _x;
  _side = sideUnknown;
  _assetCountsLocal = [];

  {
    _assetType = typeOf (_x select 1);
    if (_assetType isEqualTo "SideBLUFOR_F") then {_side = west; continue;};
    if (_assetType isEqualTo "SideOPFOR_F") then {_side = east; continue;};
    if (_assetType isEqualTo "SideResistance_F") then {_side = independent; continue;};

    _displayName = getText (configFile >> "CfgVehicles" >> _assetType >> "displayName");

    _result = _assetCountsLocal findIf {_x select 0 isEqualTo _displayName};
    if (_result isNotEqualTo -1) then
    {
      _assetCountsLocal select _result set [1, (_assetCountsLocal select _result select 1) + 1];
    } else {
      _assetCountsLocal pushBack [_displayName, 1];
    };
  } forEach _connections;

  if (_side isEqualTo (_atkSide select 0)) then
  {
    {
      _currentName = _x select 0;
      _result = _atkVics findIf {_x select 0 isEqualTo _currentName};
      if (_result isNotEqualTo -1) then
      {
        _atkVics select _result set [1, (_atkVics select _result select 1) + (_x select 1)];
      } else {
        _atkVics pushBack [_currentName, (_x select 1)];
      };
    } forEach _assetCountsLocal;
  };
  if (_side isEqualTo (_defSide select 0)) then
  {
    {
      _currentName = _x select 0;
      _result = _defVics findIf {_x select 0 isEqualTo _currentName};
      if (_result isNotEqualTo -1) then
      {
        _defVics select _result set [1, (_defVics select _result select 1) + (_x select 1)];
      } else {
        _defVics pushBack [_currentName, (_x select 1)];
      };
    } forEach _assetCountsLocal;
  };
} forEach _assetModules;

_atkMAT = [];
_defMAT = [];

{
  _description = (_x get3DENAttribute "description") select 0;

  if (_description isEqualTo "Missile Specialist@Echo") then
  {
    if (side _x isEqualTo (_atkSide select 0)) then
    {
      _atkMAT pushBack _x;
    };
    if (side _x isEqualTo (_defSide select 0)) then
    {
      _defMAT pushBack _x;
    };
  };
} forEach _allObjects;

_outputText = _outputText + " " + (_atkSide select 1) + ": ";

{
  _outputText = _outputText + str(_x select 1) + "x" + (_x select 0) + ", ";
} forEach _atkVics;

if (count _atkVics isEqualTo 0) then
{
  _outputText = _outputText + "No Vics";
};

_outputText = _outputText trim [", ", 2];

if (count _atkMAT isNotEqualTo 0) then
{
  _weapon = secondaryWeapon (_atkMAT select 0);
  _displayName = getText (configFile >> "CfgWeapons" >> _weapon >> "displayName");
  _outputText = _outputText + " - MAT: " + _displayName;
};

_outputText = _outputText + " // " + (_defSide select 1) + ": ";

{
  _outputText = _outputText + str(_x select 1) + "x" + (_x select 0) + ", ";
} forEach _defVics;

if (count _defVics isEqualTo 0) then
{
  _outputText = _outputText + "No Vics";
};

_outputText = _outputText trim [", ", 2];

if (count _defMAT isNotEqualTo 0) then
{
  _weapon = secondaryWeapon (_defMAT select 0);
  _displayName = getText (configFile >> "CfgWeapons" >> _weapon >> "displayName");
  _outputText = _outputText + " - MAT: " + _displayName;
};

"Multiplayer" set3DENMissionAttribute ["IntelOverviewText", _outputText];
copyToClipboard _outputText;
