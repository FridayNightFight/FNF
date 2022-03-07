params [["_side", sideEmpty, [sideEmpty]], ["_structText", false, [false]]];

private _sideUnloc = _side call BIS_fnc_sideNameUnlocalized;
if (_sideUnloc == "GUER") then {_sideUnloc = "IND"};
_uniformSetVarName = format["fnf_briefing_%1_uniformMeta", _sideUnloc];
_weaponSetVarName = format["fnf_briefing_%1_loadout", _sideUnloc];

_uniformSet = missionNamespace getVariable [_uniformSetVarName, [""]];
_weaponSet = missionNamespace getVariable [_weaponSetVarName, [[""]]];

// _arr pushBack _uniformSet;
// _arr pushBack [_uniformSet select 0, _weaponSet select 0 select 0];

_imageFolderName = format["%1--%2", _uniformSet select 0, _weaponSet select 0 select 0];

private _outText = "";

{
  private _roleAbbr = _x # 0;
  private _imagePath = format["fnf_media\images\kits\%1\%2.paa", _imageFolderName, _roleAbbr];
  if (fileExists _imagePath) then {
    if !(_structText) then {
      _outText = _outText + format[
        "<img image='%1' width='174'/>",
        _imagePath
      ];
    } else {
      _outText = _outText + format[
        "<img image='%1' size='11'/>",
        _imagePath
      ];
    };
    if ((_forEachIndex + 1) % 2 == 0) then {_outText = _outText + "<br/>"};
  };
} forEach fnf_loadout_roles;


if (count _outText > 0) then {
  _outText;
} else {
  false;
};
