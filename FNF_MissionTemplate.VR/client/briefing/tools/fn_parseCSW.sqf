/*
* Author: IndigoFox
* Parses config.sqf settings (fnf_westAlphaAuxRole, fnf_westBravoAuxRole, etc) to generate diary string or structured text representing what's selected.
*
* Arguments:
* 0: The side to parse CSW settings for <SIDE>
* 1: (optional) default false: return diary string, true: return Structured Text
*
* Return Value:
* <STRING> or <Structured Text>
*
* Example:
* [west] call fnf_briefing_fnc_parseCSW
*
*
* Public: No
*/

#define COLOR1 "#944509"
#define COLOR2 "#FF8E38"
#define COLOR3 "#E0701B"
#define COLOR4 "#008394"
#define COLOR5 "#1BCAE0"

params ["_side", ["_structText", false]];

private _sideStr = str(_side);
private _squads = ["Alpha", "Bravo", "Charlie", "Delta"];
private _textOut = [];
{
  private _setting = _x;
  if (_x isEqualTo 0 || typeName _x != "ARRAY") then {
    if (!_structText) then {
      _textOut pushBack format["<font size='16' color='" + COLOR5 + "'>%1</font><br/>    Crewmen", _squads select _forEachIndex];
    } else {
      _textOut pushBack format["<t size='1.4' color='" + COLOR5 + "'>%1</t><br/>    Crewmen", _squads select _forEachIndex];
    };
  } else {
    if (count _setting > 0) then {
      private _cswPrimaryInfo = (_setting # 0) call fnf_briefing_fnc_getItemInfo;

      private _mags = [];
      {
        _mags pushBack ([_x, true] call fnf_briefing_fnc_notesItems);
      } forEach (_setting select {typeName _x == "ARRAY"});

      private _cswSecondaryName = "Ammo only";
      if (_setting # 1 != "") then {
        private _temp = (_setting # 1) call fnf_briefing_fnc_getItemInfo;
        _cswSecondaryName = [_temp, "displayName"] call BIS_fnc_getFromPairs;
      };

      if (!_structText) then {
        _textOut pushBack format [
          "<font size='16' color='" + COLOR5 + "'>%2</font><br/>    <font color='" + COLOR3 + "'>%3</font><br/>    <img width='120' image='%4'/><br/>    + %5<br/>    + %6",
          _side call BIS_fnc_sideName,
          _squads select _forEachIndex,
          [_cswPrimaryInfo, "displayName"] call BIS_fnc_getFromPairs,
          [_cswPrimaryInfo, "picture"] call BIS_fnc_getFromPairs,
          _cswSecondaryName,
          _mags joinString " "
        ];
      } else {
        _textOut pushBack format [
          "<t size='1.4' color='" + COLOR5 + "'>%2</t><br/>    <t color='" + COLOR3 + "'>%3</t><br/>    <img size='4' image='%4'/><br/>    + %5<br/>    + %6",
          _side call BIS_fnc_sideName,
          _squads select _forEachIndex,
          [_cswPrimaryInfo, "displayName"] call BIS_fnc_getFromPairs,
          [_cswPrimaryInfo, "picture"] call BIS_fnc_getFromPairs,
          _cswSecondaryName,
          _mags joinString " "
        ];
      };
    };
  };
} forEach [
  missionNamespace getVariable [format["fnf_%1AlphaAuxRole",_sideStr], 0],
  missionNamespace getVariable [format["fnf_%1BravoAuxRole",_sideStr], 0],
  missionNamespace getVariable [format["fnf_%1CharlieAuxRole",_sideStr], 0],
  missionNamespace getVariable [format["fnf_%1DeltaAuxRole",_sideStr], 0]
];

_textOut pushBack "<br/>";
_textOut joinString "<br/>"
